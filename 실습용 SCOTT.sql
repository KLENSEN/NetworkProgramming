select * from Business;
select * from tab;

--�θ� ���̺�
CREATE TABLE PRODUCT_T(
P_ID VARCHAR2(4) NOT NULL --PK
);

ALTER TABLE PARODUCT_T ADD CONSTRAINT P_PK PRIMARY KEY(P_ID);

--�ڽ� ���̺�
CREATE TABLE CLOTHES_T (
C_ID VARCHAR2(4) NOT NULL,
P_ID VARCHAR2(4) --FK
);

--�⺻Ű �ܷ�Ű ��������
--ALTER TABLE[���̺� ��] ADD CONSTRAINT [�������� �̸�] FOREIGN KEY[�÷� ��] REFERENCES [�θ����̺�{ (PK �÷� ��)
ALTER TABLE CLOTHES_T ADD CONSTRAINT C_PK PRIMARY KEY(C_ID);
ALTER TABLE CLOTHES_T ADD CONSTRAINT C_FK FOREIGN KEY(P_ID) REFERENCES PRODUCT_T (P_ID);

INSERT INTO PARENT_T VALUES('B'); 
commit
select* from PARENT_T;

INSERT INTO CHILD_T VALUES('a','B');

select *
from PARENT_T,CHILD_T;
--���
create table parent2(
P_id varcahr2(10) PRIMARY KEY,
P_name varchar2(4)
CONSTRAINT p_fk REFERENCES PARENT_T (P_ID)
);

--�������� (SubQuery)
select ename, sal   --7
from emp  --4
where sal > (select sal  --3
from emp   --1
where ename='JONES')  --2
and ename !='SCOTT';  ---6

--������ ��������
--������ SALESMAN�� ������ ���� ������ �޴� ������� �̸��� ������ ����Ͻÿ�

SELECT AVG(NVL(COMM,0))
FROM EMP;


































