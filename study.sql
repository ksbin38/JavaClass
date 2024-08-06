SELECT * FROM EMP;

SELECT EMPNO, ENAME, DEPTNO FROM EMP;
-- �ּ�
select
    empno -- �����ȣ
    , ename -- �����
    , JOB -- ��å
    , mgr -- ���ӻ���� �����ȣ
    , hiredate -- �Ի���
    , sal -- �޿�
    , comm -- �޿� �� �߰� ����
    , deptno -- ����� ���� �μ� ��ȣ
from emp;

SELECT DISTINCT -- �ߺ��� ������ ����
    DEPTNO
FROM EMP;

SELECT ALL -- �⺻������ ���� ���(���� ��þ��ص� ���� �����)
    DEPTNO
    , JOB
FROM EMP;

SELECT
    DEPTNO
    , ENAME
    , SAL
    , SAL * 12 + COMM SUMSAL -- ��Ī �ο�(�׳� �����ϴ� ���, "��Ī", AS ��Ī, AS "��Ī"), ������ AS ��Ī�� ����
    , COMM
FROM EMP;

-- ORDER BY [�����Ϸ��� �ϴ� �÷� �̸�] [���� �ɼ�]
-- �������� ASC / �������� DESC

SELECT
    EMPNO
    , ENAME
    , JOB
    , SAL
    , COMM
    , DEPTNO
    , MGR
    , HIREDATE
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;

SELECT DISTINCT
    JOB
    , EMPNO AS EMPLOYEE_NO
    , ENAME AS EMPLOYEE_NAME
    , MGR AS MANAGER
    , SAL AS SALARY
    , COMM AS COMMISSION
    , DEPTNO AS DEPARTMENT_NO
FROM EMP
ORDER BY DEPTNO DESC, ENAME ASC;

-- WHERE��: SELECT������ �����͸� ��ȸ�� �� Ư������
SELECT
    *
FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';

SELECT
    *
FROM EMP
WHERE DEPTNO = 30
OR JOB = 'CLERK';

-- A > B : A���� B���� �ʰ��ϸ� true
-- A >= B : A���� B�� �̻��̸� true
-- A < B : A���� B�� �̸��̸� true
-- A <= B : A���� B�� �����̸� true

-- ���ڿ� �񱳽� ���ڿ��� ��Ҹ� ���Ѵ�
-- ENAME >= 'F' : ENAME�� ���� ù ���ڿ� �빮�� F�� ������ ��
-- ���ĺ� ������ F�� ���ų� F���� �ڿ� �ִ� ���ڿ��� ����϶�� �ǹ�
SELECT
    *
FROM EMP
WHERE SAL >= 2500
AND JOB = 'ANALYST';

-- � �� ������
-- A = B : A���� B�� ������ true/ �ٸ��� false
-- A != B  / A <> B / A ^= B: A���� B���� �ٸ��� true/ �ٸ��� false

SELECT
    *
FROM EMP
WHERE NOT SAL = 3000;

SELECT
    *
FROM EMP
WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK')
;
-- IN : Ư�� ���� ���Ե� �����͸� ������ ��ȸ�� �� ���
-- NOT IN : ������, IN�� �ݴ�� ������ �����ϰ� ��ȸ

SELECT
    *
FROM EMP
WHERE DEPTNO IN (10, 20)
;

-- LIKE : Ư���� ���ڿ� �˻� ==> *��ȣ�� �Բ� ���ڿ� ��ȸ
-- % : ���̿� ������� ��� ���� �����͸� �ǹ�
-- _ : � ���̵� ������� �Ѱ��� ���� �����͸� �ǹ�
SELECT
    *
FROM EMP
WHERE ENAME LIKE '%AM%'
;

-- A_A
-- SELECT * FROM TBL
-- WHERE COLUMN LIKE 'A\_A%' ESCAPE '\';

SELECT
    *
FROM EMP
WHERE COMM IS NULL
;
-- null�� Ȯ���Ҷ��� � �����ڰ� �ƴ� is�� üũ�Ѵ�, �ݴ�� is not

-- ���տ�����(UNION)
-- UNION : ����� SELECT ���� ��� ���� ���������� �ش�. ��� ���� �ߺ��� ���ŵȴ�.
-- UNION ALL : ����� SELECT ���� ��� ���� ���������� �ش�. �ߺ��� ��� ���� ���� ���� ��� ���
-- MINUS : ���� �ۼ��� SELECT ���� ��� ������ ���� SELECT ���� ��� ���� ������ ó��, �������� ���� �� �� ��ġ�� �� �����ϰ� ���
-- INTERSECT : ���� �ۼ��� SELECT ���� ���� SELECT ���� ��� ���� ���� �����͸� ���, �������� �ǹ�

-- ������ �켱����
-- 1. *, /
-- 2. +, -
-- 3. =, !=, ^=, <, >, <=, >=
-- 4. is (not) null, (not) like, (not) in
-- 5. between A and B
-- 6. not
-- 7. and
-- 8. or

SELECT
    *
FROM EMP
WHERE ENAME LIKE '%S'
;

SELECT
    EMPNO
    , ENAME
    , JOB
    , SAL
    , DEPTNO
FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN'
;

SELECT
    EMPNO
    , ENAME
    , SAL
    , DEPTNO
FROM EMP
WHERE DEPTNO IN (20, 30)
AND SAL > 2000
;

SELECT
    EMPNO
    , ENAME
    , SAL
    , DEPTNO
FROM EMP
WHERE DEPTNO IN (20, 30)
INTERSECT
SELECT
    EMPNO
    , ENAME
    , SAL
    , DEPTNO
FROM EMP
WHERE SAL > 2000
;

SELECT
    *
FROM EMP
WHERE SAL < 2000
OR SAL > 3000
;

SELECT
    ENAME
    , EMPNO
    , SAL
    , DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%'
AND DEPTNO = 30
AND SAL NOT BETWEEN 1000 AND 2000
;

SELECT
    *
FROM EMP
WHERE COMM IS NULL
AND MGR IS NOT NULL
AND JOB IN ('MANAGER', 'CLERK')
AND ENAME NOT LIKE '_L%'
;

-- ����Ŭ �Լ�
-- ����
-- 1. ���� �Լ�(build-in function)
-- ������ �Լ�(single-row function): �� �ϳ��� üũ
-- ������ �Լ�(multiple-row function): �������� �ѹ��� ��� üũ
-- 2. ����� ���� �Լ�(user-defined function)

-- ��,�ҹ��� ����
-- upper(���ڿ�): ��ȣ �� ���� �����͸� ��� �빮�ڷ� ��ȯ�Ͽ� ��ȯ
-- lower(���ڿ�): ��ȣ �� ���� �����͸� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ
-- initcap(���ڿ�): ��ȣ �� ���� ������ �� ù ���ڴ� �빮�ڷ�, ������ ���ڸ� �ҹ��ڷ� ��ȯ �� ��ȯ

SELECT
    ENAME
    , UPPER(ENAME) AS UPPERENAME
    , LOWER(ENAME) AS lowerEname
    , INITCAP(ENAME) AS InitcapEname
FROM EMP
WHERE UPPER(ENAME) = UPPER('smith')
;

-- length(���ڿ�): ��ȣ �� ���� �������� ���̸� ��ȯ
SELECT
    ENAME
    , LENGTH(ENAME) AS enameLength
FROM EMP
WHERE LENGTH(ENAME) >= 5
;

-- DUAL TABLE : ���� ���̺�, ����Ŭ ��ü���� �����ϴ� ���̺�
-- Ư���� �Լ��� ��Ÿ ���� ����� ���̺��� ���� ���¿��� �����ؾ� �ϴ� ���̽��� �� ���
-- �ý��� �����(sys)�� �����ϴ� ����Ŭ ǥ�� ���̺�
-- �ý��� ����ڰ� ���������� ������ ���� ����
-- �÷���(ī��θ�Ƽ)�� ������ ��� 1�� �������̺�
SELECT
    LENGTH('�ѱ�') AS Length
    , 'ABC' AS ALPHABET
FROM DUAL
;-- ���ο� �����͸� �����ؼ� ���
