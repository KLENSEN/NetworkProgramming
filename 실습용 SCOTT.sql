select * from Business;
select * from tab;

--부모 테이블
CREATE TABLE PRODUCT_T(
P_ID VARCHAR2(4) NOT NULL --PK
);

ALTER TABLE PARODUCT_T ADD CONSTRAINT P_PK PRIMARY KEY(P_ID);

--자식 테이블
CREATE TABLE CLOTHES_T (
C_ID VARCHAR2(4) NOT NULL,
P_ID VARCHAR2(4) --FK
);

--기본키 외래키 제약조건
--ALTER TABLE[테이블 명] ADD CONSTRAINT [제약조건 이름] FOREIGN KEY[컬럼 명] REFERENCES [부모테이블{ (PK 컬럼 명)
ALTER TABLE CLOTHES_T ADD CONSTRAINT C_PK PRIMARY KEY(C_ID);
ALTER TABLE CLOTHES_T ADD CONSTRAINT C_FK FOREIGN KEY(P_ID) REFERENCES PRODUCT_T (P_ID);

INSERT INTO PARENT_T VALUES('B'); 
commit
select* from PARENT_T;

INSERT INTO CHILD_T VALUES('a','B');

select *
from PARENT_T,CHILD_T;
--약식
create table parent2(
P_id varcahr2(10) PRIMARY KEY,
P_name varchar2(4)
CONSTRAINT p_fk REFERENCES PARENT_T (P_ID)
);

--서브쿼리 (SubQuery)
select ename, sal   --7
from emp  --4
where sal > (select sal  --3
from emp   --1
where ename='JONES')  --2
and ename !='SCOTT';  ---6

--다중행 서브쿼리
--직업이 SALESMAN이 사원들과 같은 월급을 받는 사원들의 이름과 월급을 출력하시오

SELECT AVG(NVL(COMM,0))
FROM EMP;


































