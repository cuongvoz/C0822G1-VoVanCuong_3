create database quan_li_sinh_vien;
use quan_li_sinh_vien;
create table class(
class_id int auto_increment primary key,
class_name varchar(45),
startdate date ,
status bit);

create table student(
student_id int auto_increment primary key,
student_name varchar(45),
address varchar(45),
phone int,
`status` bit,
class_id int,
foreign key(class_id) references class(class_id));
drop table student;

drop table student;

create table subject(
sub_id int auto_increment primary key,
sub_name varchar(45),
credits int,
`status` bit);

create table mark(
mark_id int auto_increment primary key,
sub_id int,
student_id int,
mark int,
examtimes int);

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (student_name, Address, Phone, Status, Class_Id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, Address, Status, Class_Id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name, Address, Phone, Status, Class_Id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO Mark (Sub_Id, Student_Id, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
       
SELECT student_name,Student_Name, Sub_Name, Mark
FROM Student  join Mark on Student.Student_Id = Mark.Student_Id join Subject on Mark.Sub_Id = subject.Sub_Id
WHERE Subject.sub_name = 'CF';