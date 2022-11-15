create database quan_li_sinh_vien;
use quan_li_sinh_vien;
create table class(
`class_id` int auto_increment primary key,
`class_name` varchar(60) not null,
`start_date` datetime not null,
`status` bit
);

create table student(
student_id int auto_increment primary key,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
stutus bit,
class_id int not null
);

create table subject(
sub_id int auto_increment primary key,
sub_name varchar(30) not null,
credit tinyint not null default 1,
`status` bit default 1,
check(credit >= 1)
);

create table mark(
mark_id int auto_increment primary key,
sub_id int,
student_id varchar(50),
mark float default 0 check(mark between 0 and 100),
examtimes tinyint default 1
);



