\! echo 'Question 01'
delimiter //
drop procedure if exists q1;
create procedure q1 (in $eno int)
begin
	select *
	from empl
	where empl.eno = $eno;
end //
delimiter ;

\! echo 'Question 02'
drop procedure if exists q2;
delimiter //
create procedure q2 (in $ename varchar(20), $sex char, $sal int, $addr varchar(20), $dno int)
begin
	insert into empl (ename, sex, sal, addr, dno)
	values ($ename, $s$ex, $sal, $addr, $dno);
end //
delimiter ;

\! echo 'Question 03'
drop procedure if exists q3;
delimiter //
create procedure q3 (in $eno int, in $sal int)
begin
	update empl
	set sal = sal + $sal
	where eno = $eno;
end //
delimiter ;

\! echo 'Question 04'
drop procedure if exists q4;
delimiter //
create procedure q4 (in $ename varchar(20))
begin
	delete from empl
	where ename = $ename;
end //
delimiter ;

\! echo 'Question 05'
drop function if exists q5;
delimiter //
create function q5 ()
returns int deterministic
begin
	declare res int;
	select max(sal)
	from empl
	into res;
	return res;
end //
delimiter ;

\! echo 'Question 06'
drop function if exists q6;
delimiter //
create function q6 ($dno int)
returns int deterministic
begin
	declare res int;
	select count(*)
	from empl
	where dno = $dno
	into res;
	return res;
end //
delimiter ;

\! echo 'Question 07'
drop function if exists q7;
delimiter //
create function q7 ($eno int)
returns int deterministic
begin
	declare res int;
	select sal
	from empl
	where eno = $eno
	into res;
	return res;
end //
delimiter ;

\! echo 'Question 08'
drop function if exists q8;
delimiter //
create function q8 ($dno int)
returns int deterministic
begin
	declare res int;
	select avg(sal)
	from empl
	where dno = $dno
	into res;
	return res;
end //
delimiter ;

\! echo 'Question 09'
drop procedure if exists q9;
delimiter //
create procedure q9 (in $dno int)
begin
	select ename
	from empl
	where dno = $dno;
end //
delimiter ;

\! echo 'Question 10'
drop procedure if exists _q10;
delimiter //
create procedure _q10 (in $dno int, out $res int)
begin
	select max(sal)
	from empl
	where dno = $dno
	into $res;
end //
delimiter ;
drop procedure if exists q10;
delimiter //
create procedure q10 ()
begin
	select dno, _q10 from 
