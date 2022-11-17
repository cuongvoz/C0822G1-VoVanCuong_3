CREATE DATABASE student_management;
USE student_management;

create table student (
id int auto_increment primary key,
name varchar(45),
gender bit,
birthday date,
email varchar(45),
point int,
username varchar(45),
class_id int ,
foreign key(class_id) references class(id)
);

create table class(
id int auto_increment primary key,
class_name varchar(45));

create table instructor(
id int auto_increment primary key,
name varchar(45),
birthday date,
salary int);

create table instructor_class(
instructor_id int,
class_id int,
primary key(instructor_id,class_id),
foreign key(instructor_id) references instructor(id),
foreign key(class_id) references class(id),
start_time datetime);
 
 drop table instructor_class;
 drop table student;

insert into student(name,gender,birthday,point,username,class_id) 
                                 values
                                 ('nguyen ngoc cu',1,'1981-12-12',8,'cunn',1),
                                 ('le hai chung',1,'1981-12-12',5,'chunglh',1),
                                 ('hoang huu hoan',1,'1990-12-12',6,'hoanhh',2),
                                 ('dau_dung',1,'1987-12-12',8,'dungd',1),
                                 ('ta dinh huynh',1,'1987-12-12',7,'huynhtd',2),
                                 ('nguyen minh hai',1,'1989-12-12',9,'hainm',1),
                                 ('tran van nam',1,'1981-12-12',4,'namtv',2),
                                 ('vo minh hieu',1,'1981-12-12',3,'hieuvm',1),
                                 ('le xuan ky',1,'1981-12-12',7,'kynx',2),
                                 ('le minh vu',1,'1981-12-12',7,'vulm',1);
                                 
insert into student(name,gender,birthday,point) 
					    	values ('nguyen van a',1,'1981-12-12',8),                                
							       ('tran van b',1,'1981-12-12',5);    
                                   
insert into class(class_name) values 
                                   ('c1121g1'),                                  
                                   ('c1221g1'),                                  
                                   ('a0821i1'),                                  
                                   ('a0921i1');
                                   
insert into instructor(name,birthday,salary) values
     ('tran van chanh','1985-03-02',100),                                   
     ('tran minh chien','1985-03-02',200),                                   
     ('vu thanh tien','1985-03-02',300),                                   
     ('tran van nam','1985-12-12',100);
    
insert into instructor_class(instructor_id,class_id) values 
                                 (1,1),   
                                 (1,2),    
                                 (1,3),    
                                 (2,1),    
                                 (2,2),    
                                 (2,3);    
    
select * from instructor;                           
select * from instructor_class;                           
select * from class;                           
select * from student;            

--  Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp               
select c.class_name,count(s.class_id) as 'so luong' from class c join student s on s.class_id = c.id
 group by c.class_name;

--    Tính điểm lớn nhất của mỗi các lớp
select c.class_name ,max(point) as 'diem cao nhat' from class c join student s 
on c.id = s.class_id  group by class_name;     

-- Tình điểm trung bình  của từng lớp
select c.class_name, avg(point) as 'diem trung binh' from class c join student s on
c.id = s.class_id group by c.class_name;      

-- Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym.
select name , birthday from instructor union                
select name , birthday from student;          

--    Lấy ra top 3 học viên có điểm cao nhất của trung tâm.
select name,point from student where point >= 8 limit 3;


--   Lấy ra các học viên có điểm số là cao nhất của trung tâm.
select name,point from student where point >= 8;          