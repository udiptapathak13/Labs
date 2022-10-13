\! echo 'Question a)'
select bdate, addr
from department d, employee e
where e.dno = d.dno
and dname = 'Research';

\! echo 'Question b)'
select pno, dname, lname, addr, bdate
from project p, department d, employee e
where ploc = 'Bangalore'
and p.dno = d.dno
and d.mgrssn = e.ssn;

\! echo 'Question c)'
select e.fname, e.lname, s.fname, s.lname 
from employee e, employee s
where e.superssn = s.ssn;

\! echo 'Question d)'
select e.*
from employee e, department d 
where e.dno = d.dno
and dname = 'Research';

\! echo 'Question e)'
select distinct p.pno 
from employee e, workson w, department d, project p
where e.lname = 'Lywait'
and 
(
    (
        e.ssn = w.essn
        and d.dno = p.dno
        and p.pno = w.pno
    )
    or 
    (
            p.dno = d.dno
            and d.mgrssn = e.ssn
            and w.pno = p.pno
    )
);

\! echo 'Question f)'
select e.fname 
from employee e
where e.ssn 
not in 
(
    select distinct essn 
    from dependent
);

\! echo 'Question g)'
select distinct e.fname
from employee e, dependent d
where e.fname = d.dname 
and e.sex = d.sex
and e.ssn = d.essn;

\! echo 'Question h)'
select max(salary), min(salary)
from employee;

\! echo 'Question i)'
select count(*)
from (
    select distinct salary 
    from employee
) drvt;

\! echo 'Question j)'
alter table employee 
drop index indx;
create index indx
on employee (fname);

\! echo 'Question k)'
drop view if exists tmp1;
create view tmp1
as select fname, salary 
from employee;
select * from tmp1;

\! echo 'Question l)'
drop view if exists tmp2;
create view tmp2
as select e.fname, e.dno, w.pno 
from employee e, workson w 
where e.ssn = w.essn;
select * from tmp2;

\! echo  'Question m)'
select sum(salary)
from employee;

\! echo 'Question n'
select max(salary), min(salary), avg(salary)
from employee;

\! echo 'Question o'
select fname 
from employee
where bdate between '2001-06-30' and '2001-12-30';