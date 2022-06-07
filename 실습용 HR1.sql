
--부모의 데이터를 삭제시 오류가 발생
--자식 테이블이 참조하고 있기 때문에 지울수 없다
DELETE FROM PARENT_T WHERE P_ID='B';


--외래키 제약 조건을 삭제할 때 DROP을 쓴다.
 ALTER TABLE CHILD_T DROP CONSTRAINT C__FK;

--ON DELETE CASCADE를 통해서 지울 수 있다.
--부모 테이블(참조 당한는 테이블)의 데이터 지워도, 참조하는 자식테이블의 
--데이터까지 같이 지워지는 옵션이다.
ALTER TABLE CHILD_T ADD CONSTRAINT C_FK FOREIGN KEY (P_ID)
REFERENCES PARENT_T (P_ID) ON DELETE CASCADE ;

SELECT * FROM CHILD_T;

CREATE TABLE javaweb (
javaweb_id varchar2(10) PRIMARY KEY, --기본키 (UNIQUE+ NOT NULL)
web_id     varchar2(4)   UNIQUE,
product    varchar2(4)   NOT NULL

);


--join 
--EQUI JOIN(동등조인)

select ename, loc
from emp, dept;

select * from emp;
select * from dept;

select ename, loc
from emp, dept
where emp.deptno = dept.deptno;

--and조건 추가
select ename, loc, job
from emp, dept
where emp.deptno = dept.deptno and emp.job='ANALYST';

--왜 안될까?
--deptno가 어떤 테이블 deptno 인지 컴파일러는 알지 못하기 때문데 오류가 뜬다.
select ename, loc, job, deptno
from emp, dept
where emp.deptno = dept.deptno and emp.job='ANALYST';

--어떤 테이블인지 알려줘야 한다
--중복되는 속성이 없어도 될 수 있으면 해당 테이블을 명시해주어야 한다.
SELECT emp.ename, dept.loc, emp.job
from emp, dept
where emp.deptno = dept.deptno and emp.job='ANALYST';

--별칭을 쓰면 더 간결해진다
select e.ename, d.loc, d.job
from emp e, dept d
where e.deptno = d.deptno and e.job='ANALYST';


--NON EQUI JOIN
--EQUI JOIN 처럼 동일한 컬럼은 없지만,비슷한 컬럼이 있을때 사용한다.
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

--사원테이블(EMP)와 급여 테이블(salgrade) 조인하여 이름, 월급, 급여 등급을 출력
--두 테이블 간의 동일한 컬럼은 없다. 따라서 동등 조인을 할 수 없다.
--하지만 비슷한 컬럼은 있다. emp.sal와 salgrade.losal, hisal 
--NTILE
SELECT e.ename, e.sal, s.grade
from emp e, salgrade s
where s.sal between s.losal and s.hisal;

--OUTER JOIN
--데이터가 부족한 쪾에 (+)을 붙혀준다

select * from emp;
select * from dept;


select ename, loc
from emp, dept
where emp.deptno(+) = dept.deptno;

--SELF JOIN 
--사원 테이블 자기 자신의 테이블과 조인하여 이름, 직업, 해당 사원의 관리자 이름과 
--관리자의 직업을 출력하시오.

select e.ename as 사원, e.job as 직업, m.ename as 관리자, m.job as 직업
from emp e, emp m
where e.mgr = m.empno and e.job='SALESMAN';


--표준 JOIN 

--오라클 동등 조인
select e.ename, d.loc
from emp e , dept d
where e.deptno = d.deptno;

--ON 절을 이용한 ANSI/ISO 표준 동등 조인
select e.ename, d.loc
from emp e join dept d
on(e.deptno=d.deptno);

--using절을 사용한 조인
select e.ename,d.loc
form emp e JOIN dept d
USING (deptno); --가로는 필수다

--using 절을 이용한 조인 방법으로 이름, 직업, 월급, 부서 위치를 출력해 보세요
select e.ename as 이름, e.job as 직업, e sal as,d.loc 부서위치
from emp e join dept d 
using (deptno)
wehre e.job 'SALESMAN'

--Nautural join
--여러 테이블의 데에이터를 조인해서 출력
--EMP와 DEPT사이에 NATURAL JOIN을 하겠다고 기술하면 조인이 된다
--둘 다 존재하는 동일한 컬럼인 DEPTNO를 오라클이 알아서 찾아서 조인을 수행한다
select e.ename as 이름, e.job as 직업, e.sal as월급, d.loc as 부서위치
from emp e NATURAL JOIN dept d 
where e.job = 'SALESMAN'

--Outer join 
--오라클 outer 조인
select e.ename, d.loc
from emp e, dept d
where e.deptno(+) =d.deptno;

--ANSI 조인
select e.ename, d.loc
from emp e right outer join dept d
on(e.deptno = d.deptno);

insert into emp(empno, ename, sal, job, deptno) 
values(8282, 'JACK', 3000,'ANALYST', 50);

commit;

select e.ename as 이름, e.job as 직업, e,sal as 월급, d.loc as 부서위치
from emp e left outer joijng dept d 
on (e.deptno = d.deptno);


-- FULL OUTER JOIN
SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as 부서위치
from emp e full outer join dept d
on(e.deptno = d.deptno);


select deptno
from emp;















































