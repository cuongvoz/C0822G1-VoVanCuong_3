create database `student-management`;
use `student-management`;
create table `student-management`.`class`(
  `id` INT AUTO_INCREMENT, 
  `name` varchar(255), 
  PRIMARY KEY(`id`)
);
create table `student-management`.`teacher`(
  `id` int auto_increment, 
  `name` varchar(255), 
  `age` int, 
  `country` varchar(255), 
  PRIMARY KEY(`id`)
);

