use ex3;

-- Question 01

\! echo 'Question 01 : Employee information working for SBI'
select e.*
from e, w
where e.ename = w.ename
and bname = 'SBI';

-- Question 02

\! echo 'Question 02 : Employee info from SBI earning > 100000'
select e.*
from e, w 
where e.ename = w.ename 
and bname = 'SBI' 
and salary > 100000;

-- Question 03

\! echo 'Question 03 : Employee working and living in same city'
select e.ename 
from e, w, b
where e.ename = w.ename 
and w.bname = b.bname 
and ecity = bcity;

-- Question 04

\! echo 'Question 04 : Employee living in same city street as manager'
select distinct e.ename 
from e, 
 (
    select m.ename, mname, ecity as mcity
    from e, m
    where mname = e.ename
) m
 where e.ecity = m.mcity
 and e.ename = m.ename; 

 -- Qurstion 05 

\! echo 'Question 05 : Employee who do not work in SBI'
select e.ename 
from e, w 
where e.ename = w.ename 
and bname != 'SBI';

-- Question 06

\! echo 'Question 06 : Employee with highest salary' 
select ename 
from w, 
(
    select max(salary) as mx
    from w
) x 
where w.salary = x.mx;

-- Question 07

\! echo 'Question 07 : Employee earning more than average in their respective bank'
select ename
from w, 
(
    select bname, avg(salary) as av
    from w 
    group by bname
) x
where w.bname = x.bname 
and salary > av;

-- Question 08 

\! echo 'Question 08 : Bank with most employee'
select bname 
from 
(
        select bname, count(*) as cnt
        from w 
        group by bname
) drvt1, 
(
    select max(cnt) as mx
    from
    (
        select count(*) as cnt
        from w 
        group by bname
    ) drvt
) drvt2
where drvt1.cnt = drvt2.mx;

-- Question 09

\! echo 'Question 09 : Bank with smallest payroll'
select bname 
from 
(
        select bname, avg(salary) as sal
        from w 
        group by bname
) drvt1, 
(
    select min(sal) as mn
    from
    (
        select avg(salary) as sal
        from w 
        group by bname
    ) drvt
) drvt2
where drvt1.sal = drvt2.mn;

-- Question 10

\! echo 'Question 10: Exmployee earning more than avg sal of SBI'
select ename 
from 
w, 
(
    select avg(salary) as sal
    from w 
    where bname = 'SBI'
) drvt
where salary > sal;

-- Question 11 

\! echo 'Question 11 : No. of employee in each bank'
select bname, count(*) as cnt 
from w 
group by bname;