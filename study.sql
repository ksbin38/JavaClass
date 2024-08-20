-- 0820
-- SQL Injection
-- sql injection ������ �����ͺ��̽��� ���� ����, ������ �ջ�, ������ ���� ��

-- ������ ����
-- ����Ŭ���� �����ͺ��̽� ���̺��� ����� ���̺�, �����ͻ��� 2���� ����
-- ������ ����: �����ͺ��̽��� �����ϰ� ��ϴµ� �ʿ��� ��� ������ �����ϴ� ����

-- ���ξ�
-- USER_XXXXX: ���� DB�� ������ ����ڰ� ������ ��ü ����
-- ALL_XXXX: ���� DB�� ������ ����ڰ� ������ ��ü �Ǵ� �ٸ� ����ڰ� ������ ��ü �� ��� �㰡�� ���� ��ü
-- DBA_XXXX: DB ������ ���� ����(���� ���� ������ ���� ����) SYS�Ǵ� SYSTEM
-- VS_XXXXX: 

-- ��� ������ ������ ���� ���
SELECT * FROM DICT; -- DICTIONARY

-- USER_XXX USER ���ξ ���� ������ ����
SELECT TABLE_NAME FROM USER_TABLES;

-- ALL_ ���ο��� ���� ������ ����
SELECT * FROM ALL_TABLES;

-- index
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_IND_COLUMNS;

/*
CREATE INDEX [�ε����̸�]
    ON [���̺��̸�] (���̸�1 ASC �Ǵ� DESC, ���̸�n ASC �Ǵ� DESC);
*/
-- EMP >>> SAL
CREATE INDEX IDX_EMP_SAL_AND_COMM
    ON EMP(SAL, COMM);
-- index ����
DROP INDEX IDX_EMP_SAL_AND_COMM;

-- ��(View)
-- �ϳ� �̻��� ���̺��� ��ȸ�ϴ� SELECT���� ������ ��ü
-- SELECT���� �����ϱ� ������ �������� �����͸� �������� �ʴ´�.

SELECT * FROM
(
    SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP
        WHERE DEPTNO = 20
);

/*
CREATE[OR REPLACE] [FORCE | NOFORCE]
VIEW [���̸�] (���̸�1, ... , ���̸�n) AS (������ SELECT��)
[WITH CHECK OPTION [CONSTRAINT ��������]]
[WITH READ ONLY [CONSTRAINT ��������]]
*/

CREATE VIEW VW_EMP20
    AS (
        SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP
            WHERE DEPTNO = 20
    );

SELECT * FROM VW_EMP20;

-- USERS ���̺� ---> �Ϲ����� ȸ������ ���̺�
-- SOCIAL ���̺� ---> �Ҽȷ� ������ ȸ�� ���̺�

-- USERS >>> user_id, user_pw
-- SOCIAL >>> sns_id, sns_pw
/*
CREATE VIEW VW_EMP20
AS (
    SELECT user_id AS id, user_pw AS pw FROM USERS
    UNION ALL
    SELECT sns_id AS id, sns_pw AS pw FROM SOCIAL
);
*/

-- ���Ǿ�(synonym)
-- ���Ǿ�� ���̺�, ��, ������ �� ��ü �̸� ��� ����� �� �ִ� �ٸ� �̸��� �ο��ϴ� ��ü
/*
CREATE [PUBLIC(���û���)] SYNONYM [���Ǿ� �̸�]
FOR [�����.][��ü�̸�];
*/

CREATE SYNONYM E
FOR EMP;

SELECT * FROM E;

DROP SYNONYM E;


