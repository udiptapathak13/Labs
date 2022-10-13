drop database if exists ex4;
create database ex4;
use ex4;

create table employee (
    fname varchar(20) not null, 
    mint char, 
    lname varchar(20) not null,
    ssn int not null, 
    bdate date,
    addr varchar(20),
    sex char, 
    salary int, 
    superssn int, 
    dno int
);

create table department (
    dname varchar(20) not null,
    dno int not null,
    mgrssn int not null,
    mgrsdate date not null,
    dloc varchar(20) not null
);

create table project (
    pname varchar(20),
    pno int not null,
    ploc varchar(20) not null,
    dno int not null
);

create table workson (
    essn int,
    pno int, 
    hour int
);

create table dependent (
    essn int, 
    dname varchar(20),
    sex char, 
    bdate date, 
    rel varchar(20)
);