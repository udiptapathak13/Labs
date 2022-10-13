drop database if exists ex3;
create database ex3;
use ex3;

create table e (
    ename varchar(20),
    estreet varchar(20),
    ecity varchar(20)
);

create table b (
    bname varchar(20),
    bcity varchar(20)
);

create table w (
    ename varchar(20),
    bname varchar(20),
    salary int
);

create table m (
    ename varchar(20),
    mname varchar(20)
);