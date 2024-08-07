SELECT * FROM EMP;

SELECT EMPNO, ENAME, DEPTNO FROM EMP;
-- 주석
select
    empno -- 사원번호
    , ename -- 사원명
    , JOB -- 직책
    , mgr -- 직속상관의 사원번호
    , hiredate -- 입사일
    , sal -- 급여
    , comm -- 급여 외 추가 수당
    , deptno -- 사원이 속한 부서 번호
from emp;

SELECT DISTINCT -- 중복된 데이터 삭제
    DEPTNO
FROM EMP;

SELECT ALL -- 기본적으로 전부 출력(굳이 명시안해도 전부 출력함)
    DEPTNO
    , JOB
FROM EMP;

SELECT
    DEPTNO
    , ENAME
    , SAL
    , SAL * 12 + COMM SUMSAL -- 별칭 부여(그냥 기입하는 방법, "별칭", AS 별칭, AS "별칭"), 가급적 AS 별칭만 쓰자
    , COMM
FROM EMP;

-- 0806
-- ORDER BY [정렬하려고 하는 컬럼 이름] [정렬 옵션]
-- 오름차순 ASC / 내림차순 DESC

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

-- WHERE정: SELECT문으로 데이터를 조회할 때 특정조건
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

-- A > B : A값이 B값을 초과하면 true
-- A >= B : A값이 B값 이상이면 true
-- A < B : A값이 B값 미만이면 true
-- A <= B : A값이 B값 이하이면 true

-- 문자열 비교시 문자열의 대소를 비교한다
-- ENAME >= 'F' : ENAME열 값의 첫 문자와 대문자 F를 비교했을 때
-- 알파벳 순서상 F와 같거나 F보다 뒤에 있는 문자열을 출력하라는 의미
SELECT
    *
FROM EMP
WHERE SAL >= 2500
AND JOB = 'ANALYST';

-- 등가 비교 연산자
-- A = B : A값이 B와 같으면 true/ 다르면 false
-- A != B  / A <> B / A ^= B: A값과 B값이 다르면 true/ 다르면 false

SELECT
    *
FROM EMP
WHERE NOT SAL = 3000;

SELECT
    *
FROM EMP
WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK')
;
-- IN : 특정 열에 포함된 데이터를 여러개 조회할 때 사용
-- NOT IN : 논리부정, IN과 반대로 조건을 제외하고 조회

SELECT
    *
FROM EMP
WHERE DEPTNO IN (10, 20)
;

-- LIKE : 특정한 문자열 검색 ==> *기호와 함께 문자열 조회
-- % : 길이와 상관없이 모든 문자 데이터를 의미
-- _ : 어떤 값이든 상관없이 한개의 문자 데이터를 의미
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
-- null을 확인할때는 등가 연산자가 아닌 is로 체크한다, 반대는 is not

-- 집합연산자(UNION)
-- UNION : 연결된 SELECT 문의 결과 값을 합집합으로 준다. 결과 값의 중복은 제거된다.
-- UNION ALL : 연결된 SELECT 문의 결과 값을 합집합으로 준다. 중복된 결과 값도 제거 없이 모두 출력
-- MINUS : 먼저 작성한 SELECT 문의 결과 값에서 다음 SELECT 문의 결과 값을 차집합 처리, 먼저에서 다음 값 중 겹치는 것 제외하고 출력
-- INTERSECT : 먼저 작성한 SELECT 문과 다음 SELECT 문의 결과 값이 같은 데이터만 출력, 교집합의 의미

-- 연산자 우선순위
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

-- 오라클 함수
-- 종류
-- 1. 내장 함수(build-in function)
-- 단일행 함수(single-row function): 행 하나씩 체크
-- 다중행 함수(multiple-row function): 여러행을 한번에 묶어서 체크
-- 2. 사용자 정의 함수(user-defined function)

-- 대,소문자 변경
-- upper(문자열): 괄호 안 문자 데이터를 모두 대문자로 변환하여 반환
-- lower(문자열): 괄호 안 문자 데이터를 모두 소문자로 변환하여 반환
-- initcap(문자열): 괄호 안 문자 데이터 중 첫 글자는 대문자로, 나머지 문자를 소문자로 변환 후 반환

SELECT
    ENAME
    , UPPER(ENAME) AS UPPERENAME
    , LOWER(ENAME) AS lowerEname
    , INITCAP(ENAME) AS InitcapEname
FROM EMP
WHERE UPPER(ENAME) = UPPER('smith')
;

-- length(문자열): 괄호 안 문제 데이터의 길이를 반환
SELECT
    ENAME
    , LENGTH(ENAME) AS enameLength
FROM EMP
WHERE LENGTH(ENAME) >= 5
;

-- DUAL TABLE : 더미 테이블, 오라클 자체에서 제공하는 테이블
-- 특정한 함수나 기타 연산 결과를 테이블이 없는 상태에서 생성해야 하는 케이스일 때 사용
-- 시스템 사용자(sys)가 소유하는 오라클 표준 테이블
-- 시스템 사용자가 소유하지만 누구나 접근 가능
-- 컬럼수(카디널리티)와 차수가 모두 1인 더미테이블
SELECT
    LENGTH('한글') AS Length
    , 'ABC' AS ALPHABET
FROM DUAL
;-- 새로운 데이터를 생성해서 출력

-- 0807
-- substr 함수: 문자열 일부 추출
-- substr(문자열 데이터, 시작 위치, 추출 길이)
-- substr(문자열 데이터, 시작 위치): 시작 위치부터 끝까지
SELECT
    ENAME
    , SUBSTR(ENAME, 3)
    , SUBSTR(ENAME, -LENGTH(ENAME)) -- 컬럼 안에 글자 수가 다 달라도 그 글자의 처음부터 시작(뒤에서부터 LENGTH만큼 앞으로 가서 시작)
FROM EMP
;

-- instr 함수: 문자열 데이터 안에 특정 문자 위치를 찾는다.
-- instr(대상 문자열, 위치를 찾으려는 부분 문자,
    -- 위치 찾기를 시작할 대상 문자열 데이터 위치(선택사항, 기본선택값은 1), 시작 위치에서 찾으려는 문자가 몇번째인지 지정(선택사항, 기본선택값은 1))
SELECT
    INSTR('HELLO, ORACLE!', 'L') AS instr
    , INSTR('HELLO, ORACLE!', 'L', 5) AS instr2 -- 5번째 문자부터 L을 찾아라
    , INSTR('HELLO, ORACLE!', 'L', 2, 2) AS instr3 -- 2번째부터 L이 두번째로 나오는 위치를 찾아라
FROM DUAL
;

-- replace: 특정 문자를 다른 문자로 바꾼다
-- replace(문자열, 찾을 문자열, 대체할 문자열)
SELECT
    '010-1234-5678'
    , REPLACE('010-1234-5678', '-', '*')
    , REPLACE('010-1234-5678', '-') -- 전화번호에서 '-'를 제거만 함
FROM DUAL
;

-- LPAD, RPAD: 데이터의 빈 공간을 특정 문자로 채운다.
-- lpad: Left Padding >> 남은 공간의 왼쪽을 채운다.
-- rpad: Right Padding >> 남은 공간의 오른쪽을 채운다.
-- 데이터와 자릿수를 지정한 후 데이터 길이가 지정한 자릿수보다 작을 경우 나머지 공간을 특정 문자로 채운다.
-- LPAD(문자열 데이터, 데이터의 자릿수, 빈공간을 채울 문자(선택사항))
-- RPAD(문자열 데이터, 데이터의 자릿수, 빈공간을 채울 문자(선택사항))
SELECT
    'ORACLE' AS str
    , LPAD('ORACLE', 10, '#') AS strL -- 10글자의 문자열로 바꾸되 왼쪽 빈공간을 #으로 채워라
    , RPAD('ORACLE', 10) AS strR -- 공백을 채울 문자 선언 안할 시 공백으로 출력
    , RPAD(RPAD('123456-1234567', 7), LENGTH('123456-1234567'), '*') AS strnum1
    , RPAD(RPAD('010-1234-5678', 9), LENGTH('010-1234-5678'), '*') AS strnum2
FROM DUAL
;

-- concat: 문자열 데이터를 합치는 용도
-- concat(문자열, 문자열)
SELECT
    CONCAT(EMPNO, CONCAT(' : ', ENAME)) AS name
FROM EMP
WHERE ENAME = 'SMITH'
;
SELECT
    EMPNO || ENAME AS name
    , EMPNO || ' : ' || ENAME as name2 -- CONCAT(EMPNO, CONCAT(' : ', ENAME))와 동일
FROM EMP
WHERE ENAME = 'SMITH'
;

-- trim, ltrim, rtrim: 글자나 기호가 나오기 전까지의 공백 지우기
-- trim(삭제 옵션)
SELECT
    '[' || TRIM(' _ _ORACLE_ _ ') || ']' as trim
    , '[' || LTRIM(' _ORACLE_ ') || ']' as Ltrim
    , '[' || TRIM(' <_ORACLE_> ') || ']' as Ltrim2
    , '[' || TRIM(' _ORACLE_ ') || ']' as Rtrim
    , '[' || TRIM(' <_ORACLE_> ') || ']' as Rtrim2
FROM DUAL
;

-- 숫자 데이터 다루기
-- round: 지정된 숫자의 특정 위치에서 반올림한 값을 반환
-- trumc: 지정된 숫자의 특정 위치에서 버림한 값을 반환
-- ceil: 지정된 숫자보다 큰 정수 중 가장 작은 정수 반환
-- floor: 지정된 숫자보다 작은 정수 중 가장 큰 정수 반환
-- mod: 지정된 숫자를 나눈 나머지 값을 반환
-- round(숫자, 반올림위치(선택사항))
SELECT
    ROUND(1234.5678) as round1
    , ROUND(1234.5678, 0) as round2
    , ROUND(1234.5678, 1) as round3 -- 소수점 한자리수까지 살리고 반올림
    , ROUND(1234.5678, -2) as round4 -- 소수점 위 두자리 반올림해서 반환
    , TRUNC(1234.5678, 1) as trunc
FROM DUAL
;

-- ceil, floor 각각 입력된 숫자의 자까운 큰 정수, 작은 정수를 반환
SELECT
    CEIL(3.14), FLOOR(3.14)
    , CEIL(-3.14), FLOOR(-3.14)
FROM DUAL
;

-- mod(나눗셈이 될 숫자, 나눌 숫자): 나머지 출력
SELECT
    MOD(15, 6)
FROM DUAL
;

-- 날짜 데이터를 다루는 함수
SELECT
    SYSDATE as now
    , SYSDATE - 1 as yesterday
    , SYSDATE + 1 as tomorrow
FROM DUAL
;

-- ADD_MONTHS(날짜데이터, 더할 개월 수): 몇개월 이후의 날짜 반환
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

-- months_between(날짜데이터1, 날짜데이터2): 두 날짜 간 개월 수 차
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

-- next_day, last_day >> 돌아오는 요일, 달의 마지막 날짜
-- next_day(날짜 데이터, 요일문자)
-- last_day(날짜 데이터)
SELECT
    SYSDATE
    , NEXT_DAY(SYSDATE, '월요일') as nd
    , LAST_DAY(SYSDATE) as ld
FROM DUAL
;

-- 날짜의 반올림, 버림 >> round, trunc 함수를 사용
-- round(날짜, 반올림 기준 포맷)
-- trunc(날짜, 버림 기준 포맷)
-- cc, scc: 네자리 연도의 끝 두자리를 기준으로 사용
-- 2016년이면 2050 이하이므로 반올림할 경우 2001년으로 처리
-- YYYY, SYYYY, SYEAR, YYY, YY, Y: 날짜 데이터의 해당 연월일의 7월 1일을 기준. 예) 2016년 7월1일의 경우 2017년으로 처리

-- 밑에는 잘 안씀, 존재만 알아도 괜찮다
-- IYYY, IYY, IY, I: ISO8601에서 제정한 날짜 기준년도 포맷 사용
-- Q: 각 분기의 두번째 달의 16일 기준
-- month, mon, mm, rm: 각 달의 16일 기준
-- ww: 해당 연도의 몇 주(1~53번째 주)를 기준
-- IW: ISO8601에서 제정한 날짜 기준 해당 연도의 주를 기준
-- W: 해당 월의 주(1~5번째 주)를 기준
-- ddd, dd, j: 해당 일의 정오(12:00:00)를 기준
-- day, dy, d: 한 주가 시작되는 날짜를 기준
-- hh, hh12, hh24: 해당 일의 시간을 기준
-- mi: 해당일 시간의 분을 기준
SELECT
    SYSDATE
    , ROUND(SYSDATE, 'CC') as formatcc
    , TRUNC(SYSDATE, 'CC') as formatcc2
    , ROUND(SYSDATE, 'YYYY') as formatYYYY
    , TRUNC(SYSDATE, 'YYYY') as formatYYYY2
FROM DUAL
;

-- 자료 형변환
    -- 명시적 형변환
-- TO_CHAR(날짜데이터, 출력되고자 하는 형태)
-- TO_NUMBER: 문자 데이터를 숫자 데이터로 변환
-- TO_DATE: 문자열 데이터를 날짜 데이터로 변환
SELECT
    SYSDATE
    , TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') as nowDateTime
    , TO_CHAR(SYSDATE, 'MM') as mm -- 월 두자리 숫자
    , TO_CHAR(SYSDATE, 'MON') as mon -- 언어별 월 이름 약자
    , TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') as month -- 언어별 월 이름 전체
    , TO_CHAR(SYSDATE, 'DD') as dd -- 일의 두자리 숫자
    , TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH') as dy -- 언어별 요일이름의 약자
    , TO_CHAR(SYSDATE, 'DAY') as day -- 언어별 요일이름 전체
    , TO_CHAR(SYSDATE, 'DDD') as ddd -- 일년 중 몇일째인지 표기
    , TO_CHAR(SYSDATE, 'WW') as ww -- 일년 중 몇째주인지 표기
FROM DUAL
;
SELECT
    TO_CHAR(SYSDATE, 'HH24:MI:SS') as hh24miss
    , TO_CHAR(SYSDATE, 'HH24:MI:SS AM') as hh24miss_am
FROM DUAL
;
SELECT
    EMPNO
    , EMPNO + '500' as empplus -- 자동으로 형변환해서 더함
FROM EMP
;
DESC EMP;

-- 9: 숫자의 한 자리를 의미(빈자리는 채우지 않음)
-- 0: 빈자리를 0으로 채움
-- $: $표시를 붙여서 출력
-- L: Local 지역 화폐단위 기호로 출력
-- . : 소수점 표기
-- , : 천 단위의 구분 표기
SELECT
    SAL
    , TO_CHAR(SAL, 'L999,999') as sal_l
    , TO_CHAR(SAL, '999,999.00') as sal_1
    , TO_CHAR(SAL, '000,999,999.00') as sal_2
FROM EMP
;

-- to_number: 문자 데이터를 숫자 데이터로 변환
-- to_number(문자 데이터, 인식될 숫자 형태)
SELECT
    TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
FROM DUAL
;

-- to_date: 문자열 데이터를 날짜 데이터로 변환
-- to_date(문자열 데이터, 인식될 날짜형태)
SELECT
    TO_DATE('20240807', 'YYYY-MM-DD') as dateStr1
    , to_date('2024-01-01', 'YYYY-MM-DD') as dateStr2
FROM DUAL
;

-- null 처리 함수
-- NVL(null 검사를 할 데이터, 앞의 데이터가 null일때 반환할 데이터)
-- NVL2(null 검사를 할 데이터, 앞의 데이터가 null이 아닐 때 반환할 데이터, 앞의 데이터가 null일때 반환할 데이터)
SELECT
    EMPNO
    , ENAME
    , SAL
    , COMM
    , SAL+COMM as result -- null을 더할 경우 얼마를 더하든 null이 나온다
    , NVL(COMM, 0) as commnvl
    , SAL+NVL(COMM, 0) as total
    , nvl2(comm, 'O', 'X') as nvl2
    , NVL2(COMM, SAL * 12 + COMM, SAL * 12) AS ANNSAL
FROM EMP
;

-- DECODE: NVL, NVL2 >> null인 경우에 어떤 데이터를 반환할 지 정한다.
-- 특정 열 값이나 데이터 값에 따라 어떤 데이터를 반환할 지 정할 때 DECODE함수 또는 CASE문을 사용한다.
-- DECODE는 if 조건문 또는 switch ~ case 와 비슷하다.
-- 기준 데이터를 먼저 지정하고 해당 데이터 값에 따라 다른 결과 출력
-- DECODE(데이터, 조건1, 데이터가 조건1과 일치할 경우 반환, 조건2, 특정 값 반환 ... , 그 외의 경우)
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

-- case문: decode 함수와 마찬가지로 특정 조건에 따라 반환할 데이터를 설정할 때 사용한다.
-- case[검사할 데이터],
--  when[조건1] then[조건1의 결과가 true일 때 반환되는 값]
--  when[조건2] then[조건2의 결과가 true일 때 반환되는 값]
-- ...
--  else[위 n개의 조건과 일치하는 경우가 없을 때 반환되는 값]
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
        WHEN COMM IS NULL THEN '해당사항 없음'
        WHEN COMM = 0 THEN '수당 없음'
        WHEN COMM > 0 THEN '수당 : ' || COMM
    END AS COMM_TEXT
FROM EMP
;

-- EMPNO열에는 EMP테이블에서 사원이름(ENAME)이 다섯글자 이상이며 여섯글자 미만인 사원 정보를 출력
-- MASKING_EMPNO열에 사원번호(EMPNO) 앞 두자리 외 뒷자리를 *기호로 출력
-- MASKING_ENAME열에 사원 이름의 첫 글자만 보여주고 나머지를 * 처리
SELECT
    EMPNO
    , RPAD(SUBSTR(EMPNO, 1, 2), LENGTH(EMPNO), '*') AS MASKING_EMPNO
    , RPAD(RPAD(ENAME, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) < 6
AND LENGTH(ENAME) >= 5
;

-- EMP 테이블에서 사원들의 월 평균 근무일 수는 21.5일, 하루 근무시간을 8시간으로 보았을 때 사원들의 하루 급여(DAY_PAY), 시급(TIME_PAY)를 계산해서 출력
-- 하루 급여는 소수점 세번째 자리에서 버리고, 시급은 두번째 자리에서 반올림
SELECT
    TRUNC(SAL / 21.5, 2) AS DAY_PAY
    , ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
FROM EMP
;

-- EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원번호(MGR)를 다음과 같은 조건을 기준으로 변환해서 CHG_MGR열에 출력
-- 직속상관 사번이 존재하지 않으면: 0000
-- 직속상관 사번 앞 두자리가 75일 경우: 5555
-- 직속상관 사번 앞 두자리가 76일 경우: 6666
-- 직속상관 사번 앞 두자리가 77일 경우: 7777
-- 직속상관 사번 앞 두자리가 78일 경우: 8888
-- 그 외: 본래 직속 상관의 사번 그대로
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

-- ======다중행 함수======
-- sum: 지정한 데이터의 합 반환
-- count: 지정한 데이터의 개수 반환
-- max: 지정한 데이터 중 최댓값 반환
-- min: 지정한 데이터 중 최솟값 반환
-- avg: 지정한 데이터의 평균값 반환
SELECT
    SUM(SAL)
    , COUNT(*) as count -- 전체 테이블의 행 개수
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
ORDER BY DEPTNO, JOB -- group by를 먼저 쓰고 order by를 써야 오류가 안난다
;
-- group by 절을 사용할 때 주의점: 다중 행 함수를 사용하지 않은 일반 열은 group by절에 명시하지 않으면 select절에서 사용 불가

-- having: group by절이 존재할 때만 사용 가능. group by절을 통해 그룹화 된 결과값의 범위를 제한할 때 사용한다
SELECT
    DEPTNO, JOB, AVG(SAL) AS AVG
FROM EMP
WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000 -- having은 group by뒤에 와야한다
ORDER BY DEPTNO, JOB
;
