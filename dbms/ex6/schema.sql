drop database if exists ex6;
create database ex6;
use ex6;

create table dept (
	dno int primary key auto_increment,
	dname varchar(20),
	loc varchar(20));

create table empl (
	eno int primary key auto_increment,
	ename varchar(20),
	sex char,
	sal int,
	addr varchar(20),
	dno int,
	foreign key(dno) references dept(dno));
