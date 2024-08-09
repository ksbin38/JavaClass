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

-- having: group by���� ������ ���� ��� ����. group by���� ���� �׷�ȭ �� ������� ������ ������ �� ����Ѵ�
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

