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

-- 0806
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

-- 0807
-- substr �Լ�: ���ڿ� �Ϻ� ����
-- substr(���ڿ� ������, ���� ��ġ, ���� ����)
-- substr(���ڿ� ������, ���� ��ġ): ���� ��ġ���� ������
SELECT
    ENAME
    , SUBSTR(ENAME, 3)
    , SUBSTR(ENAME, -LENGTH(ENAME)) -- �÷� �ȿ� ���� ���� �� �޶� �� ������ ó������ ����(�ڿ������� LENGTH��ŭ ������ ���� ����)
FROM EMP
;

-- instr �Լ�: ���ڿ� ������ �ȿ� Ư�� ���� ��ġ�� ã�´�.
-- instr(��� ���ڿ�, ��ġ�� ã������ �κ� ����,
    -- ��ġ ã�⸦ ������ ��� ���ڿ� ������ ��ġ(���û���, �⺻���ð��� 1), ���� ��ġ���� ã������ ���ڰ� ���°���� ����(���û���, �⺻���ð��� 1))
SELECT
    INSTR('HELLO, ORACLE!', 'L') AS instr
    , INSTR('HELLO, ORACLE!', 'L', 5) AS instr2 -- 5��° ���ں��� L�� ã�ƶ�
    , INSTR('HELLO, ORACLE!', 'L', 2, 2) AS instr3 -- 2��°���� L�� �ι�°�� ������ ��ġ�� ã�ƶ�
FROM DUAL
;

-- replace: Ư�� ���ڸ� �ٸ� ���ڷ� �ٲ۴�
-- replace(���ڿ�, ã�� ���ڿ�, ��ü�� ���ڿ�)
SELECT
    '010-1234-5678'
    , REPLACE('010-1234-5678', '-', '*')
    , REPLACE('010-1234-5678', '-') -- ��ȭ��ȣ���� '-'�� ���Ÿ� ��
FROM DUAL
;

-- LPAD, RPAD: �������� �� ������ Ư�� ���ڷ� ä���.
-- lpad: Left Padding >> ���� ������ ������ ä���.
-- rpad: Right Padding >> ���� ������ �������� ä���.
-- �����Ϳ� �ڸ����� ������ �� ������ ���̰� ������ �ڸ������� ���� ��� ������ ������ Ư�� ���ڷ� ä���.
-- LPAD(���ڿ� ������, �������� �ڸ���, ������� ä�� ����(���û���))
-- RPAD(���ڿ� ������, �������� �ڸ���, ������� ä�� ����(���û���))
SELECT
    'ORACLE' AS str
    , LPAD('ORACLE', 10, '#') AS strL -- 10������ ���ڿ��� �ٲٵ� ���� ������� #���� ä����
    , RPAD('ORACLE', 10) AS strR -- ������ ä�� ���� ���� ���� �� �������� ���
    , RPAD(RPAD('123456-1234567', 7), LENGTH('123456-1234567'), '*') AS strnum1
    , RPAD(RPAD('010-1234-5678', 9), LENGTH('010-1234-5678'), '*') AS strnum2
FROM DUAL
;

-- concat: ���ڿ� �����͸� ��ġ�� �뵵
-- concat(���ڿ�, ���ڿ�)
SELECT
    CONCAT(EMPNO, CONCAT(' : ', ENAME)) AS name
FROM EMP
WHERE ENAME = 'SMITH'
;
SELECT
    EMPNO || ENAME AS name
    , EMPNO || ' : ' || ENAME as name2 -- CONCAT(EMPNO, CONCAT(' : ', ENAME))�� ����
FROM EMP
WHERE ENAME = 'SMITH'
;

-- trim, ltrim, rtrim: ���ڳ� ��ȣ�� ������ �������� ���� �����
-- trim(���� �ɼ�)
SELECT
    '[' || TRIM(' _ _ORACLE_ _ ') || ']' as trim
    , '[' || LTRIM(' _ORACLE_ ') || ']' as Ltrim
    , '[' || TRIM(' <_ORACLE_> ') || ']' as Ltrim2
    , '[' || TRIM(' _ORACLE_ ') || ']' as Rtrim
    , '[' || TRIM(' <_ORACLE_> ') || ']' as Rtrim2
FROM DUAL
;

-- ���� ������ �ٷ��
-- round: ������ ������ Ư�� ��ġ���� �ݿø��� ���� ��ȯ
-- trumc: ������ ������ Ư�� ��ġ���� ������ ���� ��ȯ
-- ceil: ������ ���ں��� ū ���� �� ���� ���� ���� ��ȯ
-- floor: ������ ���ں��� ���� ���� �� ���� ū ���� ��ȯ
-- mod: ������ ���ڸ� ���� ������ ���� ��ȯ
-- round(����, �ݿø���ġ(���û���))
SELECT
    ROUND(1234.5678) as round1
    , ROUND(1234.5678, 0) as round2
    , ROUND(1234.5678, 1) as round3 -- �Ҽ��� ���ڸ������� �츮�� �ݿø�
    , ROUND(1234.5678, -2) as round4 -- �Ҽ��� �� ���ڸ� �ݿø��ؼ� ��ȯ
    , TRUNC(1234.5678, 1) as trunc
FROM DUAL
;

-- ceil, floor ���� �Էµ� ������ �ڱ�� ū ����, ���� ������ ��ȯ
SELECT
    CEIL(3.14), FLOOR(3.14)
    , CEIL(-3.14), FLOOR(-3.14)
FROM DUAL
;

-- mod(�������� �� ����, ���� ����): ������ ���
SELECT
    MOD(15, 6)
FROM DUAL
;

-- ��¥ �����͸� �ٷ�� �Լ�
SELECT
    SYSDATE as now
    , SYSDATE - 1 as yesterday
    , SYSDATE + 1 as tomorrow
FROM DUAL
;

-- ADD_MONTHS(��¥������, ���� ���� ��): ��� ������ ��¥ ��ȯ
SELECT
    SYSDATE
    , ADD_MONTHS(SYSDATE, 3) as threemonth
FROM DUAL
;
SELECT
    HIREDATE
    , ADD_MONTHS(HIREDATE, 120) AS tenyear
FROM EMP
;

-- months_between(��¥������1, ��¥������2): �� ��¥ �� ���� �� ��
SELECT
    EMPNO
    , ENAME
    , HIREDATE
    , SYSDATE
    , MONTHS_BETWEEN(HIREDATE, SYSDATE) as m1
    , MONTHS_BETWEEN(SYSDATE, HIREDATE) as m2
    , TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) as m3
FROM EMP
;

-- next_day, last_day >> ���ƿ��� ����, ���� ������ ��¥
-- next_day(��¥ ������, ���Ϲ���)
-- last_day(��¥ ������)
SELECT
    SYSDATE
    , NEXT_DAY(SYSDATE, '������') as nd
    , LAST_DAY(SYSDATE) as ld
FROM DUAL
;

-- ��¥�� �ݿø�, ���� >> round, trunc �Լ��� ���
-- round(��¥, �ݿø� ���� ����)
-- trunc(��¥, ���� ���� ����)
-- cc, scc: ���ڸ� ������ �� ���ڸ��� �������� ���
-- 2016���̸� 2050 �����̹Ƿ� �ݿø��� ��� 2001������ ó��
-- YYYY, SYYYY, SYEAR, YYY, YY, Y: ��¥ �������� �ش� �������� 7�� 1���� ����. ��) 2016�� 7��1���� ��� 2017������ ó��

-- �ؿ��� �� �Ⱦ�, ���縸 �˾Ƶ� ������
-- IYYY, IYY, IY, I: ISO8601���� ������ ��¥ ���س⵵ ���� ���
-- Q: �� �б��� �ι�° ���� 16�� ����
-- month, mon, mm, rm: �� ���� 16�� ����
-- ww: �ش� ������ �� ��(1~53��° ��)�� ����
-- IW: ISO8601���� ������ ��¥ ���� �ش� ������ �ָ� ����
-- W: �ش� ���� ��(1~5��° ��)�� ����
-- ddd, dd, j: �ش� ���� ����(12:00:00)�� ����
-- day, dy, d: �� �ְ� ���۵Ǵ� ��¥�� ����
-- hh, hh12, hh24: �ش� ���� �ð��� ����
-- mi: �ش��� �ð��� ���� ����
SELECT
    SYSDATE
    , ROUND(SYSDATE, 'CC') as formatcc
    , TRUNC(SYSDATE, 'CC') as formatcc2
    , ROUND(SYSDATE, 'YYYY') as formatYYYY
    , TRUNC(SYSDATE, 'YYYY') as formatYYYY2
FROM DUAL
;

-- �ڷ� ����ȯ
    -- ����� ����ȯ
-- TO_CHAR(��¥������, ��µǰ��� �ϴ� ����)
-- TO_NUMBER: ���� �����͸� ���� �����ͷ� ��ȯ
-- TO_DATE: ���ڿ� �����͸� ��¥ �����ͷ� ��ȯ
SELECT
    SYSDATE
    , TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') as nowDateTime
    , TO_CHAR(SYSDATE, 'MM') as mm -- �� ���ڸ� ����
    , TO_CHAR(SYSDATE, 'MON') as mon -- �� �� �̸� ����
    , TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') as month -- �� �� �̸� ��ü
    , TO_CHAR(SYSDATE, 'DD') as dd -- ���� ���ڸ� ����
    , TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH') as dy -- �� �����̸��� ����
    , TO_CHAR(SYSDATE, 'DAY') as day -- �� �����̸� ��ü
    , TO_CHAR(SYSDATE, 'DDD') as ddd -- �ϳ� �� ����°���� ǥ��
    , TO_CHAR(SYSDATE, 'WW') as ww -- �ϳ� �� ��°������ ǥ��
FROM DUAL
;
SELECT
    TO_CHAR(SYSDATE, 'HH24:MI:SS') as hh24miss
    , TO_CHAR(SYSDATE, 'HH24:MI:SS AM') as hh24miss_am
FROM DUAL
;
SELECT
    EMPNO
    , EMPNO + '500' as empplus -- �ڵ����� ����ȯ�ؼ� ����
FROM EMP
;
DESC EMP;

-- 9: ������ �� �ڸ��� �ǹ�(���ڸ��� ä���� ����)
-- 0: ���ڸ��� 0���� ä��
-- $: $ǥ�ø� �ٿ��� ���
-- L: Local ���� ȭ����� ��ȣ�� ���
-- . : �Ҽ��� ǥ��
-- , : õ ������ ���� ǥ��
SELECT
    SAL
    , TO_CHAR(SAL, 'L999,999') as sal_l
    , TO_CHAR(SAL, '999,999.00') as sal_1
    , TO_CHAR(SAL, '000,999,999.00') as sal_2
FROM EMP
;

-- to_number: ���� �����͸� ���� �����ͷ� ��ȯ
-- to_number(���� ������, �νĵ� ���� ����)
SELECT
    TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
FROM DUAL
;

-- to_date: ���ڿ� �����͸� ��¥ �����ͷ� ��ȯ
-- to_date(���ڿ� ������, �νĵ� ��¥����)
SELECT
    TO_DATE('20240807', 'YYYY-MM-DD') as dateStr1
    , to_date('2024-01-01', 'YYYY-MM-DD') as dateStr2
FROM DUAL
;

-- null ó�� �Լ�
-- NVL(null �˻縦 �� ������, ���� �����Ͱ� null�϶� ��ȯ�� ������)
-- NVL2(null �˻縦 �� ������, ���� �����Ͱ� null�� �ƴ� �� ��ȯ�� ������, ���� �����Ͱ� null�϶� ��ȯ�� ������)
SELECT
    EMPNO
    , ENAME
    , SAL
    , COMM
    , SAL+COMM as result -- null�� ���� ��� �󸶸� ���ϵ� null�� ���´�
    , NVL(COMM, 0) as commnvl
    , SAL+NVL(COMM, 0) as total
    , nvl2(comm, 'O', 'X') as nvl2
    , NVL2(COMM, SAL * 12 + COMM, SAL * 12) AS ANNSAL
FROM EMP
;

-- DECODE: NVL, NVL2 >> null�� ��쿡 � �����͸� ��ȯ�� �� ���Ѵ�.
-- Ư�� �� ���̳� ������ ���� ���� � �����͸� ��ȯ�� �� ���� �� DECODE�Լ� �Ǵ� CASE���� ����Ѵ�.
-- DECODE�� if ���ǹ� �Ǵ� switch ~ case �� ����ϴ�.
-- ���� �����͸� ���� �����ϰ� �ش� ������ ���� ���� �ٸ� ��� ���
-- DECODE(������, ����1, �����Ͱ� ����1�� ��ġ�� ��� ��ȯ, ����2, Ư�� �� ��ȯ ... , �� ���� ���)
SELECT
    EMPNO
    , ENAME
    , JOB
    , SAL
    , DECODE(
        JOB
        , 'MANAGER'
        , SAL * 1.1
        , 'SALESMAN'
        , SAL * 1.05
        , 'ANALYST'
        , SAL
        , SAL * 1.03
    ) AS salCalc
FROM EMP
;

-- case��: decode �Լ��� ���������� Ư�� ���ǿ� ���� ��ȯ�� �����͸� ������ �� ����Ѵ�.
-- case[�˻��� ������],
--  when[����1] then[����1�� ����� true�� �� ��ȯ�Ǵ� ��]
--  when[����2] then[����2�� ����� true�� �� ��ȯ�Ǵ� ��]
-- ...
--  else[�� n���� ���ǰ� ��ġ�ϴ� ��찡 ���� �� ��ȯ�Ǵ� ��]
-- end
SELECT
    EMPNO, ENAME, JOB, SAL, COMM
    , CASE JOB
        WHEN 'MANAGER' THEN SAL * 1.1
        WHEN 'SALESMAN' THEN SAL * 1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL * 1.03
    END AS salCalc
    , CASE
        WHEN COMM IS NULL THEN '�ش���� ����'
        WHEN COMM = 0 THEN '���� ����'
        WHEN COMM > 0 THEN '���� : ' || COMM
    END AS COMM_TEXT
FROM EMP
;

-- EMPNO������ EMP���̺��� ����̸�(ENAME)�� �ټ����� �̻��̸� �������� �̸��� ��� ������ ���
-- MASKING_EMPNO���� �����ȣ(EMPNO) �� ���ڸ� �� ���ڸ��� *��ȣ�� ���
-- MASKING_ENAME���� ��� �̸��� ù ���ڸ� �����ְ� �������� * ó��
SELECT
    EMPNO
    , RPAD(SUBSTR(EMPNO, 1, 2), LENGTH(EMPNO), '*') AS MASKING_EMPNO
    , RPAD(RPAD(ENAME, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) < 6
AND LENGTH(ENAME) >= 5
;

-- EMP ���̺��� ������� �� ��� �ٹ��� ���� 21.5��, �Ϸ� �ٹ��ð��� 8�ð����� ������ �� ������� �Ϸ� �޿�(DAY_PAY), �ñ�(TIME_PAY)�� ����ؼ� ���
-- �Ϸ� �޿��� �Ҽ��� ����° �ڸ����� ������, �ñ��� �ι�° �ڸ����� �ݿø�
SELECT
    TRUNC(SAL / 21.5, 2) AS DAY_PAY
    , ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
FROM EMP
;

-- EMP ���̺��� ��� ����� ������� ���� ����� �����ȣ(MGR)�� ������ ���� ������ �������� ��ȯ�ؼ� CHG_MGR���� ���
-- ���ӻ�� ����� �������� ������: 0000
-- ���ӻ�� ��� �� ���ڸ��� 75�� ���: 5555
-- ���ӻ�� ��� �� ���ڸ��� 76�� ���: 6666
-- ���ӻ�� ��� �� ���ڸ��� 77�� ���: 7777
-- ���ӻ�� ��� �� ���ڸ��� 78�� ���: 8888
-- �� ��: ���� ���� ����� ��� �״��
SELECT
    CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN SUBSTR(MGR, 1, 2) = '75' THEN '5555'
        WHEN SUBSTR(MGR, 1, 2) = '76' THEN '6666'
        WHEN SUBSTR(MGR, 1, 2) = '77' THEN '7777'
        WHEN SUBSTR(MGR, 1, 2) = '78' THEN '8888'
        ELSE TO_CHAR(MGR)
    END AS CHG_MGR
FROM EMP
;

-- ======������ �Լ�======
-- sum: ������ �������� �� ��ȯ
-- count: ������ �������� ���� ��ȯ
-- max: ������ ������ �� �ִ� ��ȯ
-- min: ������ ������ �� �ּڰ� ��ȯ
-- avg: ������ �������� ��հ� ��ȯ
SELECT
    SUM(SAL)
    , COUNT(*) as count -- ��ü ���̺��� �� ����
    , MAX(SAL) as max
    , min(sal) as min
    , ROUND(AVG(SAL), 2) AS AVG
FROM EMP
;

-- GROUP BY
SELECT
    AVG(SAL) AS abgSal
    , DEPTNO
    , JOB
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB -- group by�� ���� ���� order by�� ��� ������ �ȳ���
;
-- group by ���� ����� �� ������: ���� �� �Լ��� ������� ���� �Ϲ� ���� group by���� ������� ������ select������ ��� �Ұ�

-- having: group by���� ������ ���� ��� ����. group by���� ���� �׷�ȭ �� ������� ������ ������ �� ����Ѵ�(group by���� ������ �� �� ���)
SELECT
    DEPTNO, JOB, AVG(SAL) AS AVG
FROM EMP
WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000 -- having�� group by�ڿ� �;��Ѵ�
ORDER BY DEPTNO, JOB
;


-- 0808
-- ������ ���� select
-- ������ �߰�, ����, ����
-- ������ ���۾�� �θ��� DML(Data Manipulation Language)
-- select������ ��ȸ�� ���̺� �����͸� �߰�, ����, ������ �� ����ϴ� ��ɾ�� �̷���� �ִ�.

-- ���̺� ����
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP;
-- ���̺� ����
DROP TABLE DEPT_TEMP;

-- insert: ���̺� �����͸� �߰�
-- insert into[���̺� �̸�] (��1, ��2, ��3, ... , ��n)
    -- values (��1�� ��, ��2�� ��, ��3�� ��, ... , ��n�� ��);

DESC DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
    VALUES (50, 'DATABASE', 'SEOUL');
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
    VALUES (60, 'NETWORK', 'BUSAN');

SELECT * FROM DEPT_TEMP;
-- INSERT �� ���� �߻�: ������ �� ������ �� ���� �Է��� ������ ������ ����ġ
-- �Ǵ� �ڷ����� ���� �ʴ� ���, �Ǵ� �� ���̸� �ʰ��ϴ� �����͸� ������ ���
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (70, 'WEB', null);
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (80, 'MOBILE', ''); -- 70, 80 �Ѵ� (null)�� �߰���

INSERT INTO DEPT_TEMP (DEPTNO, LOC)
    VALUES (90, 'INCHEON'); -- ������ ���� ���� �˾Ƽ� (null)�� �ν�

CREATE TABLE EMP_TEMP AS SELECT * FROM EMP;
DESC EMP_TEMP;
INSERT INTO EMP_TEMP (
    EMPNO
    , ENAME
    , JOB
    , MGR
    , HIREDATE
    , SAL
    , COMM
    , DEPTNO
    )
VALUES (
    9999
    , 'ȫ�浿'
    , 'PRESIDENT'
    , NULL
    , '2001/01/01'
    , 5000
    , 1000
    , 10
    );
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
FROM EMP E;

-- update [���̺� �̸�]
-- set [������ ��1] = [������ ��], [������ ��2] = [������ ��], [������ ��3], [������ ��]
-- where ������ ����� ��ȸ ����(where �Է� ���ϸ� ��ü�� �����)
CREATE TABLE DEPT_TEMP2 AS SELECT * FROM DEPT;
UPDATE DEPT_TEMP
    SET LOC = 'SEOUL'
    , DNAME = 'DATABASE'
WHERE DEPTNO = 40
;
ROLLBACK; -- �������(<-> commit: �����Ѱ� ����)
SELECT * FROM DEPT_TEMP;

UPDATE EMP_TEMP
    SET COMM = 50
WHERE SAL <= 2500;
SELECT * FROM EMP_TEMP;

UPDATE DEPT_TEMP2
SET(DNAME, LOC) = (
    SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 40
)
WHERE DEPTNO = 40;

-- delete: ���̺� ������ ����
-- delete from [���̺� �̸�]
    -- where [������ �� ����]

SELECT * FROM EMP_TEMP ORDER BY JOB;
DELETE FROM EMP_TEMP
WHERE JOB = 'MANAGER';

DELETE FROM EMP_TEMP
WHERE SAL >= 3000;

-- CRUD: Create(����), Read(�б�), Update(����), Delete(����)

-- ������ ���Ǿ�(DDL: Data Definition Language)
-- �����ͺ��̽� �����͸� �����ϰ� �����ϱ� ���� �����Ǵ� ���� ��ü�� ����, ����, ���� ���� ���
-- create: ��ü ����
-- alter: ��ü ����
-- rename: ���̺� �̸� ����
-- drop: ��ü ����

-- create >> ���̺� ����
-- create table ��������.���̺��̸� (
    -- ��1�̸� ��1�� �ڷ���
    -- , ��2�̸� ��2�� �ڷ���
    -- , ...
    -- , ��n�̸� ��n�� �ڷ���
    -- );
-- ������ ��: ���̺� ���� ��Ģ
-- 1. ���̺� �̸��� ���ڷ� ����
-- 2. ���̺� �̸��� 30����Ʈ ����(���� 30��, �ѱ� 15��)
-- 3. ���� ����� ������ ���̺� �̸��� �ߺ� �Ұ�
-- 4. ���̺� �̸��� ������, ���ڿ� Ư������ $,#,_�� ��� ����
-- 5. SQL Ű����� ���̺� �̸����� ����� �� ����.

-- �� �̸� ���� ��Ģ
-- 1. �� �̸��� ���ڷ� �����ؾ� �Ѵ�
-- 2. �� �̸��� 30����Ʈ ���Ͽ��� �Ѵ�
-- 3. �� ���̺��� �� �̸��� �ߺ��� �� ����
-- 4. �� �̸��� ������, ����, Ư������ $,#,_ ��� ����
-- 5. SQL Ű����� �� �̸����� ����� �� ����
DESC EMP;
-- ���̺� ����
CREATE TABLE EMP_DDL (
    EMPNO       NUMBER(4)
    , ENAME     VARCHAR2(10)
    , JOB       VARCHAR2(9)
    , MGR       NUMBER(4)
    , HIREDATE  DATE
    , SAL       NUMBER(7,2)
    , COMM      NUMBER(7,2)
    , DEPTNO    NUMBER(2)
);
-- ���̺� ����
CREATE TABLE DEPT_DDL AS SELECT * FROM DEPT;

CREATE TABLE EMP_DDL_30 AS SELECT * FROM EMP WHERE DEPTNO = 30;
SELECT * FROM EMP_DDL_30;

-- alter: ��ü�� ������ �� ����ϰ� ���̺��� �� ���� �߰� �Ǵ� ����
    -- ���� �ڷ��� �Ǵ� ���� ������ �� ���
CREATE TABLE EMP_ALTER AS SELECT * FROM EMP;
SELECT * FROM EMP_ALTER;

-- add: �� �߰�
-- �ڵ��� ��ȣ > 20�� �߰�, HP
ALTER TABLE EMP_ALTER
    ADD HP VARCHAR2(20);

-- rename: �� �̸� ����
ALTER TABLE EMP_ALTER
    RENAME COLUMN HP TO TEL;

-- modify: ���� �ڷ��� ����
ALTER TABLE EMP_ALTER
    MODIFY EMPNO NUMBER(5);
DESC EMP_ALTER;

-- drop: Ư�� �� ����(�� �ȿ� ���� �־ ������, ����!!)
ALTER TABLE EMP_ALTER
    DROP COLUMN TEL
;

-- rename: ���̺��� �̸��� �����Ѵ�
RENAME EMP_ALTER TO EMP_RENAME;
SELECT * FROM EMP_RENAME;

-- ������ ������ ������ emp_hw ���̺� ����
-- ���̸�/ �ڷ���/ ����
-- empno / ������ ���� / 4
-- ename / ������ ���ڿ� / 10
-- job / ������ ���ڿ� / 9
-- mgr / ������ ���� / 4
-- hiredate / ��¥ / -
-- sal / �Ҽ��� ��°�ڸ����� ǥ���Ǵ� ���� / 7
-- comm / �Ҽ��� ��°�ڸ����� ǥ���Ǵ� ���� / 7
-- deptno / ������ ���� / 2
CREATE TABLE EMP_HW (
    EMPNO NUMBER(4)
    , ENAME VARCHAR2(10)
    , JOB VARCHAR2(9)
    , MGR NUMBER(4)
    , HIREDATE DATE
    , SAL NUMBER(7,2)
    , COMM NUMBER(7,2)
    , DEPTNO NUMBER(2)
);

-- EMP_HW ���̺� BIGO �� �߰�, �ڷ����� ������ ���ڿ��̰� ���̴� 20
ALTER TABLE EMP_HW
    ADD BIGO VARCHAR2(20);

-- EMP_HW���̺��� BIGO �� ũ�⸦ 30���� ����
ALTER TABLE EMP_HW
    MODIFY BIGO VARCHAR2(30);

-- EMP_HW ���̺��� BIGO �� �̸��� REMARK�� ����
ALTER TABLE EMP_HW
    RENAME COLUMN BIGO TO REMARK;

-- EMP_HW ���̺� EMP ���̺��� �����͸� ��� �����ϵ� remark���� null�� ����
INSERT INTO EMP_HW
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL
FROM EMP;

-- EMP_HW ���̺� ����
DROP TABLE EMP_HW;




-- ���� ����
-- ���� ������ ���̺��� Ư���� ���� ����, ���� ������ ������ ���� ���� ���ǿ� �������� �ʴ� �����͸� ������ �� ����.
-- - NOT NULL: 		    ������ ���� null�� ������� �ʴ´�. null�� ������ �������� �ߺ��� ���ȴ�.
-- - UNIQUE: 		    ������ ���� ������ ���� ������ �Ѵ�. �ߺ� �Ұ�
-- - PK(PRIMARY KEY): 	������ ���� ������ ���̸鼭 null�� ������� �ʴ´�. primary key�� ���̺� �ϳ��� ���� ����
-- - FK(FOREIGN KEY): 	�ٸ� ���̺��� ���� �����Ͽ� �����ϴ� ���� �Է� ����.
-- - CHECK: 		    ������ ���ǽ��� �����ϴ� �����͸� �Է� ����

-- ������ ���Ἲ: �����ͺ��̽��� ����Ǿ��ִ� �������� ��Ȯ��, �ϰ����� �����Ѵٴ� �ǹ�
-- - ���� ���Ἲ(domain integrity):	    ���� ����Ǵ� ���� ���� ���θ� Ȯ��. �ڷ���, ������ ������ ������, null ���� ���� ���� ���� ������ �����ϴ� ���������� ����
-- - ��ü ���Ἲ(entity integrity):	    ���̺� �����͸� �����ϰ� �ĺ��� �� �ִ� �⺻Ű�� �ݵ�� ���� ������ �־�� �ϸ�, null�� �� �� ���� �ߺ��� �� �� ������ ����
-- - ���� ���Ἲ(referential integrity):	���� ���̺��� �ܷ�Ű ���� ���� ���̺��� �⺻Ű�μ� �����ؾ� �ϸ� null�� ����


-- NOT NULL: �� ���� ������� �ʴ´�. Ư�� ���� �������� �ߺ� ���ΰ� ������� NULL�� ������ ������� �ʴ´�.
CREATE TABLE TABLE_NOTNULL (
    LOGIN_ID    VARCHAR2(20) NOT NULL,
    LOGIN_PWD   VARCHAR2(20) NOT NULL,
    TEL         VARCHAR2(20)
);
INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD)
VALUES ('TEST_ID_01', '1234');

UPDATE TABLE_NOTNULL SET LOGIN_PWD = NULL
WHERE LOGIN_ID = 'TEST_ID_01'; -- null�� ������Ʈ �Ұ�

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
ORDER BY CONSTRAINT_TYPE;
-- owner: ���� ���� ���� ����
-- constraint_name: ���� ���� �̸�(���� �������� ������ ����Ŭ�� �ڵ����� ����)
-- constraint_type: ���� ���� ����
        -- c: check, not null
        -- u: unique
        -- p: primary key
        -- r: foreign key
-- table_name: ���� ������ ������ ���̺� �̸�

CREATE TABLE TABLE_NOTNULL2 (
    LOGIN_ID    VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL,
    LOGIN_PWD   VARCHAR2(20) CONSTRAINT TBLNN2_LGNPW_NN NOT NULL,
    TEL         VARCHAR2(20)
);
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
ORDER BY CONSTRAINT_TYPE;


-- 0809
UPDATE TABLE_NOTNULL
    SET TEL = '010-1234-5678'
    WHERE LOGIN_ID = 'TEST_ID_01';
    
SELECT * FROM TABLE_NOTNULL;

-- ���̺��� ���� ���� Ȯ��
SELECT
    OWNER
    , CONSTRAINT_NAME
    , CONSTRAINT_TYPE
    , TABLE_NAME
    , SEARCH_CONDITION
FROM USER_CONSTRAINTS
ORDER BY CONSTRAINT_TYPE;

ALTER TABLE TABLE_NOTNULL2
    MODIFY TEL CONSTRAINT TBLNN_TEL_NN NOT NULL;

-- ���� ���� �̸� ����
ALTER TABLE TABLE_NOTNULL2
RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN2_TEL_NN;

-- ���� ���� ����
ALTER TABLE TABLE_NOTNULL2
DROP CONSTRAINT TBLNN2_TEL_NN;

-- TABLE_UNIQUE
-- LOGIN_ID VARCHAR2(20) UNIQUE
-- LOGIN_PWD VARCHAR2(20) NOT NULL
-- TEL VARCHAR2(20)
CREATE TABLE TABLE_UNIQUE (
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN_LID_NN UNIQUE
    , LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLNN_LPW_NN NOT NULL
    , TEL VARCHAR2(20)
);
-- ���� ���� Ȯ��
SELECT
    OWNER
    , CONSTRAINT_NAME
    , CONSTRAINT_TYPE
    , TABLE_NAME
    , SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_UNIQUE'
ORDER BY CONSTRAINT_TYPE;

INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL)
VALUES ('TEST_ID_01', '1234', '010-1234-5678');

INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL)
VALUES ('TEST_ID_02', '1234', '010-1111-9876');

-- unique�� �ߺ��� �ȵ� �� null�� �� �� �ִ�
INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL)
VALUES (null, '0000', '010-9876-5432');

UPDATE TABLE_UNIQUE
SET LOGIN_ID = 'TEST_ID_03'
WHERE LOGIN_ID IS NULL;

UPDATE TABLE_UNIQUE
SET TEL = '010-1357-2468'
WHERE TEL = '010-1111-9876';

ALTER TABLE TABLE_UNIQUE
MODIFY TEL CONSTRAINT TBLNN_TEL_UNQ UNIQUE;

ALTER TABLE TABLE_UNIQUE
RENAME CONSTRAINT TBLNN_TEL_UNQ to TBLUNQ2_TEL_UNQ;
-- ���� ������ �߰��Ϸ��� ����� ���� �ο��ؾ���
ALTER TABLE TABLE_UNIQUE
DROP CONSTRAINT TBLUNQ_LID_UNQ;

ALTER TABLE TABLE_UNIQUE
MODIFY LOGIN_ID CONSTRAINT TBLUNQ_LID_UNQ UNIQUE NOT NULL;

-- PRIMARY KEY: unique + not null
-- pk�� �� ���̺� �� ���� ���� ����

CREATE TABLE TABLE_PK (
    LOGIN_ID    VARCHAR2(20) PRIMARY KEY
    , LOGIN_PWD VARCHAR2(20) NOT NULL
    , TEL       VARCHAR2(20)
);

CREATE TABLE TABLE_PK2 (
    LOGIN_ID    VARCHAR2(20) CONSTRAINT TBLPK2_LID_PK PRIMARY KEY
    , LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLPK2_PQW_NN NOT NULL
    , TEL       VARCHAR2(20)
);

-- INDEX: �����ͺ��̽����� �����͸� ���� ������ ȿ�������� �˻��ϱ� ���� ����ϴ� ������ ����. å�� ����ó�� �۵��Ѵ�.
-- DB ���̺� ������ Ư�� ���� ������ ã�� �� �ְ� ���ش�.

-- ���̺��� �ε��� ���� Ȯ��
SELECT
    INDEX_NAME
    , TABLE_OWNER
    , TABLE_NAME
FROM USER_INDEXES
WHERE TABLE_NAME LIKE 'TABLE_PK%';

INSERT INTO TABLE_PK (LOGIN_ID, LOGIN_PWD, TEL)
VALUES ('TEST_ID_01', '1234', '010-1234-5678');

SELECT * FROM TABLE_PK;

-- �ζ��� �Ǵ� ������ ���� ���� ����
CREATE TABLE TBL (
    COL1 VARCHAR2(100) CONSTRAINT AAAA PRIMARY KEY
    , COL2 VARCHAR2(50) NOT NULL
    , COL3 VARCHAR2(1)
);
-- �ƿ�������� �Ǵ� ���̺� ���� ���� ���� ����
CREATE TABLE TBL (
    COL1 VARCHAR2(100)
    , COL2 VARCHAR2(50)
    , COL3 VARCHAR2(1)
    , PRIMARY KEY(COL1)
    , CONSTRAINT ABC UNIQUE(COL2)
);

SELECT
    OWNER
    , CONSTRAINT_NAME
    , CONSTRAINT_TYPE
    , TABLE_NAME
    , SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_PK2'
ORDER BY CONSTRAINT_TYPE;

-- foreign key
-- �ܷ�Ű, �ܺ�Ű�� �θ��⵵ �Ѵ�. ���� �ٸ� ���̺� �� ���踦 �����ϴµ� ����ϴ� ���� ����.
-- Ư�� ���̺��� pk���� ������ ������ ���� �ٸ� ���̺��� Ư�� ������ �����ϰڴٴ� �ǹ�

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('EMP', 'DEPT');

SELECT * FROM EMP;
SELECT * FROM DEPT;

INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(9999, 'ȫ�浿', 'CLERK', '7788', SYSDATE, 1200, NULL, 50); -- �θ� Ű�� �����ϴ� ��µ�

-- CREATE TABLE ���̺��̸� (
--      ...�ٸ� ���� ����,
--      ���̸� �ڷ��� REFERENCES ������ ���̺�(������ ��)
-- );

-- CREATE TABLE ���̺��̸� (
--      ...�ٸ� ���� ����,
--      CONSTRAINT [���� ���� �̸�] FOREIGN KEY [��]
--      REFERENCES ������ ���̺�(������ ��)
-- );

CREATE TABLE DEPT_FK (
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY
    , DNAME VARCHAR2(14)
    , LOC VARCHAR2(13)
);

CREATE TABLE EMP_FK (
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY
    , ENAME VARCHAR2(10)
    , JOB VARCHAR2(9)
    , MGR NUMBER(4)
    , HIREDATE DATE
    , SAL NUMBER(7, 2)
    , COMM NUMBER(7, 2)
    , DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK (DEPTNO)
);

INSERT INTO EMP_FK
VALUES (9999, 'TEST_NAME', 'TEST_JOB', null, SYSDATE, 3000, NULL, 10); -- ���Ἲ �������� ���� - �θ�Ű�� ���ٰ� ��

INSERT INTO DEPT_FK
VALUES (10, 'TEST_DNAME', 'TEST_LOC'); -- �̰� ���� �����ؾ� �Ʒ��� ������ �� ����
INSERT INTO EMP_FK
VALUES (9999, 'TEST_NAME', 'TEST_JOB', null, SYSDATE, 3000, NULL, 10);

-- DEPT_FK >> 10���μ� �����Ͱ� �ִ�
-- EMP_FK >> 10���μ��� �����ϴ� �����Ͱ� �ִ�

-- DEPT_FK�� DEPTNO = 10�� �����Ϸ���
-- 1. ���� �����Ϸ��� �� ���� �����ϴ� �����͸� ���� ����
    -- EMP_FK > 10���� ���� ���� ����
-- 2. ���� �����Ϸ��� �� ���� �����ϴ� �����͸� ����
    -- EMP_FK > 10���� ���� �� ���� null �Ǵ� �ٸ� �μ� ������ ���� �� ����
-- 3. ���� �����Ϸ��� ���� �����ϴ� �ڽ� ���̺��� FK ���� ������ �����Ѵ�

-- CONSTRAINT [���������̸�] REFERENCES �������̺�(������ ��) ON DELETE CASCADE >> �� ���̺� �ִ� ������ ��� ������
-- CONSTRAINT [���������̸�] REFERENCES �������̺�(������ ��) ON DELETE SET NULL >> �� ����

CREATE TABLE TABLE_CHECK (
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LID_PK PRIMARY KEY
    , LOGIN_PW VARCHAR2(20) CONSTRAINT TBLCK_LPW_CK CHECK (LENGTH(LOGIN_PW) > 3)
    , TEL VARCHAR2(20)
);
INSERT INTO TABLE_CHECK
VALUES ('TEST_ID', '1234', '010-1234-5678');

-- DEFALUT >> �⺻���� �ǹ�
CREATE TABLE TABLE_DEFAULT (
    LOGIN_ID VARCHAR2(20),
    LOGIN_PW VARCHAR2(20) DEFAULT '1234',
    TEL VARCHAR2(20)
);
INSERT INTO TABLE_DEFAULT
VALUES ('TEST_ID', null, '010-0000-0000'); -- �н����� ���� �����ϸ� �����Ѵ�� �����
INSERT INTO TABLE_DEFAULT (login_id, tel)
VALUES ('TEST_ID_02', '010-0000-0000'); -- �н����� ���� �������� ������ �⺻������ �����

-- ���� ����
-- ���ǿ� �´� ���̺� ����
CREATE TABLE DEPT_CONST (
    DEPTNO NUMBER(2) CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14) CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE,
    LOC VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL
);
-- ���ǿ� �´� ���̺� ����
CREATE TABLE EMP_CONST (
    EMPNO NUMBER(4) CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR(10) CONSTRAINT EMPCONST_ENAME_NN NOT NULL,
    JOB VARCHAR2(9),
    TEL VARCHAR2(20) CONSTRAINT EMPCONST_TEL_UNQ UNIQUE,
    HIREDATE DATE,
    SAL NUMBER(7,2) CONSTRAINT EMPCONST_SAL_CHK CHECK(SAL BETWEEN 1000 AND 9999),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPCONST_DEPTNO_FK REFERENCES DEPT_CONST (DEPTNO)
);
-- ���� ���� Ȯ��
SELECT
    TABLE_NAME
    , CONSTRAINT_NAME
    , CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('DEPT_CONST', 'EMP_CONST')
ORDER BY CONSTRAINT_NAME;


-- 0812
-- group by ����
-- group by ���� ����� �� ������: ���� �� �Լ��� ������� ���� �Ϲ� ���� group by���� ������� ������ select������ ��� �Ұ�
-- having: group by���� ������ ���� ��� ����. group by���� ������ �� �� ���

-- select ��ȸ�� ��1 �̸�, ... , ��ȸ�� ��n �̸�
-- from ��ȸ�� ���̺�
-- where ��ȸ�� ���� ����
-- group by �׷�ȭ �� �� ����(n��)
-- having ��� ����� �����ϴ� ����
-- order by �����Ϸ��� �� ����;

-- where: ������ �Լ� ��� �Ұ�, ��� ��� ���� ����
-- having: ��ǥ(,)�� ���� �߰� ����


-- rollup, cube, grouping sets
-- ���� �Լ����� group by���� ������ �� �ִ� Ư���� �Լ�
-- rollup, cube: �׷�ȭ �������� �հ踦 �Բ� ����Ѵ�
    -- rollup: �� �׷��� �հ� �����͸� ���
    -- cube: ��� �׷��� �հ� ������ ���

-- select ...
-- from ���̺�
-- where ����
-- group by rollup/cube �׷�ȭ �� ����;
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

-- listagg �Լ�
-- ����Ŭ 11g���� ���
-- �׷쿡 ���� �ִ� �����͸� ���η� �����ϴ� �Լ�
select
    deptno
    , listagg(ename, ', ')
        within group(order by sal desc) as enames
from emp
group by deptno; -- �޿� ����������� �̸��� ������������ ���� ���� ����


-- pivot / unpivot �Լ�
-- �� ������ �ʴ´�, �׳��� pivot�� unpivot�� ���� �� ��� �󵵰� ����
-- pivot: ���� ������ ���� ���� �ٲ㼭 ���
-- unpivot: ���� ������ ���� ������ �ٲ㼭 ���

-- �μ���, ��å���� �׷�ȭ�ϰ� �ְ� �޿� ������ ����ϱ�
select *
    from (select deptno, job, sal from emp)
    pivot(max(sal) for deptno in (10, 20, 30))
order by job;

-- join
-- ������ �����ͺ��̽��� ���� ������ �����Ͱ� �پ��� ���̺� ������ ����Ǵ� Ư��
-- �ΰ� �̻��� ���̺��� �����ϰ� �ϳ��� ���̺�ó�� ����� �� ����ϴ� ���

-- ���� ���̺��� ����� ���� from��
-- from���� �������� ���̺��� ������ �� �ִ�
    -- select * from ���̺�1, ���̺�2, ... , ���̺�n;

-- ���̺� ��Ī ���� �� �Բ� ���
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
order by empno;
-- � join(�� �Ⱦ�)

-- natural join: � ������ ����ؼ� ����ϴ� ���� ���. ���� ����� �Ǵ� �� ���̺� �̸��� �ڷ����� ���� ���� ã�� �� �� ���� �������� � �����Ѵ�.
-- �ڵ����� ������ ���� select���� ����� �� ���̺� ��Ī�� ���̸� �ȵȴ�

-- ���� ���� ����̳� ��ġ�� ���� ��Ī ���� �����ؾ���
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, deptno, d.dname, d.loc
from emp e natural join dept d
order by empno;

-- join ~ using
-- � ������ ����ϴ� ���� ���
-- natural join�� �ٸ� ���� natural join�� �ڵ����� ���� ���ؿ��� ���������� using Ű���忡 ���� �������� ����� ���� ����Ѵ�.
-- ��) from ���̺�1 join ���̺�2 using (���ο� ����� ���� ��)
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, deptno, d.dname, d.loc
from emp e join dept d using (deptno)
where sal >= 3000
order by deptno, e.empno;

-- join ~ on
-- ���� ���� ����ϴ� ���� ���
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno, d.dname, d.loc
from emp e join dept d on (e.deptno = d.deptno)
where sal >= 3000
order by deptno, e.empno;

-- outer join(�ܺ� ����)
-- from ���̺�1 left outer join ���̺�2 on (e1.mgr = e2.empno): ���̺�1�� ���ʿ� �ΰ� ���̺�2�� �ٿ���(null ���� �־ ������ �� ���)
    -- �����ʿ� ���̰� ������ right outer join ���� ��
select
    e1.empno, e1.ename, e1.mgr,
    e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 left outer join emp e2 on (e1.mgr = e2.empno)
order by e1.empno;

-- full outer join
-- left outer join + right outer join >> �����̶� �������� null�� ��� ��� ���
select
    e1.empno, e1.ename, e1.mgr,
    e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 full outer join emp e2 on (e1.mgr = e2.empno)
order by e1.empno;

-- select *
-- from aaa a
-- left outer join bbb b on a.id = b.id
-- left outer join ccc c on b.id = c.id
-- �̷������� ��� �� �� �ִ�

select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno, d.dname, d.loc
from emp e full outer join dept d on (e.deptno = d.deptno)
order by deptno, e.empno;
update emp set deptno = null where empno = 7839;

-- inner join(= join)
-- ���� ���̺� ��� �����ϴ� �͸� ���(join ~ on �� ������ inner join ~ on�� �ַ� ����Ѵ�)

-- ����� �μ� ���� ��� emp, dept
SELECT
    A.EMPNO, A.ENAME, A.JOB, A.DEPTNO, B.DNAME
FROM EMP A INNER JOIN DEPT B ON A.DEPTNO = B.DEPTNO
ORDER BY A.EMPNO;

-- hash join, loop join, nerge join �� �����Ѵ�(�����Ͱ� ���� �� ��ȿ)

-- left out join((+)�� �������� �ٲٸ� right out join) // ���� �� �ʿ�� ����
select
    a.empno, a.ename, a.job, a.deptno, b.dname
from emp a, dept b
where a.deptno = b.deptno(+)
order by a.empno;

-- �޿��� 2000 �ʰ��� ������� �μ� ����, ��� ���� ���
-- sql 99 ���� ���
select
    d.deptno, d.dname, e.empno, e.ename, e.sal
from emp e, dept d 
    where e.deptno = d.deptno
    and e.sal > 2000;
-- sql 99
select
    d.deptno, d.dname, e.empno, e.ename, e.sal
from emp e natural join dept d
    where e.sal > 2000;

-- �� �μ��� ��� �޿�, �ִ� �޿�, �ּ� �޿�, ��� �� ���
select
    d.deptno, d.dname, trunc(avg(e.sal)) as avg_sal, max(e.sal) as max_sal, min(e.sal) as min_sal, count(*) as cnt
from emp e, dept d
    where e.deptno = d.deptno
group by d.deptno, d.dname;

select
    d.deptno, d.dname, trunc(avg(e.sal)) as avg_sal, max(e.sal) as max_sal, min(e.sal) as min_sal, count(*) as cnt
from emp e inner join dept d on (e.deptno = d.deptno)
group by d.deptno, d.dname;

-- ��� �μ� ������ ��� ������ �μ� ��ȣ, ��� �̸������� �����Ͽ� ���
-- sql 99 ���� ���
select
    d.deptno, d.dname, e.ename, e.job, e.sal
from emp e, dept d 
    where e.deptno(+) = d.deptno
order by d.deptno, e.ename;
-- sql 99
select
    d.deptno, d.dname, e.ename, e.job, e.sal
from emp e right outer join dept d on (e.deptno = d.deptno)
order by d.deptno, e.ename;

-- ��� �μ� ����, ��� ����, �޿� ��� ����, �� ����� ���� ����� ������ �μ�, ��� ��ȣ ������ �����Ϸ� ���
select
    d.deptno, d.dname
    , e1.empno, e1.ename, e1.mgr, e1.sal, e1.deptno
    , s.losal, s.hisal, s.grade
    , e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1, dept d, salgrade s, emp e2
    where e1.deptno(+) = d.deptno
        and e1.sal between s.losal(+) and s.hisal(+)
        and e1.mgr = e2.empno(+)
order by d.deptno, e1.empno;

select
    d.deptno, d.dname
    , e1.empno, e1.ename, e1.mgr, e1.sal, e1.deptno
    , s.losal, s.hisal, s.grade
    , e2.empno as mgr_empno, e2.ename as mgr_ename
from dept d
    left outer join emp e1 on (e1.deptno = d.deptno)
    left outer join salgrade s on (e1.sal between s.losal and s.hisal)
    left outer join emp e2 on (e1.mgr = e2.empno)
order by d.deptno, e1.empno;

-- sub query(���� ����)
-- sql ������ ������ �� select�� �ȿ� select���� �ۼ��ϴ� ��
-- select ��ȸ�� ��
-- from ��ȸ�� ���̺�
-- where ���ǽ�(
--      select ��ȸ�� ��
--      from ��ȸ�� ���̺�
--      where ���ǽ�
-- );
-- 1��
SELECT SAL FROM EMP WHERE ENAME = 'JONES';
-- jones�� �޿��� 2975
select * from emp where sal > 2975;
-- �޿��� 2975 �ʰ��� ��� ã��
-- ���������� ���� >>
SELECT *
FROM EMP
WHERE SAL > (
    SELECT SAL
    FROM EMP
    WHERE ENAME = 'JONES'
);
-- ���������� Ư¡
-- 1. ���������� �����ڿ� ���� �� �Ǵ� ��ȸ ����� ������ ���� ��ȣ�� ���´�.
-- 2. �� ���� ���̽��� �����ϳ� ��κ��� ���������� order by�� ����� �� ����.
-- 3. ���������� select���� ����� ���� ���� ������ �� ���� ���� �ڷ����� ���� ����� �����ؾ� �Ѵ�. ��, ���� ������ �� ��� �����Ͱ� �ϳ���� ���������� select�� ���� ���� �ڷ����� ���� �ϳ� �����ؾ� �Ѵ�.
-- 4. ���������� �ִ� select���� ��� �� ���� �Բ� ����ϴ� ���� ������ ������ ������ ȣȯ �����ؾ� �Ѵ�.
    -- ��: ���� ������ ����� �����ڰ� �� �ϳ��� �����ͷθ� ������ ������ �����ڶ�� ���� ������ ��� �� ���� �ݵ�� �ϳ����� �Ѵ�.

-- ���������� ����ؼ� emp ���̺��� ��� ���� �߿� ����̸��� allen�� ����� �߰� ���纸�� ���� �߰� ������ �޴� ��� ������ ���
SELECT *
FROM EMP
WHERE COMM > (
    SELECT COMM
    FROM EMP
    WHERE ENAME = 'ALLEN'
);

-- �̷��͵鵵 �����ϴ�(���Ŀ� ���� ����� �� ������ ������ �˾Ƶ���)
-- �������̸� ���������� �Ⱦ��� �������� ������ �ؾߵ�
-- select
    -- a.id, a.title
    -- , (
        -- select e.content from eeee e
        -- where e.id = 10
    -- ) as e_content
-- from aaaa a inner join bbbb b on a.id = b.id
    -- left outer join (
        -- select * from cccc c
            -- inner join dddd d on c.id = d.id
        -- where ~~~
    -- ) z on z.id = a.id;


-- 0813
-- ������ ��������(single-row subquery)
-- �ʰ�(>), �̻�(>=), ����(=), ����(<=), �̸�(<), ���� ����(<>, !=, ^=)

-- ���������� ����� 1�� �̻� ��µǸ� ������ ��������(multiple-row subquery)�� ����Ѵ�.
SELECT
    E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E
    INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 20
    AND E.SAL > (SELECT AVG(SAL) FROM EMP);
    
-- ���������� ����ؼ� emp ���̺��� ��ü ����� ��� �޿����� �۰ų� ���� �޿��� �ް� �ִ� 20�� �μ��� ��� �� �μ��� ������ ���
SELECT
    E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E
    INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 20
    AND E.SAL <= (SELECT AVG(SAL) FROM EMP);

-- ������ ��������(multiple-row subquery)
-- ������ ������ ����
-- IN: ���������� �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�� �����Ͱ� ������ true
-- ANY, SOME: ���������� ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� true
-- ALL: ���������� ���ǽ��� ���������� ��� ��ΰ� �����ϸ� true
-- EXISTS: ���������� ����� �����ϸ�, ��, ���� 1�� �̻��� ��� true

-- EMP > �μ���ȣ 20, 30�� ��� ���� ���
SELECT * FROM EMP
WHERE DEPTNO IN (20, 30);

SELECT * FROM EMP
WHERE SAL IN (
    SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO
);

-- ANY, SOME
SELECT * FROM EMP WHERE SAL = SOME (
    SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO
);
-- �μ���ȣ 30�� ������� �޿����� �� �޴� �������� ���
SELECT * FROM EMP WHERE SAL > ALL (
    SELECT SAL FROM EMP WHERE DEPTNO = 30
);

-- EXISTS: ���������� ��� ���� �ϳ� �̻� �����ϸ� ���ǽ��� ��� true, �������� ������ ��� false
SELECT * FROM EMP WHERE EXISTS (
    SELECT DNAME FROM DEPT WHERE DEPTNO = 10
);

-- ������ �빮�ڷ� ���� ����
-- 1. ������
-- 2. ǥ��ȭ(�ϰ���)
-- 3. ����

-- ���߿� ��������(multiple-column subquery)
SELECT * FROM EMP
WHERE (DEPTNO, SAL) IN (
    SELECT DEPTNO, MAX(SAL) FROM EMP
);

-- FROM������ ����ϴ� �������� with��
SELECT E10.EMPNO, E10.ENAME,E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10, -- �ζ��� ��(inline view)
    (SELECT * FROM DEPT) D -- �ζ��� ��(���̺��� �ʹ� Ŀ Ư�� �����;ȿ��� ã�� �� ���, �������� �������� �Ѵ�)
WHERE E10.DEPTNO = D.DEPTNO;
-- WITH: ���������� �� select�� �ȿ��� ����� ���������� ��Ī�� ���� ������ �� ���������� ����Ѵ�.
-- Ȱ���
-- with
-- [��Ī1] as [select�� 1],
-- [��Ī2] as [select�� 2],
-- ...
-- [��Īn] as [select�� n]
-- select from ��Ī1, ��Ī2, ...
WITH
    E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
    D AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO = D.DEPTNO;

-- SELECT������ ����ϴ� ��������(��Į�� �������� scalar subquery)
SELECT 
    EMPNO, ENAME, JOB, SAL,
    (SELECT GRADE FROM SALGRADE
        WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
    DEPTNO,
    (SELECT DNAME FROM DEPT
        WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
FROM EMP E;

-- ��ü ��� �� allen�� ���� ��å�� ������� �������, �μ����� ���
SELECT
    E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN')
AND E.DEPTNO = D.DEPTNO;
-- ��ü ����� ��� �޿����� ���� �޿��� �޴� ������� �������, �μ� ����, �޿� ������� ���(�޿��� ���������� ����, �޿� ���� ��� �����ȣ ���� ��������)
SELECT
    E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.SAL > (SELECT AVG(SAL) FROM EMP)
    AND E.DEPTNO = D.DEPTNO
    AND E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY E.SAL DESC, E.EMPNO ASC;
-- ��å�� salesman�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� �������, �޿�������� ���(���������� Ȱ���Ҷ� �������Լ��� ����ϴ� ����� ������� �ʴ� ����� ���� �����ȣ �������� ����)
-- ������ �Լ� ���X
SELECT
    E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND E.SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO ASC;
-- ������ �Լ� ���
SELECT
    E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND E.SAL > ALL (SELECT DISTINCT SAL FROM EMP WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO ASC;

CREATE TABLE DEPT_TCL AS SELECT * FROM DEPT;
-- INSERT, UPDATE, SELECT, SELECT
INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;
DELETE FROM DEPT_TCL WHERE DEPTNO = 50;
SELECT * FROM DEPT_TCL;

-- ROLLBACK: ���� Ʈ����ǿ� ���Ե� ������ ���� ���� ��ɾ��� ������ ��� ����Ѵ�.
ROLLBACK;
-- COMMIT: ���ݱ��� Ʈ����ǿ��� ������ ���� ���� ��ɾ ���� ����� �����͸� ��� �����ͺ��̽��� ������ �ݿ��Ѵ�. rollback �ȵ�.
COMMIT;


-- ����(session): � Ȱ���� ���� �ð� �Ǵ� �Ⱓ
DELETE FROM DEPT_TCL WHERE DEPTNO = 50;
COMMIT; -- Ŀ���� �ؾ� ��� ������Ʈ(cmd)���� �Ȱ��� ����� �ص� �ݿ��� �����ͺ��̽��� �״�� ���� �� �ִ�.

-- LOCK: Ư�� ���ǿ��� �������� �����ʹ� Ʈ������� �Ϸ�Ǳ� ������ �ٸ� ���ǿ��� ������ �� ���� ����. ��, �����Ͱ� ����.
-- Ư�� ���ǿ��� ������ ������ �Ϸ�� ������ �ٸ� ���ǿ��� �ش� ������ ������ ��ٸ��� ������ HANG(��)�̶�� �Ѵ�.
SELECT * FROM DEPT_TCL;
UPDATE DEPT_TCL SET LOC = 'SEOUL' WHERE DEPTNO = 30;
COMMIT;

-- ���
-- ���߱�

-- ������(sequence): ��Ģ�� ���� ������ �����Ѵ�.
-- CREATE SEQUENCE ������ �̸�
-- [INCREMENT BY n] -- ���������� ������ ��ȣ�� ���� ��(�⺻�� 1) (����)
-- [START WITH n] -- ���������� ������ ��ȣ�� ���� ��(�⺻�� 1) (����)
-- [MAXVALUE n | NOMAXVALUE] -- ���������� ������ ��ȣ�� �ִ�, �ִ��� ���۰�(START WITH) �̻�, �ּڰ�(MINVALUE)�� �ʰ������� ����
        -- NOMAXVALUE >> �������� 10 27, �������� >> -1�� ����(����)
-- [MINVALUE n | NOMAXVALUE] -- ���������� ������ ��ȣ�� �ּڰ�, �ּڰ��� ���۰�(START WITH) ����, �ִ�(MAXVALUE)�� �̸������� ����
        -- NOMAXVALUE >> ���������̸� 1, ���������̸� 10-26���� ����(����)
-- [CYCLE | NOCYCLE] -- ���������� ������ ��ȣ�� �ִ�(MAXVALUE)�� �������� �� CYCLE�̸� ���۰�(START WITH)���� �ٽ� ����
        -- NOCYCLE�̸� ��ȣ ���� �ߴ�. �׸��� �߰���ȣ ������ ��û�ϸ� ���� �߻�(����)
-- [CACHE n | NOCACHE] -- �������� ������ ��ȣ�� �޸𸮿� �̸� �Ҵ��� ���� ���� ����
        -- NOCACHE�� �̸� �������� �ʵ��� ����, �ɼ� ��� �����ϸ� �⺻���� 20(����)
        
CREATE TABLE DEPT_SEQUENCE
    AS SELECT * FROM DEPT WHERE 1 <> 1;
    
SELECT * FROM DEPT_SEQUENCE;

CREATE SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 10
    START WITH 10
    MAXVALUE 90
    MINVALUE 0
    NOCYCLE
    CACHE 2;
    
SELECT * FROM USER_SEQUENCES;

-- ������ ���
-- �������̸�.CURRVAL >> ���������� ���������� ������ ��ȣ / �������̸�.NEXTVAL >> ���� ��ȣ ����

INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
    VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL'); -- maxvalue�� 90���� �����ؼ� 10��° ���Ժ��� ���� �߻�
-- ���� ���������� ������ ������ Ȯ��
SELECT SEQ_DEPT_SEQUENCE.CURRVAL FROM DUAL;

-- ������ ����(START WITH ���� �Ұ�)
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 3
    -- START WITH �� ���� �Ұ�
    MAXVALUE 99
    CYCLE;

INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
    VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL'); -- cycle�� �����߱� ������ 99���� �͵� �ٽ� 0���� ����, cycle�� �������� ����)
    
SELECT * FROM DEPT_SEQUENCE;

-- ������ ����
DROP SEQUENCE SEQ_DEPT_SEQUENCE;
-- �������� �����ص� ������ �������� ����ؼ� ���� ���̺��� ������ �ٲ��� ����


-- PL/SQL
-- �����ͺ��̽� ���� Ư�� �۾��� �����ϴ� ��ɾ�� ���࿡ �ʿ��� ���� ���� ��Ҹ� �����ϴ� ��ɾ� ������ �����Ǹ�, �̷��� ��ɾ ��� �� PL/SQL ���α׷��� �⺻ ������ ���(block)�̶�� �Ѵ�.
-- DECLARE(�����) / ���� / ���࿡ ����� ����, ���, Ŀ�� ���� ����
-- BEGIN (�����) / �ʼ� / ���ǹ�, �ݺ���, SELECT, DML, �Լ� ���� ����
-- EXCEPTION (����ó����) / ���� / PL/SQL���� �� �߻��ϴ� ���� ��Ȳ�� �ذ��ϴ� ���� ���
/*
DECLARE
    [���࿡ �ʿ��� ���� ��� ����];
BEGIN
    [�۾��� ���� ���� �����ϴ� ��ɾ�];
EXCEPTION
    [PL/SQL ���� �� �߻��ϴ� ���� ó��];
END;
*/
-- �������� ȭ�鿡 ���
SET SERVEROUTPUT ON;

/*
������ �ּ�ó��
*/

-- DBMS_OUTPUT.PUT_LINE() = SYSTEM.OUT.PRINTLN()
-- ����, ���
-- ���� ����
-- [�����̸�] [�ڷ���] := [�� �Ǵ� ���� ����Ǵ� ���� ǥ����];
DECLARE
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- ��� ����
-- [�����̸�] CONSTANT [�ڷ���] := [�� �Ǵ� ���� �����ϴ� ���� ǥ����];
DECLARE
    V_TAX NUMBER(1) := 3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
/

-- ������ �⺻ �� ����
-- [�����̸�] [�ڷ���] DEFAULT [�� �Ǵ� ���� ����Ǵ� ���� ǥ����];
DECLARE
    V_DEPTNO NUMBER(2) DEFAULT 10; -- ���� ���� �� �⺻���� ����
    V_DEPTNO2 NUMBER(2) := 10; -- ���� ����� ���ÿ� �ʱⰪ ����
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- ������ NULL�� ���� ����
-- [�����̸�] [�ڷ���] NOT NULL := [�� �Ǵ� ���� ����Ǵ� ���� ǥ����];
DECLARE
    V_NN NUMBER(2) NOT NULL := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_NN : ' || V_NN);
END;
/

-- ���� �̸� ���ϱ�
-- 1. ���� ��� �ȿ��� �ĺ��ڴ� �����ؾ��ϰ� �ߺ��� �� ����.
-- 2. ��ҹ��� ������ ���� �ʴ´�.
-- 3. ���̺� �̸� ���̴� ��Ģ�� ������ ��Ģ�̴�.
    -- �̸��� ���ڷ� ����, ���ڷ� ������ �� ���� �ѱ۵� ������ ������ ��������. �̸��� 30����Ʈ ���� > ���� 30��, �ѱ� 15��.
    -- ������(�ѱ� ��� ����), ����(0~9), Ư������($,#,_) ��� ����
    -- SQL Ű����� ���̺� �̸����� ��� �Ұ�(SELECT, FROM ��)

-- ������ �ڷ���
-- ������ ������ �����Ͱ� � ���������� Ư������ ���� ����ϴ� �ڷ����� ũ�� ��Į��(SCALAR), ����(COMPOSITE), ����(REFERENCE), LOB(LARGE OBJECT)�� ���еȴ�.
-- ��Į����: ���ݱ��� ����� �ڷ���. ����, ���ڿ�, ��¥ ��. ����Ŭ���� �⺻���� ������ ���� �ڷ����̰� ���� ���� ��Ұ� ���� ���� ���� �ǹ� // �ڹٿ��� PRIMIRIVE�� ����
-- ���� / NUMBER / �Ҽ����� ������ �� �ִ� �ִ� 38�ڸ� ����
-- ���ڿ� / CHAR / �ִ� 32,767 ����Ʈ ���� ���� ���ڿ�
        -- VARCHAR2 / �ִ� 32,767 ����Ʈ ���� ���� ���ڿ�
-- ��¥ / DATE / 9999�� 12�� 31�ϱ����� ��¥
-- �� / BOOLEAN / PL/SQL������ ����� �� �ִ� �� �ڷ���. TRUE, FALSE, NULL�� ����

-- ������: ����ŬDB�� �����ϴ� Ư�� ���̺� ���� �ڷ����̳� �ϳ��� �� ������ �����ϴ� �ڷ���
        -- ���� ������ ���� %TYPE / ���� ������ ���� %ROWTYPE
-- [�����̸�] [���̺��̸�].[���̸�]%TYPE;
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/
-- [�����̸�] [���̺��̸�]%ROWTYPE;
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT WHERE DEPTNO = 40;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
END;
/

-- ������
-- �÷��� / TABLE / �Ѱ��� �ڷ����� �����͸� ���� �� ���� (���̺� ���� ����)
-- ���ڵ� / RECORD / ���� ���� �ڷ����� �����͸� ���� (���̺��� ��� ����)
-- LOB: LARGE OBJECT, ��뷮�� �ؽ�Ʈ, �̹���, ������ �� ��뷮 �����͸� �����ϱ� ���� �ڷ��� (BLOB, CLOB ��)

-- IF
-- IF ~ THEN
/*
IF [���ǽ�] THEN [������ ��ɾ�];
END IF;
*/
-- ������ �Է��� ���� Ȧ������ ¦������ �Ǵ�
DECLARE
    V_NUMBER NUMBER := 13;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER�� Ȧ���Դϴ�.');
    END IF;
END;
/

-- IF ~ THEN ~ ELSE
/*
IF [���ǽ�] THEN [������ ��ɾ�];
ELSE [������ ��ɾ�];
END IF;
*/
-- ����: ���� �޿��� ���� ���ʽ� ����(�޿��� 5000���� ũ�� ���ʽ� 1000 ����, �׷��� ������ 500�� ����)
DECLARE
    V_SAL NUMBER := 4000;
    V_BONUS NUMBER;
BEGIN
    IF V_SAL > 5000 THEN
        V_BONUS := 1000;
        DBMS_OUTPUT.PUT_LINE('���ʽ� : ' || V_BONUS);
    ELSE
        V_BONUS := 500;
        DBMS_OUTPUT.PUT_LINE('���ʽ� : ' || V_BONUS);
    END IF;
END;
/

-- IF ~ THEN ~ ELSIF
/*
IF [���ǽ�] THEN [������ ��ɾ�];
ELSIF [���ǽ�] THEN
    [������ ��ɾ�];
ELSIF [���ǽ�] THEN
    [������ ��ɾ�];
...
ELSE
    [������ ��ɾ�];
END IF;
*/
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    IF V_SCORE >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A����');
    ELSIF V_SCORE >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('B����');
    ELSIF V_SCORE >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('C����');
    ELSIF V_SCORE >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('D����');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F����');
    END IF;
END;
/

-- CASE
/*
CASE [�� ����]
    WHEN [��1] THEN
        [������ ��ɾ�];
    WHEN [��2] THEN
        [������ ��ɾ�];
    ...
    ELSE
        [������ ��ɾ�];
END CASE;
*/
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    CASE TRUNC(V_SCORE/10)
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A����');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A����');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B����');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C����');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('D����');
        ELSE DBMS_OUTPUT.PUT_LINE('F����');
    END CASE;
END;
/

-- �ݺ���
-- LOOP: �⺻ �ݺ���
/*
LOOP
    [�ݺ� ���� �۾�];
END LOOP;
*/

-- WHILE LOOP: Ư�� ���ǽ��� ����� ���� �ݺ� ����
    -- WHILE�� ������ TRUE�� ���� �ݺ�, FALSE�� �ݺ� ����
/*
WHILE [���ǽ�] LOOP
    [�ݺ� ���� �۾�];
END LOOP;
*/
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    WHILE V_NUM < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM + 1;
    END LOOP;
END;
/

-- FOR LOOP: �ݺ� Ƚ���� ���Ͽ� �ݺ� ����
/*
FOR [����] IN [���۰�]..[���ᰪ] LOOP
    [�ݺ� ���� �۾�];
END LOOP;
*/
BEGIN
    FOR i IN 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� i�� �� : ' || i);
    END LOOP;
END;
/
-- ���� �ݺ��� �������� ����ϱ�
BEGIN
    FOR i IN REVERSE 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� i�� �� : ' || i);
    END LOOP;
END;
/
-- ���� �ݺ��� �� ¦���� ����ϱ�
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i, 2) = 1;
        DBMS_OUTPUT.PUT_LINE('���� i�� �� : ' || i);
    END LOOP;
END;
/

-- CURSOR FOR LOOP: Ŀ���� Ȱ���� �ݺ� ����

-- EXIT: �������� �ݺ� ����
-- EXIT WHEN: �ݺ� ���Ḧ ���� ���ǽ��� �����ϰ� �����ϸ� �ݺ� ����
-- CONTINUE: �������� �ݺ��� ���� �ֱ⸦ �ǳʶ�
-- CONTINUE WHEN: Ư�� ���ǽ��� �����ϰ� ���ǽ��� �����ϸ� ���� �ݺ� �ֱ⸦ �ǳʶ�
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM + 1;
        EXIT WHEN V_NUM > 4;
    END LOOP;
END;
/
-- EXIT WHEN�� ������� �ʴ� ���
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM + 1;
        IF V_NUM > 4 THEN
            EXIT;
        END IF;
    END LOOP;
END;
/


-- 0814
-- ���ڵ�, �÷���
-- ���ڵ�: �ڷ����� ���� �ٸ� �����͸� �ϳ��� ������ �����ϴµ� ����Ѵ�.
/*
TYPE [���ڵ� �̸�] IS RECORD (
    [�����̸�] [�ڷ���] [NOT NULL] :=(�Ǵ� DEFAULT) �� �Ǵ� ����Ǵ� ���� ǥ����
)
*/

SET SERVEROUTPUT ON;

DECLARE
    TYPE REC_DEPT IS RECORD (
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_DEPT; -- Ŭ���� �����ϴ°Ŷ� �����(Person p = new Person();)
BEGIN
    DEPT_REC.DEPTNO := 99;
    DEPT_REC.DNAME := 'DATABASE';
    DEPT_REC.LOC := 'SEOUL';
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_REC.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || DEPT_REC.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || DEPT_REC.LOC);
END;
/

CREATE TABLE DEPT_RECORD
    AS SELECT * FROM DEPT;
-- ���̺� ����
DECLARE
    TYPE REC_DEPT IS RECORD (
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_DEPT;
BEGIN
    DEPT_REC.DEPTNO := 99;
    DEPT_REC.DNAME := 'DATABASE';
    DEPT_REC.LOC := 'SEOUL';
    INSERT INTO DEPT_RECORD VALUES DEPT_REC;
END;
/
-- ���̺� ������ ������Ʈ(����)
DECLARE
    TYPE REC_DEPT IS RECORD (
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_DEPT;
BEGIN
    DEPT_REC.DEPTNO := 50;
    DEPT_REC.DNAME := 'DB';
    DEPT_REC.LOC := 'SEOUL';
    UPDATE DEPT_RECORD
        SET ROW = DEPT_REC
    WHERE DEPTNO = 99;
END;
/
SELECT * FROM DEPT_RECORD;

DECLARE
    TYPE REC_DEPT IS RECORD (
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    TYPE REC_EMP IS RECORD (
        EMPNO EMP.EMPNO%TYPE,
        ENAME EMP.ENAME%TYPE,
        DINFO REC_DEPT
    );
    EMP_REC REC_EMP;
BEGIN
    SELECT
        E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
        INTO EMP_REC.EMPNO, EMP_REC.ENAME, EMP_REC.DINFO.DEPTNO, EMP_REC.DINFO.DNAME, EMP_REC.DINFO.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
        AND E.EMPNO = 7934;
    DBMS_OUTPUT.PUT_LINE('EMPNO : ' || EMP_REC.EMPNO);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || EMP_REC.ENAME);
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || EMP_REC.DINFO.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || EMP_REC.DINFO.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || EMP_REC.DINFO.LOC);
END;
/

-- �÷���: Ư�� �ڷ����� �����͸� ������ �����ϴ� ���� �ڷ���
-- ���ڵ� >> ���� ������ �����͸� �ϳ��� ���� ����ϴ� ��
-- �÷��� >> �� �Ǵ� ���̺�� ���� ���·� ����ϴ� ��
-- �����迭: �ε������ �Ҹ��� Ű(key), ��(value)���� �����Ǵ� �÷���. �ߺ����� ���� ������ Ű�� ���� ���� �����ϰ� �ҷ��´�.
/*
TYPE [�����迭�̸�] IS TABLE OF [�ڷ���] [NOT NULL]
    INDEX BY [�ε�����];
*/

-- PLS_INTEGER : PL/SQL���� ���Ǵ� ������ Ÿ�� �� �ϳ�. ������ �����ϱ� ���� ���. NUMBER ������ Ÿ���� ���� ����.
-- BINATY_INTEGER : PL/SQL���� ���Ǵ� �� �ٸ� ���� ������ Ÿ��

-- �÷��� �޼���: ����Ŭ���� �÷��� ��� �� ���Ǹ� ���� �޼���
-- EXISTS(n): �÷��ǿ��� n �ε����� ������ ���翩�θ� TRUE/FALSE�� ��ȯ
-- COUNT: �÷��ǿ� ���ԵǾ� �ִ� ��� ������ ��ȯ
-- LIMIT: ���� �÷����� �ִ� ũ�⸦ ��ȯ / �ִ� ũ�Ⱑ ������ NULL ��ȯ
-- FIRST: �÷����� ù��° �ε��� ��ȣ ��ȯ
-- LAST: �÷����� ������ �ε��� ��ȣ ��ȯ
-- PRIOR(n): �÷��ǿ��� n�ε��� �ٷ� �� �ε��� �� ��ȯ. ��� �ε��� ���� �������� ������ NULL ��ȯ
-- NEXT(n): �÷��ǿ��� N�ε��� �ٷ� ���� �ε��� �� ��ȯ. ��� �ε��� ���� �������� ������ NULL ��ȯ
-- DELETE: �÷��ǿ� ����� ��Ҹ� �����Ѵ�.
        -- DELETE: �÷��ǿ� ����� ��� ������ ����
        -- DELETE(n): n�ε����� �÷��� ��� ����
        -- DELETE(n, m): n�ε������� m�ε������� ��� ����
-- EXTEND: �÷����� ũ�� ����
-- TRIM: �÷����� ũ�� ����
DECLARE
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
        INDEX BY PLS_INTEGER;
    TEXT_ARR ITAB_EX;
BEGIN
    TEXT_ARR(1) := '1ST DATA';
    TEXT_ARR(2) := '2ND DATA';
    TEXT_ARR(3) := '3RD DATA';
    TEXT_ARR(50) := '50TH DATA';
    
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.COUNT : ' || TEXT_ARR.COUNT);
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.FIRST : ' || TEXT_ARR.FIRST);
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.LAST : ' || TEXT_ARR.LAST);
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.PRIOR(50) : ' || TEXT_ARR.PRIOR(50));
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.NEXT(50) : ' || TEXT_ARR.NEXT(50));
END;
/

DECLARE
    TYPE ITAB_DEPT IS TABLE OF DEPT%ROWTYPE
        INDEX BY PLS_INTEGER;
    DEPT_ARR ITAB_DEPT;
    IDX PLS_INTEGER := 0;
BEGIN
    FOR i IN (SELECT DEPTNO, DNAME FROM DEPT) LOOP
        IDX := IDX + 1;
        DEPT_ARR(IDX).DEPTNO := i.DEPTNO;
        DEPT_ARR(IDX).DNAME := i.DNAME;
        
        DBMS_OUTPUT.PUT_LINE(DEPT_ARR(IDX).DEPTNO || ' : ' || DEPT_ARR(IDX).DNAME);
    END LOOP;
END;
/

-- ��ø���̺�
-- varray


-- Ŀ��: SELECT�� �Ǵ� ������ ���۾� ���� SQL���� �������� �� �ش� SQL���� ó���ϴ� ������ ������ �޸� ������ ���Ѵ�.(C��� ������ ���� ����)
    -- Ŀ���� ����� Ŀ���� ������ Ŀ���� ������.
-- ����� Ŀ��: ����ڰ� ���� Ŀ���� �����ϰ� ����ϴ� �� ���Ѵ�.
/*
����� Ŀ�� 4�ܰ�
1�ܰ�: Ŀ�� ���� - ����ڰ� ���� �̸��� �����ؼ� ����� Ŀ���� SQL���� �Բ� �����Ѵ�.
2�ܰ�: Ŀ�� ���� - Ŀ���� ������ �� �ۼ��� SQL���� �����Ѵ�. �̶� ������ SQL���� ������ �޴� ���� ACTIVE SET��� �Ѵ�.
3�ܰ�: Ŀ������ �о�� ������ ��� - ����� SQL���� ��� �� ������ �ϳ��� �о�ͼ� ������ �����ϰ� �ʿ��� �۾��� ����.
            ��ü�� LOOP���� �Բ� ����.
4�ܰ�: Ŀ�� �ݱ� - ��� ���� ����� ������ Ŀ���� �����Ѵ�.
*/

/*
����� Ŀ�� �ۼ���
DECLARE
    CURSOR [Ŀ�� �̸�] IS [SQL��]; -- Ŀ�� ����
BEGIN
    OPEN [Ŀ�� �̸�]; -- Ŀ�� ����
    FETCH [Ŀ�� �̸� INTO ����]; -- Ŀ������ �о�� ������ ���(FETCH)
    CLOSE [Ŀ�� �̸�]; -- Ŀ�� �ݱ�
END;
/
*/

-- �������϶� ����
DECLARE
    -- Ŀ�� �����͸� �Է��� ���� ����
    V_DEPT_ROW DEPT%ROWTYPE;
    -- ����� Ŀ�� ����
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
            FROM DEPT
        WHERE DEPTNO = 40;
BEGIN
    -- Ŀ�� ����
    OPEN c1;
    -- Ŀ���κ��� �о�� ������ ���(FETCH)
    FETCH c1 INTO V_DEPT_ROW;
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
    -- Ŀ�� �ݱ�
    CLOSE c1;
END;
/

-- �������� ��ȸ�� �� LOOP��
DECLARE
    -- Ŀ�� �����͸� �Է��� ���� ����
    V_DEPT_ROW DEPT%ROWTYPE;
    -- ����� Ŀ�� ����
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC FROM DEPT;
BEGIN
    -- Ŀ�� ����
    OPEN c1;
    LOOP
        -- Ŀ���κ��� �о�� ������ ���(FETCH : ������ ����)
        FETCH c1 INTO V_DEPT_ROW;
        -- Ŀ���� ��� ���� �о���� ���� %NOTFOUND �Ӽ��� �����Ѵ�.
        -- %NOTFOUND: ����� FETCH������ ���� ���������� FALSE, �������� �ʾ����� TRUE ��ȯ
        EXIT WHEN c1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(
            'DEPTNO : ' || V_DEPT_ROW.DEPTNO || ', DNAME : ' || V_DEPT_ROW.DNAME || ', LOC : ' || V_DEPT_ROW.LOC
        );
    END LOOP;
    -- Ŀ�� �ݱ�
    CLOSE c1;
END;
/
-- Ŀ���̸�%NOTFOUND: ����� FETCH������ ����� ���� ������ FALSE, ������ TRUE ��ȯ
-- Ŀ���̸�%FOUND: ����� FETCH������ ����� ���� ������ TRUE, ������ FALSE ��ȯ
-- Ŀ���̸�%ROWCOUNT: ������� ����� �� ���� ��ȯ
-- Ŀ���̸�%ISOPEN: Ŀ���� OPEN ���¸� TRUE, CLOSE ���¸� FALSE

-- FOR LOOP
/*
FOR [���� �ε��� �̸�] IN [Ŀ�� �̸�] LOOP
    [�ݺ��� ���� �۾�];
END LOOP;
*/
DECLARE
    -- ����� Ŀ�� ����
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC FROM DEPT;
BEGIN
    -- Ŀ�� FOR LOOP ����(�ڵ� OPEN, FETCH, CLOSE)
    FOR c1_rec IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE(
            'DEPTNO : ' || c1_rec.DEPTNO || ', DNAME : ' || c1_rec.DNAME || ', LOC : ' || c1_rec.LOC
        );
    END LOOP;
END;
/

-- CURSOR [Ŀ�� �̸�](�Ķ���� �̸� �ڷ���) IS SELECT ...
DECLARE
    -- Ŀ�� �����͸� �Է��� ���� ����
    V_DEPT_ROW DEPT%ROWTYPE;
    -- ����� Ŀ�� ����
    CURSOR c1(p_deptno DEPT.DEPTNO%TYPE) IS
        SELECT DEPTNO, DNAME, LOC FROM DEPT
            WHERE DEPTNO = p_deptno;
BEGIN
    -- Ŀ�� ����: 10�� �μ� ó��
    OPEN c1 (10);
    LOOP
        -- Ŀ���κ��� �о�� ������ ���
        FETCH c1 INTO V_DEPT_ROW;
        -- Ŀ���� ��� ���� �о���� ���� %NOTFOUND �Ӽ��� �����Ѵ�.
        -- %NOTFOUND: ����� FETCH������ ���� ���������� FALSE, �������� �ʾ����� TRUE ��ȯ
        EXIT WHEN c1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(
            '10�� �μ� - DEPTNO : ' || V_DEPT_ROW.DEPTNO || ', DNAME : ' || V_DEPT_ROW.DNAME || ', LOC : ' || V_DEPT_ROW.LOC
        );
    END LOOP;
    -- Ŀ�� �ݱ�
    CLOSE c1;
    -- Ŀ�� ����: 20�� �μ� ó��
    OPEN c1 (20);
    LOOP
        -- Ŀ���κ��� �о�� ������ ���
        FETCH c1 INTO V_DEPT_ROW;
        -- Ŀ���� ��� ���� �о���� ���� %NOTFOUND �Ӽ��� �����Ѵ�.
        -- %NOTFOUND: ����� FETCH������ ���� ���������� FALSE, �������� �ʾ����� TRUE ��ȯ
        EXIT WHEN c1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(
            '20�� �μ� - DEPTNO : ' || V_DEPT_ROW.DEPTNO || ', DNAME : ' || V_DEPT_ROW.DNAME || ', LOC : ' || V_DEPT_ROW.LOC
        );
    END LOOP;
    -- Ŀ�� �ݱ�
    CLOSE c1;
END;
/

-- ���ڸ� ���� �Է��ؼ� ����ϱ�
DECLARE
    -- Ŀ�� �����͸� �Է��� ���� ����
    V_DEPTNO DEPT.DEPTNO%TYPE;
    -- ����� Ŀ�� ����
    CURSOR c1(p_deptno DEPT.DEPTNO%TYPE) IS
        SELECT DEPTNO, DNAME, LOC FROM DEPT
            WHERE DEPTNO = p_deptno;
BEGIN
    V_DEPTNO := &INPUT_DEPTNO;
    FOR c1_res IN c1(V_DEPTNO) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'DEPTNO : ' || c1_res.DEPTNO || ', DNAME : ' || c1_res.DNAME || ', LOC : ' || c1_res.LOC
        );
    END LOOP;
END;
/

-- ������ Ŀ��: ������ ���� ���� SQL���� ������� �� ����Ŭ���� �ڵ����� ����Ǵ� Ŀ��
-- SQL%NOTFOUND: ������ ���� ������ FALSE, ������ TRUE
-- SQL%FOUND: ������ ���� ������ TRUE, ������ FALSE
-- SQL%ROWCOUNT: ������ Ŀ������ ������� ������ ���� ��. �Ǵ� DML ����� ���� �޴� ���� ��
-- SQL%ISOPEN: ������ Ŀ���� �ڵ����� SQL���� ������ �� CLOSE�ǹǷ� �� �Ӽ��� �׻� FALSE�� ��ȯ
BEGIN
    UPDATE DEPT SET DNAME = 'DATABASE'
        WHERE DEPTNO = 40;
    DBMS_OUTPUT.PUT_LINE('���ŵ� ���� ���� : ' || SQL%ROWCOUNT);
    IF (SQL%FOUND) THEN
        DBMS_OUTPUT.PUT_LINE('���ŵ� �� ���� ���� : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('���ŵ� �� ���� ���� : FALSE');
    END IF;
    IF (SQL%ISOPEN) THEN
        DBMS_OUTPUT.PUT_LINE('Ŀ���� OPEN ���� : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ŀ���� OPEN ���� : FALSE');
    END IF;
END;
/

-- ����ó��(����)
-- ���ܰ� �߻��ϸ� �� ���� �Է��� �ڵ�� ������� �ʴ´�.
DECLARE
    -- ������ ���� VARCHAR2 ��� NUMBER�� �ڷ��� �Է�
    V_DNAME NUMBER;
    -- [����� ���� �̸�] EXCEPTION;
BEGIN
    -- IF [���� �߻� ����] THEN
        -- RAISE [����� ���� �̸�];
    SELECT DNAME INTO V_DNAME
        FROM DEPT
    WHERE DEPTNO = 10;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('���� ó��: ��ġ �Ǵ� �� ���� �߻�');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('�䱸���� ���� �� ���� ����');
    -- WHEN [����� ���� �̸�] THEN ...;
    -- WHEN OTHERS THEN
        -- ...... ;
END;
/
-- ACCESS_INTO_NULL: �ʱ�ȭ���� �ʴ� ��ü �Ӽ� �� �Ҵ�
-- CASE_NOT_FOUND: CASE���� WHERE���� ������ ���� ELSE���� ���� ���
-- CURSOR_ALREADY_OPEN: �̹� OPEN�� Ŀ���� �� OPEN �õ��� ���
-- DUP_VAL_ON_INDEX: UNIQUE ���ؽ��� �ִ� ���� �ߺ��� ���� ������ ���
-- INVALID_CURSOR: OPEN���� ���� Ŀ���� CLOSE�� ��츦 ������ �߸��� CURSOR �۾��� �� ���
-- INVALID_NUMBER: ���ڿ��� ���ڷ� ��ȯ�� ������ ���
-- NO_DATA_FOUND: SELECT INTO������ ��� ���� ���� ���
-- PROGRAM_ERROR: PL/SQL ���� ���� �߻� �� ��µǴ� ����
-- ROWTYPE_MISMATCH: ȣ��Ʈ Ŀ�� ������ PL/SQL Ŀ�� ������ �ڷ����� ȣȯ���� ���� ���
-- SELF_IS_NULL: �ʱ�ȭ���� ���� ������Ʈ�� MEMBER �޼��带 ȣ���� ���
-- STORAGE_ERROR: PL/SQL �޸� ����
-- SYS_INVALID_ROWID: ���ڿ��� ROWID�� ��ȯ�� �� ���� �������� ���� ���
-- TIMEOUT_ON_RESOURCE: �ڿ� ��� �ð� �ʰ�
-- TOO_MANY_ROWS: SELECT INTO���� ��� ���� �������� �� �߻�
-- VALUE_ERROR: ���, ��ȯ, �߸�, ���� ���� ������ �߻����� ���
-- ZERO_DIVIDE: ���� �����͸� 0���� �������� �� ���

DECLARE
    -- ������ ���� VARCHAR2 ��� NUMBER�� �ڷ��� �Է�
    V_DNAME NUMBER;
BEGIN
    SELECT DNAME INTO V_DNAME
        FROM DEPT
    WHERE DEPTNO = 10;
EXCEPTION
    -- ���� �ڵ�� �޽����� ���� �����ͼ� ���
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
        DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;
/


-- ���� �������α׷� >> �޸� ����, ���뼺�� ������ �ִ�(���ν���, �Լ� ���ַ� ���)
-- ���� ���ν���(STORED PROCEDURE): �Ϲ������� Ư�� ó�� �۾� ������ ���� �������α׷����� SQL�������� ��� �Ұ�
-- ���� �Լ�(STORED FUNCTION): �Ϲ������� Ư�� ������ ��ģ ��� ���� ��ȯ�ϴ� ���� ���α׷�. SQL������ ��� ����
-- ��Ű��(PACKAGE): ���� �������α׷��� �׷�ȭ�ϴµ� ���
-- Ʈ����(TRIGGER): Ư�� ��Ȳ(�̺�Ʈ)�� �߻��� �� �ڵ����� ���޾� ������ ����� �����ϴµ� ���

-- ���ν��� >> �Ķ���Ͱ� �������� �ְ� �������� �ִ�.
/*
CREATE(�Ǵ� REPLACE) PROCEDURE [���ν�����]
IS(�Ǵ� AS)
    �����
BEGIN
    �����
EXCEPTION (��������)
    ���� ó����
END [���ν����̸�]; -- END; >> ���ν����̸� ���� ����
/
*/
CREATE PROCEDURE PRO_NOPARAM
IS
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- ����
/*
EXECUTE [���ν�����];
*/
EXECUTE PRO_NOPARAM;
-- EXCUTE�� ����
BEGIN
    PRO_NOPARAM;
END;
/
-- ���ν��� ����
DROP PROCEDURE PRO_NOPARAM;

/*
CREATE(�Ǵ� REPLACE) PROCEDURE [���ν�����]
(
([�Ķ���� �̸�1] [MODES] �ڷ��� := �⺻��, ... ,
[�Ķ���� �̸�n] [MODES] �ڷ���
)
IS(�Ǵ� AS)
    �����
BEGIN
    �����
EXCEPTION (��������)
    ���� ó����
END [���ν����̸�]; -- END; >> ���ν����̸� ���� ����
/
*/

-- IN, OUT, IN OUT
-- IN: ���ν��� ȣ�� �� ���� �Է¹޴´�.(���� ����)
-- OUT: ȣ���� �� ���� ��ȯ
-- IN OUT: ȣ���� �� ���� �Է¹ް� ���� ����� ��ȯ

CREATE OR REPLACE PROCEDURE PRO_PARAM_IN (
    PARAM1 IN NUMBER,
    PARAM2 NUMBER,
    PARAM3 NUMBER := 3,
    PARAM4 NUMBER DEFAULT 4
)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('PARAM1 : ' || PARAM1);
    DBMS_OUTPUT.PUT_LINE('PARAM2 : ' || PARAM2);
    DBMS_OUTPUT.PUT_LINE('PARAM3 : ' || PARAM3);
    DBMS_OUTPUT.PUT_LINE('PARAM4 : ' || PARAM4);
END;
/
EXECUTE PRO_PARAM_IN(PARAM1 => 10);

CREATE OR REPLACE PROCEDURE pro_param_out (
    in_empno IN EMP.EMPNO%TYPE,
    out_ename OUT EMP.ENAME%TYPE,
    out_sal OUT EMP.SAL%TYPE
)
IS
BEGIN
    SELECT ENAME, SAL INTO out_ename, out_sal
        FROM EMP
    WHERE EMPNO = in_empno;
END;
/
DECLARE
    V_ENAME EMP.ENAME%TYPE;
    V_SAL EMP.SAL%TYPE;
BEGIN
    pro_param_out(7369, V_ENAME, V_SAL);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || V_ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || V_SAL);
END;
/

-- IN OUT
CREATE OR REPLACE PROCEDURE pro_param_inout (
    inout_no IN OUT NUMBER
)
IS
BEGIN
    inout_no := inout_no * 2;
END;
/
DECLARE
    no NUMBER;
BEGIN
    no := 5;
    pro_param_inout(no);
    DBMS_OUTPUT.PUT_LINE('no : ' || no);
END;
/

-- �Լ�
-- ����: ���ν����� EXECUTE �Ǵ� �ٸ� PL/SQL ������ ȣ��. �Լ��� SQL������ ���� ���� ����, PL/SQL������ ���� ��� ����
-- �Ķ����: ���ν����� �Ķ����(�ɼ�), IN, OUT, IN OUT ��� ���� �ʿ�. �Լ��� �Ķ����(�ɼ�), IN�� ��� ����
-- ���� ��ȯ: ���ν����� ��ȯ�� ���� ����, ���� ���� �ִ�. �Ǵ� ���� ���� �� ��ȯ�� �� �ִ�. �Լ��� RETURN���� ���� ��ȯ�Ѵ�.
/*
CREATE OR REPLACE FUNCTION [�Լ� �̸�]
[(�Ķ���� �̸�1 IN �ڷ���1,
... ,
�Ķ���� �̸�n IN �ڷ���n
)]
RETURN [�ڷ���]
IS �Ǵ� AS
    �����
BEGIN
    �����
    RETURN (��ȯ��);
EXCEPTION
    ���� ó����
END [�Լ��̸�]; -- END;�� ���� ����
/
*/
CREATE OR REPLACE FUNCTION fn_aftertax(
    sal IN NUMBER
)
RETURN NUMBER
IS
    tax NUMBER := 0.05;
BEGIN
    RETURN (ROUND(sal - (sal * tax)));
END;
/
DECLARE
    aftertax NUMBER;
BEGIN
    aftertax := fn_aftertax(3000);
    DBMS_OUTPUT.PUT_LINE('aftertax : ' || aftertax);
END;
/

-- EMP ���̺��� ���� ���� �� ���(EMPNO, ENAME, SAL, AFTERTAX)
SELECT
    EMPNO, ENAME, SAL, fn_aftertax(SAL) AS AFTERTAX
FROM EMP;
-- �Լ� ����
DROP FUNCTION fn_aftertax;


-- ��Ű��: ����, ��ɸ鿡�� �������� ���� ���ν���, �Լ� �� �������� PL/SQL �������α׷��� �ϳ��� �� �׷����� ��� ���� �����ϴµ� ����ϴ� ��ü
-- ����: ��⼺, ���� ���� ���α׷� ����, ���� ����, ��ɼ� ���, ���� ���

-- ��Ű���� ���� �� ��, �������� ���еǾ� �ۼ��Ѵ�.
/*
��Ű�� ��
CREATE OR REPLACE PACKAGE [��Ű����]
IS �Ǵ� AS
    �������α׷��� �̿��� �پ��� ��ü ����
END [��Ű�� �̸�]; -- END;�� ���� ����
/
*/
CREATE OR REPLACE PACKAGE pkg_example
IS
    spec_no NUMBER := 10;
    FUNCTION func_aftertax(sal NUMBER) RETURN NUMBER;
    PROCEDURE pro_emp(in_empno IN EMP.EMPNO%TYPE);
    PROCEDURE pro_dept(in_deptno IN DEPT.DEPTNO%TYPE);
END;
/

/*
��Ű�� ����
CREATE OR REPLACE PACKAGE BODY [��Ű�� �̸�]
IS �Ǵ� AS
    ��Ű�� ������ ������ �������α׷��� ������ ���� ��ü�� ����.
    ��Ű�� ���� �������� �ʴ� ��ü �� �������α׷��� ���� ����
END;
/
*/
CREATE OR REPLACE PACKAGE BODY pkg_example
IS
    body_no NUMBER := 10;
    FUNCTION func_aftertax(sal NUMBER) RETURN NUMBER
        IS
            tax NUMBER := 0.05;
        BEGIN
            RETURN (ROUND(sal - (sal * tax)));
        END func_aftertax;
    PROCEDURE pro_emp(in_empno IN EMP.EMPNO%TYPE)
        IS
            out_ename EMP.ENAME%TYPE;
            out_sal EMP.SAL%TYPE;
        BEGIN
            SELECT ENAME, SAL INTO out_ename, out_sal
                FROM EMP
            WHERE EMPNO = in_empno;
            
            DBMS_OUTPUT.PUT_LINE('ENAME : ' || out_ename);
            DBMS_OUTPUT.PUT_LINE('SAL : ' || out_sal);
        END pro_emp;
    PROCEDURE pro_(in_deptno IN DEPT.DEPTNO%TYPE)
        IS
            out_dname DEPT.DNAME%TYPE;
            out_loc DEPT.LOC%TYPE;
        BEGIN
            SELECT DNAME, LOC INTO out_dname, out_loc
                FROM DEPT
            WHERE DEPTNO = in_deptno;
            
            DBMS_OUTPUT.PUT_LINE('DNAME : ' || out_dname);
            DBMS_OUTPUT.PUT_LINE('LOC : ' || out_loc);
        END pro_dept;
END;
/

-- �������α׷� �����ε�
/*
CREATE OR REPLACE PACKAGE [��Ű�� �̸�]
IS �Ǵ� AS
    �������α׷� ���� �������α׷� �̸� (�Ķ���� ����);
    �������α׷� ���� �������α׷� �̸� (������ �ڷ���, ������ �ٸ� �Ķ���� ����);
END;
/
*/
CREATE OR REPLACE PACKAGE pkg_overload
IS
    PROCEDURE pro_emp(in_empno IN EMP.EMPNO%TYPE);
    PROCEDURE pro_emp(in_ename IN EMP.ENAME%TYPE);
END;
/
CREATE OR REPLACE PACKAGE BODY pkg_overload
IS
    PROCEDURE pro_emp(in_empno IN EMP.EMPNO%TYPE)
        IS
            out_ename EMP.ENAME%TYPE;
            out_sal EMP.SAL%TYPE;
        BEGIN
            SELECT ENAME, SAL INTO out_ename, out_sal
                FROM EMP
            WHERE EMPNO = in_empno;
            
            DBMS_OUTPUT.PUT_LINE('ENAME : ' || out_ename);
            DBMS_OUTPUT.PUT_LINE('SAL : ' || out_sal);
        END pro_emp;
    PROCEDURE pro_emp(in_ename IN EMP.ENAME%TYPE)
        IS
            out_ename EMP.ENAME%TYPE;
            out_sal EMP.SAL%TYPE;
        BEGIN
            SELECT ENAME, SAL INTO out_ename, out_sal
                FROM EMP
            WHERE ENAME = in_ename;
            
            DBMS_OUTPUT.PUT_LINE('ENAME : ' || out_ename);
            DBMS_OUTPUT.PUT_LINE('SAL : ' || out_sal);
        END pro_emp;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('--pkg_example.func_aftertax(3000)--');
    DBMS_OUTPUT.PUT_LINE('after-tax : ' || pkg_example.func_aftertax(3000));
    
    DBMS_OUTPUT.PUT_LINE('--pkg_example.pro_emp(7369)--');
    pkg_example.pro_emp(7369);
    
    DBMS_OUTPUT.PUT_LINE('--pkg_example.pro_dept(10)--');
    pkg_example.pro_dept(10);
    
    DBMS_OUTPUT.PUT_LINE('--pkg_overload.pro_emp(7369)--');
    pkg_overload.pro_emp(7369);
    
    DBMS_OUTPUT.PUT_LINE('--pkg_overload.pro_emp(''FORD'')--');
    pkg_overload.pro_emp('FORD');
END;
/

-- ��Ű�� ���� ���� ��� ����
-- DROP PACKAGE [��Ű�� �̸�]

-- ��Ű���� ������ ����
-- DROP PACKAGE BODY [��Ű�� �̸�]


-- Ʈ����: �����ͺ��̽� �ȿ� Ư�� ��Ȳ�̳� ����(=�̺�Ʈ)�� �߻��� �� �ڵ����� ����Ǵ� ���
-- DML Ʈ����: INSERT, UPDATE, DELETE
-- DDL Ʈ����: CREATE, ALTER, DROP
-- INSTEAD OF Ʈ����: ��(VIEW)�� ����ϴ� DML ��ɾ �������� ����
-- �ý��� Ʈ����: �����ͺ��̽��� ��Ű�� �̺�Ʈ�� ����
-- �ܼ� Ʈ����: Ʈ���Ÿ� �۵���ų ������ ����Ǳ� ��, ����� ��, Ʈ���Ÿ� �۵���ų ������ �࿡ ������ ��ġ�� ��, Ʈ������ �۵���ų ������ �࿡ ������ �� ��
-- ���� Ʈ����: �ܼ� Ʈ������ ���� ������ ����
/*
CREATE OR REPLACE TRIGGER [Ʈ���� �̸�]
BEFORE �Ǵ� AFTER -- Ʈ���� �۵� ����
INSERT �Ǵ� UPDATE �Ǵ� DELETE ON [���̺� �̸�]
REFERENCING OLD as old �Ǵ� New as new -- DML�� ����Ǵ� ���� ���� �� ���� ���� ���� ���� �����ϴ� �뵵�� ���(���� ����)
FOR EACH ROW WHEN [���ǽ�] -- DML ���忡 �ѹ��� ������ ��, DML ���忡 ����޴� �� ���� ������ �� ����
FOLLOWS [Ʈ���� �̸�1], [Ʈ���� �̸�2], ... -- Ʈ���� ���� ����
ENABLE �Ǵ� DISABLE -- Ʈ������ Ȱ��ȭ, ��Ȱ��ȭ
DECLARE
    �����
BEGIN
    �����
EXCEPTION
    ���� ó����
END;
/
*/

-- BEFORE
CREATE TABLE EMP_TRG AS SELECT * FROM EMP;

CREATE OR REPLACE TRIGGER trg_emp_nodml_weekend
BEFORE
    INSERT OR UPDATE OR DELETE ON EMP_TRG
BEGIN
    IF TO_CHAR(SYSDATE, 'DY') IN ('��', '��') THEN
        IF INSERTING THEN
            raise_application_error(-20000, '�ָ� ��� ���� �߰� �Ұ�');
        ELSIF UPDATING THEN
            raise_application_error(-20001, '�ָ� ��� ���� ���� �Ұ�');
        ELSIF DELETING THEN
            raise_application_error(-20002, '�ָ� ��� ���� ���� �Ұ�');
        ELSE
            raise_application_error(-20009, '�ָ� ��� ���� ���� �Ұ�');
        END IF;
    END IF;
END;
/

UPDATE emp_trg SET sal = 3500 WHERE EMPNO = 7365;

-- ������ ����
-- �ε���
-- ��
-- ���Ǿ�


