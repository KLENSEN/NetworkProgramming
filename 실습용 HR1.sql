
--�θ��� �����͸� ������ ������ �߻�
--�ڽ� ���̺��� �����ϰ� �ֱ� ������ ����� ����
DELETE FROM PARENT_T WHERE P_ID='B';


--�ܷ�Ű ���� ������ ������ �� DROP�� ����.
 ALTER TABLE CHILD_T DROP CONSTRAINT C__FK;

--ON DELETE CASCADE�� ���ؼ� ���� �� �ִ�.
--�θ� ���̺�(���� ���Ѵ� ���̺�)�� ������ ������, �����ϴ� �ڽ����̺��� 
--�����ͱ��� ���� �������� �ɼ��̴�.
ALTER TABLE CHILD_T ADD CONSTRAINT C_FK FOREIGN KEY (P_ID)
REFERENCES PARENT_T (P_ID) ON DELETE CASCADE ;

SELECT * FROM CHILD_T;

CREATE TABLE javaweb (
javaweb_id varchar2(10) PRIMARY KEY, --�⺻Ű (UNIQUE+ NOT NULL)
web_id     varchar2(4)   UNIQUE,
product    varchar2(4)   NOT NULL

);


--join 
--EQUI JOIN(��������)

select ename, loc
from emp, dept;

select * from emp;
select * from dept;

select ename, loc
from emp, dept
where emp.deptno = dept.deptno;

--and���� �߰�
select ename, loc, job
from emp, dept
where emp.deptno = dept.deptno and emp.job='ANALYST';

--�� �ȵɱ�?
--deptno�� � ���̺� deptno ���� �����Ϸ��� ���� ���ϱ� ������ ������ ���.
select ename, loc, job, deptno
from emp, dept
where emp.deptno = dept.deptno and emp.job='ANALYST';

--� ���̺����� �˷���� �Ѵ�
--�ߺ��Ǵ� �Ӽ��� ��� �� �� ������ �ش� ���̺��� ������־�� �Ѵ�.
SELECT emp.ename, dept.loc, emp.job
from emp, dept
where emp.deptno = dept.deptno and emp.job='ANALYST';

--��Ī�� ���� �� ����������
select e.ename, d.loc, d.job
from emp e, dept d
where e.deptno = d.deptno and e.job='ANALYST';


--NON EQUI JOIN
--EQUI JOIN ó�� ������ �÷��� ������,����� �÷��� ������ ����Ѵ�.
drop table salgrade;

create table salgrade
(grade nuber(10),
losal number(10),
hisal number(10));

insert into salgrade value(1,7800,1200);
insert into salgrade value(2,1201,1400);
insert into salgrade value(3,1401,2000);
insert into salgrade value(4,2001,3000);
insert into salgrade value(5,3001,9999);

commit;
SELECT * FROM salgrade;

--������̺�(EMP)�� �޿� ���̺�(salgrade) �����Ͽ� �̸�, ����, �޿� ����� ���
--�� ���̺� ���� ������ �÷��� ����. ���� ���� ������ �� �� ����.
--������ ����� �÷��� �ִ�. emp.sal�� salgrade.losal, hisal 
--NTILE
SELECT e.ename, e.sal, s.grade
from emp e, salgrade s
where s.sal between s.losal and s.hisal;

--OUTER JOIN
--�����Ͱ� ������ �U�� (+)�� �����ش�

select * from emp;
select * from dept;


select ename, loc
from emp, dept
where emp.deptno(+) = dept.deptno;

--SELF JOIN 
--��� ���̺� �ڱ� �ڽ��� ���̺�� �����Ͽ� �̸�, ����, �ش� ����� ������ �̸��� 
--�������� ������ ����Ͻÿ�.

select e.ename as ���, e.job as ����, m.ename as ������, m.job as ����
from emp e, emp m
where e.mgr = m.empno and e.job='SALESMAN';


--ǥ�� JOIN 

--����Ŭ ���� ����
select e.ename, d.loc
from emp e , dept d
where e.deptno = d.deptno;

--ON ���� �̿��� ANSI/ISO ǥ�� ���� ����
select e.ename, d.loc
from emp e join dept d
on(e.deptno=d.deptno);

--using���� ����� ����
select e.ename,d.loc
form emp e JOIN dept d
USING (deptno); --���δ� �ʼ���

--using ���� �̿��� ���� ������� �̸�, ����, ����, �μ� ��ġ�� ����� ������
select e.ename as �̸�, e.job as ����, e sal as,d.loc �μ���ġ
from emp e join dept d 
using (deptno)
wehre e.job 'SALESMAN'

--Nautural join
--���� ���̺��� �������͸� �����ؼ� ���
--EMP�� DEPT���̿� NATURAL JOIN�� �ϰڴٰ� ����ϸ� ������ �ȴ�
--�� �� �����ϴ� ������ �÷��� DEPTNO�� ����Ŭ�� �˾Ƽ� ã�Ƽ� ������ �����Ѵ�
select e.ename as �̸�, e.job as ����, e.sal as����, d.loc as �μ���ġ
from emp e NATURAL JOIN dept d 
where e.job = 'SALESMAN'

--Outer join 
--����Ŭ outer ����
select e.ename, d.loc
from emp e, dept d
where e.deptno(+) =d.deptno;

--ANSI ����
select e.ename, d.loc
from emp e right outer join dept d
on(e.deptno = d.deptno);

insert into emp(empno, ename, sal, job, deptno) 
values(8282, 'JACK', 3000,'ANALYST', 50);

commit;

select e.ename as �̸�, e.job as ����, e,sal as ����, d.loc as �μ���ġ
from emp e left outer joijng dept d 
on (e.deptno = d.deptno);


-- FULL OUTER JOIN
SELECT e.ename as �̸�, e.job as ����, e.sal as ����, d.loc as �μ���ġ
from emp e full outer join dept d
on(e.deptno = d.deptno);


select deptno
from emp;















































