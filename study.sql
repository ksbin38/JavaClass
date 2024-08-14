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

-- having: group by절이 존재할 때만 사용 가능. group by절을 통해 그룹화 된 결과값의 범위를 제한할 때 사용한다(group by절에 조건을 줄 때 사용)
SELECT
    DEPTNO, JOB, AVG(SAL) AS AVG
FROM EMP
WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000 -- having은 group by뒤에 와야한다
ORDER BY DEPTNO, JOB
;


-- 0808
-- 데이터 선택 select
-- 데이터 추가, 수정, 삭제
-- 데이터 조작어로 부르는 DML(Data Manipulation Language)
-- select문으로 조회한 테이블에 데이터를 추가, 변경, 삭제할 때 사용하는 명령어로 이루어져 있다.

-- 테이블 복사
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP;
-- 테이블 삭제
DROP TABLE DEPT_TEMP;

-- insert: 테이블에 데이터를 추가
-- insert into[테이블 이름] (열1, 열2, 열3, ... , 열n)
    -- values (열1의 값, 열2의 값, 열3의 값, ... , 열n의 값);

DESC DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
    VALUES (50, 'DATABASE', 'SEOUL');
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
    VALUES (60, 'NETWORK', 'BUSAN');

SELECT * FROM DEPT_TEMP;
-- INSERT 시 오류 발생: 지정한 열 개수가 각 열에 입력할 데이터 개수와 불일치
-- 또는 자료형이 맞지 않는 경우, 또는 열 길이를 초과하는 데이터를 지정할 경우
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (70, 'WEB', null);
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (80, 'MOBILE', ''); -- 70, 80 둘다 (null)로 추가됨

INSERT INTO DEPT_TEMP (DEPTNO, LOC)
    VALUES (90, 'INCHEON'); -- 지정을 안한 값은 알아서 (null)로 인식

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
    , '홍길동'
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

-- update [테이블 이름]
-- set [변경할 열1] = [변경할 값], [변경할 열2] = [변경할 값], [변경할 열3], [변경할 값]
-- where 변경할 대상의 조회 조건(where 입력 안하면 전체에 적용됨)
CREATE TABLE DEPT_TEMP2 AS SELECT * FROM DEPT;
UPDATE DEPT_TEMP
    SET LOC = 'SEOUL'
    , DNAME = 'DATABASE'
WHERE DEPTNO = 40
;
ROLLBACK; -- 실행취소(<-> commit: 실행한걸 저장)
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

-- delete: 테이블 데이터 삭제
-- delete from [테이블 이름]
    -- where [삭제할 행 조건]

SELECT * FROM EMP_TEMP ORDER BY JOB;
DELETE FROM EMP_TEMP
WHERE JOB = 'MANAGER';

DELETE FROM EMP_TEMP
WHERE SAL >= 3000;

-- CRUD: Create(생성), Read(읽기), Update(갱신), Delete(삭제)

-- 데이터 정의어(DDL: Data Definition Language)
-- 데이터베이스 데이터를 보관하고 관리하기 위해 제공되는 여러 객체의 생성, 변경, 삭제 관련 기능
-- create: 객체 생성
-- alter: 객체 변경
-- rename: 테이블 이름 변경
-- drop: 객체 삭제

-- create >> 테이블 생성
-- create table 소유계정.테이블이름 (
    -- 열1이름 열1의 자료형
    -- , 열2이름 열2의 자료형
    -- , ...
    -- , 열n이름 열n의 자료형
    -- );
-- 주의할 점: 테이블 생성 규칙
-- 1. 테이블 이름은 문자로 시작
-- 2. 테이블 이름은 30바이트 이하(영어 30자, 한글 15자)
-- 3. 같은 사용자 소유의 테이블 이름은 중복 불가
-- 4. 테이블 이름은 영문자, 숫자와 특수문자 $,#,_를 사용 가능
-- 5. SQL 키워드는 테이블 이름으로 사용할 수 없다.

-- 열 이름 생성 규칙
-- 1. 열 이름은 문자로 시작해야 한다
-- 2. 열 이름은 30바이트 이하여야 한다
-- 3. 한 테이블의 열 이름은 중복될 수 없다
-- 4. 열 이름은 영문자, 숫자, 특수문자 $,#,_ 사용 가능
-- 5. SQL 키워드는 열 이름으로 사용할 수 없다
DESC EMP;
-- 테이블 생성
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
-- 테이블 복사
CREATE TABLE DEPT_DDL AS SELECT * FROM DEPT;

CREATE TABLE EMP_DDL_30 AS SELECT * FROM EMP WHERE DEPTNO = 30;
SELECT * FROM EMP_DDL_30;

-- alter: 객체를 변경할 때 사용하고 테이블의 새 열을 추가 또는 삭제
    -- 열의 자료형 또는 길이 변경할 때 사용
CREATE TABLE EMP_ALTER AS SELECT * FROM EMP;
SELECT * FROM EMP_ALTER;

-- add: 열 추가
-- 핸드폰 번호 > 20자 추가, HP
ALTER TABLE EMP_ALTER
    ADD HP VARCHAR2(20);

-- rename: 열 이름 변경
ALTER TABLE EMP_ALTER
    RENAME COLUMN HP TO TEL;

-- modify: 열의 자료형 변경
ALTER TABLE EMP_ALTER
    MODIFY EMPNO NUMBER(5);
DESC EMP_ALTER;

-- drop: 특정 열 삭제(열 안에 값이 있어도 삭제함, 주의!!)
ALTER TABLE EMP_ALTER
    DROP COLUMN TEL
;

-- rename: 테이블의 이름을 변경한다
RENAME EMP_ALTER TO EMP_RENAME;
SELECT * FROM EMP_RENAME;

-- 다음열 구조를 가지는 emp_hw 테이블 생성
-- 열이름/ 자료형/ 길이
-- empno / 정수형 숫자 / 4
-- ename / 가변형 문자열 / 10
-- job / 가변형 문자열 / 9
-- mgr / 정수형 문자 / 4
-- hiredate / 날짜 / -
-- sal / 소수점 둘째자리까지 표현되는 숫자 / 7
-- comm / 소수점 둘째자리까지 표현되는 숫자 / 7
-- deptno / 정수형 숫자 / 2
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

-- EMP_HW 테이블에 BIGO 열 추가, 자료형은 가변형 문자열이고 길이는 20
ALTER TABLE EMP_HW
    ADD BIGO VARCHAR2(20);

-- EMP_HW테이블의 BIGO 열 크기를 30으로 변경
ALTER TABLE EMP_HW
    MODIFY BIGO VARCHAR2(30);

-- EMP_HW 테이블의 BIGO 열 이름을 REMARK로 변경
ALTER TABLE EMP_HW
    RENAME COLUMN BIGO TO REMARK;

-- EMP_HW 테이블에 EMP 테이블의 데이터를 모두 저장하되 remark열은 null로 삽입
INSERT INTO EMP_HW
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL
FROM EMP;

-- EMP_HW 테이블 삭제
DROP TABLE EMP_HW;




-- 제약 조건
-- 제약 조건은 테이블의 특정한 열에 지정, 제약 조건을 지정한 열에 제약 조건에 부합하지 않는 데이터를 지정할 수 없다.
-- - NOT NULL: 		    지정한 열에 null을 허용하지 않는다. null을 제외한 데이터의 중복은 허용된다.
-- - UNIQUE: 		    지정한 열이 유일한 값을 가지게 한다. 중복 불가
-- - PK(PRIMARY KEY): 	지정한 열이 유일한 값이면서 null을 허용하지 않는다. primary key는 테이블에 하나만 지정 가능
-- - FK(FOREIGN KEY): 	다른 테이블의 열을 참조하여 존재하는 값만 입력 가능.
-- - CHECK: 		    설정한 조건식을 만족하는 데이터만 입력 가능

-- 데이터 무결성: 데이터베이스에 저장되어있는 데이터의 정확성, 일관성을 보장한다는 의미
-- - 영역 무결성(domain integrity):	    열에 저장되는 값의 적정 여부를 확인. 자료형, 적정한 형식의 데이터, null 여부 같은 정해 놓은 범위를 만족하는 데이터임을 규정
-- - 개체 무결성(entity integrity):	    테이블 데이터를 유일하게 식별할 수 있는 기본키는 반드시 값을 가지고 있어야 하며, null이 될 수 없고 중복도 될 수 없음을 규정
-- - 참조 무결성(referential integrity):	참조 테이블의 외래키 값은 참조 테이블의 기본키로서 존재해야 하며 null이 가능


-- NOT NULL: 빈 값을 허락하지 않는다. 특정 열에 데이터의 중복 여부과 상관없이 NULL의 저장을 허용하지 않는다.
CREATE TABLE TABLE_NOTNULL (
    LOGIN_ID    VARCHAR2(20) NOT NULL,
    LOGIN_PWD   VARCHAR2(20) NOT NULL,
    TEL         VARCHAR2(20)
);
INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD)
VALUES ('TEST_ID_01', '1234');

UPDATE TABLE_NOTNULL SET LOGIN_PWD = NULL
WHERE LOGIN_ID = 'TEST_ID_01'; -- null로 업데이트 불가

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
ORDER BY CONSTRAINT_TYPE;
-- owner: 제약 조건 소유 계정
-- constraint_name: 제약 조건 이름(직접 지정하지 않으면 오라클리 자동으로 지정)
-- constraint_type: 제약 조건 종류
        -- c: check, not null
        -- u: unique
        -- p: primary key
        -- r: foreign key
-- table_name: 제약 조건을 지정한 테이블 이름

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

-- 테이블의 제약 조건 확인
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

-- 제약 조건 이름 변경
ALTER TABLE TABLE_NOTNULL2
RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN2_TEL_NN;

-- 제약 조건 삭제
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
-- 제약 조건 확인
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

-- unique는 중복은 안될 뿐 null은 들어갈 수 있다
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
-- 제약 조건을 추가하려면 지우고 새로 부여해야함
ALTER TABLE TABLE_UNIQUE
DROP CONSTRAINT TBLUNQ_LID_UNQ;

ALTER TABLE TABLE_UNIQUE
MODIFY LOGIN_ID CONSTRAINT TBLUNQ_LID_UNQ UNIQUE NOT NULL;

-- PRIMARY KEY: unique + not null
-- pk는 한 테이블에 한 개만 존재 가능

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

-- INDEX: 데이터베이스에서 데이터를 보다 빠르고 효율적으로 검색하기 위해 사용하는 데이터 구조. 책의 색인처럼 작동한다.
-- DB 테이블 내에서 특정 행을 빠르게 찾을 수 있게 해준다.

-- 테이블의 인덱스 조건 확인
SELECT
    INDEX_NAME
    , TABLE_OWNER
    , TABLE_NAME
FROM USER_INDEXES
WHERE TABLE_NAME LIKE 'TABLE_PK%';

INSERT INTO TABLE_PK (LOGIN_ID, LOGIN_PWD, TEL)
VALUES ('TEST_ID_01', '1234', '010-1234-5678');

SELECT * FROM TABLE_PK;

-- 인라인 또는 열레벨 제약 조건 정의
CREATE TABLE TBL (
    COL1 VARCHAR2(100) CONSTRAINT AAAA PRIMARY KEY
    , COL2 VARCHAR2(50) NOT NULL
    , COL3 VARCHAR2(1)
);
-- 아웃오브라인 또는 테이블 레벨 제약 조건 정의
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
-- 외래키, 외부키로 부르기도 한다. 서로 다른 테이블 간 관계를 정의하는데 사용하는 제약 조건.
-- 특정 테이블에서 pk제약 조건을 지정한 열을 다른 테이블의 특정 열에서 참조하겠다는 의미

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('EMP', 'DEPT');

SELECT * FROM EMP;
SELECT * FROM DEPT;

INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(9999, '홍길동', 'CLERK', '7788', SYSDATE, 1200, NULL, 50); -- 부모 키가 없습니다 출력됨

-- CREATE TABLE 테이블이름 (
--      ...다른 열의 정의,
--      열이름 자료형 REFERENCES 참조할 테이블(참조할 열)
-- );

-- CREATE TABLE 테이블이름 (
--      ...다른 열의 정의,
--      CONSTRAINT [제약 조건 이름] FOREIGN KEY [열]
--      REFERENCES 참조할 테이블(참조할 열)
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
VALUES (9999, 'TEST_NAME', 'TEST_JOB', null, SYSDATE, 3000, NULL, 10); -- 무결성 제약조건 위배 - 부모키가 없다고 뜸

INSERT INTO DEPT_FK
VALUES (10, 'TEST_DNAME', 'TEST_LOC'); -- 이걸 먼저 실행해야 아래를 실행할 수 있음
INSERT INTO EMP_FK
VALUES (9999, 'TEST_NAME', 'TEST_JOB', null, SYSDATE, 3000, NULL, 10);

-- DEPT_FK >> 10번부서 데이터가 있다
-- EMP_FK >> 10번부서를 참조하는 데이터가 있다

-- DEPT_FK의 DEPTNO = 10을 삭제하려면
-- 1. 현재 삭제하려는 열 값을 참조하는 데이터를 먼저 삭제
    -- EMP_FK > 10번을 쓰는 행을 삭제
-- 2. 현재 삭제하려는 열 값을 참조하는 데이터를 수정
    -- EMP_FK > 10번을 쓰는 행 값을 null 또는 다른 부서 값으로 변경 후 삭제
-- 3. 현재 삭제하려는 열을 참조하는 자식 테이블의 FK 제약 조건을 해제한다

-- CONSTRAINT [제약조건이름] REFERENCES 참조테이블(참조할 열) ON DELETE CASCADE >> 두 테이블에 있는 데이터 모두 삭제됨
-- CONSTRAINT [제약조건이름] REFERENCES 참조테이블(참조할 열) ON DELETE SET NULL >> 도 가능

CREATE TABLE TABLE_CHECK (
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LID_PK PRIMARY KEY
    , LOGIN_PW VARCHAR2(20) CONSTRAINT TBLCK_LPW_CK CHECK (LENGTH(LOGIN_PW) > 3)
    , TEL VARCHAR2(20)
);
INSERT INTO TABLE_CHECK
VALUES ('TEST_ID', '1234', '010-1234-5678');

-- DEFALUT >> 기본값을 의미
CREATE TABLE TABLE_DEFAULT (
    LOGIN_ID VARCHAR2(20),
    LOGIN_PW VARCHAR2(20) DEFAULT '1234',
    TEL VARCHAR2(20)
);
INSERT INTO TABLE_DEFAULT
VALUES ('TEST_ID', null, '010-0000-0000'); -- 패스워드 값을 지정하면 지정한대로 저장됨
INSERT INTO TABLE_DEFAULT (login_id, tel)
VALUES ('TEST_ID_02', '010-0000-0000'); -- 패스워드 값을 지정하지 않으면 기본값으로 저장됨

-- 연습 문제
-- 조건에 맞는 테이블 생성
CREATE TABLE DEPT_CONST (
    DEPTNO NUMBER(2) CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14) CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE,
    LOC VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL
);
-- 조건에 맞는 테이블 생성
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
-- 제약 조건 확인
SELECT
    TABLE_NAME
    , CONSTRAINT_NAME
    , CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('DEPT_CONST', 'EMP_CONST')
ORDER BY CONSTRAINT_NAME;


-- 0812
-- group by 복습
-- group by 절을 사용할 때 주의점: 다중 행 함수를 사용하지 않은 일반 열은 group by절에 명시하지 않으면 select절에서 사용 불가
-- having: group by절이 존재할 때만 사용 가능. group by절에 조건을 줄 때 사용

-- select 조회할 열1 이름, ... , 조회할 열n 이름
-- from 조회할 테이블
-- where 조회할 선별 조건
-- group by 그룹화 할 열 지정(n개)
-- having 출력 드룹을 제한하는 조건
-- order by 정렬하려는 열 지정;

-- where: 다중행 함수 사용 불가, 출력 대상 행을 제한
-- having: 쉼표(,)로 조건 추가 가능


-- rollup, cube, grouping sets
-- 위의 함수들은 group by절에 지정할 수 있는 특수한 함수
-- rollup, cube: 그룹화 데이터의 합계를 함께 출력한다
    -- rollup: 한 그룹의 합계 데이터를 출력
    -- cube: 모든 그룹의 합계 데이터 출력

-- select ...
-- from 테이블
-- where 조건
-- group by rollup/cube 그룹화 열 지정;
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

-- listagg 함수
-- 오라클 11g부터 사용
-- 그룹에 속해 있는 데이터를 가로로 나열하는 함수
select
    deptno
    , listagg(ename, ', ')
        within group(order by sal desc) as enames
from emp
group by deptno; -- 급여 높은사람부터 이름을 내림차순으로 같은 곳에 나열


-- pivot / unpivot 함수
-- 잘 사용되진 않는다, 그나마 pivot이 unpivot에 비해 더 사용 빈도가 높다
-- pivot: 기존 데이터 행을 열로 바꿔서 출력
-- unpivot: 기존 데이터 열을 행으로 바꿔서 출력

-- 부서별, 직책별로 그룹화하고 최고 급여 데이터 출력하기
select *
    from (select deptno, job, sal from emp)
    pivot(max(sal) for deptno in (10, 20, 30))
order by job;

-- join
-- 관계형 데이터베이스는 여러 종류의 데이터가 다양한 테이블에 나눠서 저장되는 특성
-- 두개 이상의 테이블을 연결하고 하나의 테이블처럼 출력할 때 사용하는 방식

-- 여러 테이블을 사용할 때의 from절
-- from절에 여러개의 테이블을 지정할 수 있다
    -- select * from 테이블1, 테이블2, ... , 테이블n;

-- 테이블에 별칭 지정 후 함께 출력
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
order by empno;
-- 등가 join(잘 안씀)

-- natural join: 등가 조인을 대신해서 사용하는 조인 방식. 조인 대상이 되는 두 테이블에 이름과 자료형이 같은 열을 찾은 후 그 열을 기준으로 등가 조인한다.
-- 자동으로 공통인 열을 select절에 명시할 때 테이블 별칭을 붙이면 안된다

-- 위와 같은 방식이나 겹치는 열을 별칭 없이 기입해야함
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, deptno, d.dname, d.loc
from emp e natural join dept d
order by empno;

-- join ~ using
-- 등가 조인을 대신하는 조인 방식
-- natural join과 다른 점을 natural join은 자동으로 조인 기준열을 지정하지만 using 키워드에 조인 기준으로 사용할 열을 명시한다.
-- 예) from 테이블1 join 테이블2 using (조인에 사용할 기준 열)
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, deptno, d.dname, d.loc
from emp e join dept d using (deptno)
where sal >= 3000
order by deptno, e.empno;

-- join ~ on
-- 가장 많이 사용하는 조인 방식
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno, d.dname, d.loc
from emp e join dept d on (e.deptno = d.deptno)
where sal >= 3000
order by deptno, e.empno;

-- outer join(외부 조인)
-- from 테이블1 left outer join 테이블2 on (e1.mgr = e2.empno): 테이블1을 왼쪽에 두고 테이블2를 붙여라(null 값이 있어도 모조리 다 출력)
    -- 오른쪽에 붙이고 싶으면 right outer join 쓰면 됨
select
    e1.empno, e1.ename, e1.mgr,
    e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 left outer join emp e2 on (e1.mgr = e2.empno)
order by e1.empno;

-- full outer join
-- left outer join + right outer join >> 왼쪽이랑 오른쪽이 null인 경우 모두 출력
select
    e1.empno, e1.ename, e1.mgr,
    e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 full outer join emp e2 on (e1.mgr = e2.empno)
order by e1.empno;

-- select *
-- from aaa a
-- left outer join bbb b on a.id = b.id
-- left outer join ccc c on b.id = c.id
-- 이런식으로 계속 할 수 있다

select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno, d.dname, d.loc
from emp e full outer join dept d on (e.deptno = d.deptno)
order by deptno, e.empno;
update emp set deptno = null where empno = 7839;

-- inner join(= join)
-- 양쪽 테이블에 모두 존재하는 것만 출력(join ~ on 과 같지만 inner join ~ on을 주로 사용한다)

-- 사원의 부서 정보 출력 emp, dept
SELECT
    A.EMPNO, A.ENAME, A.JOB, A.DEPTNO, B.DNAME
FROM EMP A INNER JOIN DEPT B ON A.DEPTNO = B.DEPTNO
ORDER BY A.EMPNO;

-- hash join, loop join, nerge join 도 존재한다(데이터가 많을 때 유효)

-- left out join((+)를 왼쪽으로 바꾸면 right out join) // 굳이 알 필요는 없다
select
    a.empno, a.ename, a.job, a.deptno, b.dname
from emp a, dept b
where a.deptno = b.deptno(+)
order by a.empno;

-- 급여가 2000 초과인 사원들의 부서 정보, 사원 정보 출력
-- sql 99 이전 방식
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

-- 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원 수 출력
select
    d.deptno, d.dname, trunc(avg(e.sal)) as avg_sal, max(e.sal) as max_sal, min(e.sal) as min_sal, count(*) as cnt
from emp e, dept d
    where e.deptno = d.deptno
group by d.deptno, d.dname;

select
    d.deptno, d.dname, trunc(avg(e.sal)) as avg_sal, max(e.sal) as max_sal, min(e.sal) as min_sal, count(*) as cnt
from emp e inner join dept d on (e.deptno = d.deptno)
group by d.deptno, d.dname;

-- 모든 부서 정보와 사원 정보를 부서 번호, 사원 이름순으로 정렬하여 출력
-- sql 99 이전 방식
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

-- 모든 부서 정보, 사원 정보, 급여 등급 정보, 각 사원의 직속 상관의 정보를 부서, 사원 번호 순으로 정렬하려 출력
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

-- sub query(서브 쿼리)
-- sql 쿼리를 실행할 때 select문 안에 select문을 작성하는 것
-- select 조회할 열
-- from 조회할 테이블
-- where 조건식(
--      select 조회할 열
--      from 조회할 테이블
--      where 조건식
-- );
-- 1번
SELECT SAL FROM EMP WHERE ENAME = 'JONES';
-- jones의 급여는 2975
select * from emp where sal > 2975;
-- 급여가 2975 초과인 사람 찾기
-- 서브쿼리를 쓰면 >>
SELECT *
FROM EMP
WHERE SAL > (
    SELECT SAL
    FROM EMP
    WHERE ENAME = 'JONES'
);
-- 서브쿼리의 특징
-- 1. 서브쿼리는 연산자와 같은 비교 또는 조회 대상의 우측에 놓고 괄호로 묶는다.
-- 2. 몇 가지 케이스가 존재하나 대부분의 서브쿼리는 order by를 사용할 수 없다.
-- 3. 서브쿼리의 select절에 명시한 열은 메인 쿼리의 비교 대상과 같은 자료형과 같은 계수로 지정해야 한다. 즉, 메인 쿼리의 비교 대상 데이터가 하나라면 서브쿼리의 select절 역시 같은 자료형인 열을 하나 지정해야 한다.
-- 4. 서브쿼리에 있는 select문의 결과 행 수는 함께 사용하는 메인 쿼리의 연산자 종류와 호환 가능해야 한다.
    -- 예: 메인 쿼리에 사용한 연산자가 단 하나의 데이터로만 연산이 가능한 연산자라면 서브 쿼리의 결과 행 수는 반드시 하나여야 한다.

-- 서브쿼리를 사용해서 emp 테이블의 사원 정보 중에 사원이름이 allen인 사원의 추가 수당보다 많은 추가 수당을 받는 사원 정보를 출력
SELECT *
FROM EMP
WHERE COMM > (
    SELECT COMM
    FROM EMP
    WHERE ENAME = 'ALLEN'
);

-- 이런것들도 가능하다(추후에 많이 사용할 수 있으니 구조를 알아두자)
-- 가급적이면 서브쿼리를 안쓰는 방향으로 생각은 해야됨
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
-- 단일행 서브쿼리(single-row subquery)
-- 초과(>), 이상(>=), 같음(=), 이하(<=), 미만(<), 같지 않음(<>, !=, ^=)

-- 서브쿼리의 결과가 1개 이상 출력되면 다중행 서브쿼리(multiple-row subquery)를 써야한다.
SELECT
    E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E
    INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 20
    AND E.SAL > (SELECT AVG(SAL) FROM EMP);
    
-- 서브쿼리를 사용해서 emp 테이블에서 전체 사원의 평균 급여보다 작거나 같은 급여를 받고 있는 20번 부서의 사원 및 부서의 정보를 출력
SELECT
    E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E
    INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 20
    AND E.SAL <= (SELECT AVG(SAL) FROM EMP);

-- 다중행 서브쿼리(multiple-row subquery)
-- 다중행 연산자 종류
-- IN: 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있으면 true
-- ANY, SOME: 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true
-- ALL: 메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 true
-- EXISTS: 서브쿼리의 결과가 존재하면, 즉, 행이 1개 이상일 경우 true

-- EMP > 부서번호 20, 30인 사원 정보 출력
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
-- 부서번호 30인 사람들의 급여보다 더 받는 직원정보 출력
SELECT * FROM EMP WHERE SAL > ALL (
    SELECT SAL FROM EMP WHERE DEPTNO = 30
);

-- EXISTS: 서브쿼리의 결과 값이 하나 이상 존재하면 조건식이 모두 true, 존재하지 않으면 모두 false
SELECT * FROM EMP WHERE EXISTS (
    SELECT DNAME FROM DEPT WHERE DEPTNO = 10
);

-- 쿼리를 대문자로 쓰는 이유
-- 1. 가독성
-- 2. 표준화(일관성)
-- 3. 전통

-- 다중열 서브쿼리(multiple-column subquery)
SELECT * FROM EMP
WHERE (DEPTNO, SAL) IN (
    SELECT DEPTNO, MAX(SAL) FROM EMP
);

-- FROM절에서 사용하는 서브쿼리 with절
SELECT E10.EMPNO, E10.ENAME,E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10, -- 인라인 뷰(inline view)
    (SELECT * FROM DEPT) D -- 인라인 뷰(테이블이 너무 커 특정 데이터안에서 찾을 때 사용, 가독성이 떨어지긴 한다)
WHERE E10.DEPTNO = D.DEPTNO;
-- WITH: 메인쿼리가 될 select문 안에서 사용할 서브쿼리와 별칭을 먼저 지정한 후 메인쿼리에 사용한다.
-- 활용법
-- with
-- [별칭1] as [select문 1],
-- [별칭2] as [select문 2],
-- ...
-- [별칭n] as [select문 n]
-- select from 별칭1, 별칭2, ...
WITH
    E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
    D AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO = D.DEPTNO;

-- SELECT절에서 사용하는 서브쿼리(스칼라 서브쿼리 scalar subquery)
SELECT 
    EMPNO, ENAME, JOB, SAL,
    (SELECT GRADE FROM SALGRADE
        WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
    DEPTNO,
    (SELECT DNAME FROM DEPT
        WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
FROM EMP E;

-- 전체 사원 중 allen과 같은 직책인 사원들의 사원정보, 부서정보 출력
SELECT
    E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN')
AND E.DEPTNO = D.DEPTNO;
-- 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원정보, 부서 정보, 급여 등급정보 출력(급여가 많은순으로 정렬, 급여 같은 경우 사원번호 기준 오름차순)
SELECT
    E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.SAL > (SELECT AVG(SAL) FROM EMP)
    AND E.DEPTNO = D.DEPTNO
    AND E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY E.SAL DESC, E.EMPNO ASC;
-- 직책이 salesman인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원정보, 급여등급정보 출력(서브쿼리를 활용할때 다중행함수를 사용하는 방법과 사용하지 않는 방법을 통해 사원번호 오름차순 정렬)
-- 다중행 함수 사용X
SELECT
    E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND E.SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO ASC;
-- 다중행 함수 사용
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

-- ROLLBACK: 현재 트랜잭션에 포함된 데이터 조작 관련 명령어의 수행을 모두 취소한다.
ROLLBACK;
-- COMMIT: 지금까지 트랜잭션에서 데이터 조작 관련 명령어를 통해 변경된 데이터를 모두 데이터베이스에 영구히 반영한다. rollback 안됨.
COMMIT;


-- 세션(session): 어떤 활동을 위한 시간 또는 기간
DELETE FROM DEPT_TCL WHERE DEPTNO = 50;
COMMIT; -- 커밋을 해야 명령 프롬프트(cmd)에서 똑같이 출력을 해도 반영된 데이터베이스가 그대로 나올 수 있다.

-- LOCK: 특정 세션에서 조작중인 데이터는 트랜잭션이 완료되기 전까지 다른 세션에서 조작할 수 없는 상태. 즉, 데이터가 잠긴다.
-- 특정 세션에서 데이터 조작이 완료될 때까지 다른 세션에서 해당 데이터 조작을 기다리는 현상을 HANG(행)이라고 한다.
SELECT * FROM DEPT_TCL;
UPDATE DEPT_TCL SET LOC = 'SEOUL' WHERE DEPTNO = 30;
COMMIT;

-- 운영기
-- 개발기

-- 시퀀스(sequence): 규칙에 따라 순번을 생성한다.
-- CREATE SEQUENCE 시퀀스 이름
-- [INCREMENT BY n] -- 시퀀스에서 생성할 번호의 증가 값(기본은 1) (선택)
-- [START WITH n] -- 시퀀스에서 생성할 번호의 시작 값(기본은 1) (선택)
-- [MAXVALUE n | NOMAXVALUE] -- 시퀀스에서 생성할 번호의 최댓값, 최댓값은 시작값(START WITH) 이상, 최솟값(MINVALUE)의 초과값으로 지정
        -- NOMAXVALUE >> 오름차순 10 27, 내림차순 >> -1로 설정(선택)
-- [MINVALUE n | NOMAXVALUE] -- 시퀀스에서 생성할 번호의 최솟값, 최솟값은 시작값(START WITH) 이하, 최댓값(MAXVALUE)의 미만값으로 지정
        -- NOMAXVALUE >> 오름차순이면 1, 내림차순이면 10-26으로 설정(선택)
-- [CYCLE | NOCYCLE] -- 시퀀스에서 생성한 번호가 최댓값(MAXVALUE)에 도달했을 때 CYCLE이면 시작값(START WITH)에서 다시 시작
        -- NOCYCLE이면 번호 생성 중단. 그리고 추가번호 생성을 요청하면 오류 발생(선택)
-- [CACHE n | NOCACHE] -- 시퀀스가 생성할 번호를 메모리에 미리 할당해 놓은 수를 지정
        -- NOCACHE는 미리 생성하지 않도록 설정, 옵션 모두 생략하면 기본값은 20(선택)
        
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

-- 시퀀스 사용
-- 시퀀스이름.CURRVAL >> 시퀀스에서 마지막으로 생성한 번호 / 시퀀스이름.NEXTVAL >> 다음 번호 생성

INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
    VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL'); -- maxvalue를 90까지 설정해서 10번째 삽입부터 오류 발생
-- 가장 마지막으로 생성된 시퀀스 확인
SELECT SEQ_DEPT_SEQUENCE.CURRVAL FROM DUAL;

-- 시퀀스 수정(START WITH 변경 불가)
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 3
    -- START WITH 는 변경 불가
    MAXVALUE 99
    CYCLE;

INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
    VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL'); -- cycle로 설정했기 때문에 99까지 와도 다시 0부터 시작, cycle은 권장하지 않음)
    
SELECT * FROM DEPT_SEQUENCE;

-- 시퀀스 삭제
DROP SEQUENCE SEQ_DEPT_SEQUENCE;
-- 시퀀스를 삭제해도 기존에 시퀀스를 사용해서 만든 테이블은 내용이 바뀌지 않음


-- PL/SQL
-- 데이터베이스 관련 특정 작업을 수행하는 명령어와 실행에 필요한 여러 가지 요소를 정의하는 명령어 등으로 구성되며, 이러한 명령어를 모아 둔 PL/SQL 프로그램의 기본 단위를 블록(block)이라고 한다.
-- DECLARE(선언부) / 선택 / 실행에 사용할 변수, 상수, 커서 등을 선언
-- BEGIN (실행부) / 필수 / 조건문, 반복문, SELECT, DML, 함수 등을 정의
-- EXCEPTION (예외처리부) / 선택 / PL/SQL실행 중 발생하는 예외 상황을 해결하는 문장 기술
/*
DECLARE
    [실행에 필요한 여러 요소 선언];
BEGIN
    [작업을 위해 실제 실행하는 명령어];
EXCEPTION
    [PL/SQL 수행 중 발생하는 오류 처리];
END;
*/
-- 실행결과를 화면에 출력
SET SERVEROUTPUT ON;

/*
여러줄 주석처리
*/

-- DBMS_OUTPUT.PUT_LINE() = SYSTEM.OUT.PRINTLN()
-- 변수, 상수
-- 변수 사용법
-- [변수이름] [자료형] := [값 또는 값이 도출되는 여러 표현식];
DECLARE
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- 상수 선언
-- [변수이름] CONSTANT [자료형] := [값 또는 값을 도출하는 여러 표현식];
DECLARE
    V_TAX NUMBER(1) := 3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
/

-- 변수의 기본 값 지정
-- [변수이름] [자료형] DEFAULT [값 또는 값이 도출되는 여러 표현식];
DECLARE
    V_DEPTNO NUMBER(2) DEFAULT 10; -- 변수 선언 시 기본값을 설정
    V_DEPTNO2 NUMBER(2) := 10; -- 변수 선언과 동시에 초기값 설정
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- 변수에 NULL값 저장 막기
-- [변수이름] [자료형] NOT NULL := [값 또는 값이 도출되는 여러 표현식];
DECLARE
    V_NN NUMBER(2) NOT NULL := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_NN : ' || V_NN);
END;
/

-- 변수 이름 정하기
-- 1. 같은 블록 안에서 식별자는 고유해야하고 중복될 수 없다.
-- 2. 대소문자 구별을 하지 않는다.
-- 3. 테이블 이름 붙이는 규칙과 동일한 규칙이다.
    -- 이름은 문자로 시작, 숫자로 시작할 수 없고 한글도 가능은 하지만 쓰지말자. 이름은 30바이트 이하 > 영어 30자, 한글 15자.
    -- 영문자(한글 사용 가능), 숫자(0~9), 특수문자($,#,_) 사용 가능
    -- SQL 키워드는 테이블 이름으로 사용 불가(SELECT, FROM 등)

-- 변수의 자료형
-- 변수에 저장할 데이터가 어떤 종류인지를 특정짓기 위해 사용하는 자료형은 크게 스칼라(SCALAR), 복합(COMPOSITE), 참조(REFERENCE), LOB(LARGE OBJECT)로 구분된다.
-- 스칼라형: 지금까지 사용한 자료형. 숫자, 문자열, 날짜 등. 오라클에서 기본으로 정의해 놓은 자료형이고 내부 구성 요소가 없는 단일 값을 의미 // 자바에서 PRIMIRIVE와 유사
-- 숫자 / NUMBER / 소수점을 포함할 수 있는 최대 38자리 숫자
-- 문자열 / CHAR / 최대 32,767 바이트 고정 길이 문자열
        -- VARCHAR2 / 최대 32,767 바이트 가변 길이 문자열
-- 날짜 / DATE / 9999년 12월 31일까지의 날짜
-- 논리 / BOOLEAN / PL/SQL에서만 사용할 수 있는 논리 자료형. TRUE, FALSE, NULL을 포함

-- 참조형: 오라클DB에 존재하는 특정 테이블 열의 자료형이나 하나의 행 구조를 참조하는 자료형
        -- 열을 참조할 때는 %TYPE / 행을 참조할 때는 %ROWTYPE
-- [변수이름] [테이블이름].[열이름]%TYPE;
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/
-- [변수이름] [테이블이름]%ROWTYPE;
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

-- 복합형
-- 컬렉션 / TABLE / 한가지 자료형의 데이터를 여러 개 저장 (테이블 열과 유사)
-- 레코드 / RECORD / 여러 종류 자료형의 데이터를 저장 (테이블의 행과 유사)
-- LOB: LARGE OBJECT, 대용량의 텍스트, 이미지, 동영상 등 대용량 데이터를 저장하기 위한 자료형 (BLOB, CLOB 등)

-- IF
-- IF ~ THEN
/*
IF [조건식] THEN [수행할 명령어];
END IF;
*/
-- 변수에 입력한 값이 홀수인지 짝수인지 판단
DECLARE
    V_NUMBER NUMBER := 13;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER는 홀수입니다.');
    END IF;
END;
/

-- IF ~ THEN ~ ELSE
/*
IF [조건식] THEN [수행할 명령어];
ELSE [수행할 명령어];
END IF;
*/
-- 예제: 직원 급여에 따른 보너스 지급(급여가 5000보다 크면 보너스 1000 지급, 그렇지 않으면 500을 지급)
DECLARE
    V_SAL NUMBER := 4000;
    V_BONUS NUMBER;
BEGIN
    IF V_SAL > 5000 THEN
        V_BONUS := 1000;
        DBMS_OUTPUT.PUT_LINE('보너스 : ' || V_BONUS);
    ELSE
        V_BONUS := 500;
        DBMS_OUTPUT.PUT_LINE('보너스 : ' || V_BONUS);
    END IF;
END;
/

-- IF ~ THEN ~ ELSIF
/*
IF [조건식] THEN [수행할 명령어];
ELSIF [조건식] THEN
    [수행할 명령어];
ELSIF [조건식] THEN
    [수행할 명령어];
...
ELSE
    [수행할 명령어];
END IF;
*/
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    IF V_SCORE >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A학점');
    ELSIF V_SCORE >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('B학점');
    ELSIF V_SCORE >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('C학점');
    ELSIF V_SCORE >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('D학점');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F학점');
    END IF;
END;
/

-- CASE
/*
CASE [비교 기준]
    WHEN [값1] THEN
        [수행할 명령어];
    WHEN [값2] THEN
        [수행할 명령어];
    ...
    ELSE
        [수행할 명령어];
END CASE;
*/
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    CASE TRUNC(V_SCORE/10)
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A학점');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A학점');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B학점');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C학점');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('D학점');
        ELSE DBMS_OUTPUT.PUT_LINE('F학점');
    END CASE;
END;
/

-- 반복문
-- LOOP: 기본 반복문
/*
LOOP
    [반복 수행 작업];
END LOOP;
*/

-- WHILE LOOP: 특정 조건식의 결과를 통해 반복 수행
    -- WHILE의 조건이 TRUE면 조건 반복, FALSE면 반복 종료
/*
WHILE [조건식] LOOP
    [반복 수행 작업];
END LOOP;
*/
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    WHILE V_NUM < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
        V_NUM := V_NUM + 1;
    END LOOP;
END;
/

-- FOR LOOP: 반복 횟수를 정하여 반복 수행
/*
FOR [변수] IN [시작값]..[종료값] LOOP
    [반복 수행 작업];
END LOOP;
*/
BEGIN
    FOR i IN 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
    END LOOP;
END;
/
-- 같은 반복문 역순으로 출력하기
BEGIN
    FOR i IN REVERSE 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
    END LOOP;
END;
/
-- 같은 반복문 중 짝수만 출력하기
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i, 2) = 1;
        DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
    END LOOP;
END;
/

-- CURSOR FOR LOOP: 커서를 활용한 반복 수행

-- EXIT: 수행중인 반복 종료
-- EXIT WHEN: 반복 종료를 위한 조건식을 지정하고 만족하면 반복 종료
-- CONTINUE: 수행중인 반복의 현재 주기를 건너뜀
-- CONTINUE WHEN: 특정 조건식을 지정하고 조건식을 만족하면 현재 반복 주기를 건너뜀
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
        V_NUM := V_NUM + 1;
        EXIT WHEN V_NUM > 4;
    END LOOP;
END;
/
-- EXIT WHEN을 사용하지 않는 경우
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
        V_NUM := V_NUM + 1;
        IF V_NUM > 4 THEN
            EXIT;
        END IF;
    END LOOP;
END;
/


-- 0814
-- 레코드, 컬렉션
-- 레코드: 자료형이 각기 다른 데이터를 하나의 변수에 저장하는데 사용한다.
/*
TYPE [레코드 이름] IS RECORD (
    [변수이름] [자료형] [NOT NULL] :=(또는 DEFAULT) 값 또는 도출되는 여러 표현식
)
*/

SET SERVEROUTPUT ON;

DECLARE
    TYPE REC_DEPT IS RECORD (
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_DEPT; -- 클래스 선언하는거랑 비슷함(Person p = new Person();)
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
-- 테이블에 대입
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
-- 테이블 데이터 업데이트(수정)
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

-- 컬렉션: 특정 자료형의 데이터를 여러개 저장하는 복합 자료형
-- 레코드 >> 여러 종류의 데이터를 하나로 묶어 사용하는 것
-- 컬렉션 >> 열 또는 테이블과 같은 형태로 사용하는 것
-- 연관배열: 인덱스라고도 불리는 키(key), 값(value)으로 구성되는 컬렉션. 중복되지 않은 유일한 키를 통해 값을 저장하고 불러온다.
/*
TYPE [연관배열이름] IS TABLE OF [자료형] [NOT NULL]
    INDEX BY [인덱스형];
*/

-- PLS_INTEGER : PL/SQL에서 사용되는 데이터 타입 중 하나. 정수를 저장하기 위해 사용. NUMBER 데이터 타입의 하위 집합.
-- BINATY_INTEGER : PL/SQL에서 사용되는 또 다른 정수 데이터 타입

-- 컬렉션 메서드: 오라클에서 컬렉션 사용 상 편의를 위한 메서드
-- EXISTS(n): 컬렉션에서 n 인덱스의 데이터 존재여부를 TRUE/FALSE로 반환
-- COUNT: 컬렉션에 포함되어 있는 요소 개수를 반환
-- LIMIT: 현재 컬렉션의 최대 크기를 반환 / 최대 크기가 없으면 NULL 반환
-- FIRST: 컬렉션의 첫번째 인덱스 번호 반환
-- LAST: 컬렉션의 마지막 인덱스 번호 반환
-- PRIOR(n): 컬렉션에서 n인덱스 바로 앞 인덱스 값 반환. 대상 인덱스 값이 존재하지 않으면 NULL 반환
-- NEXT(n): 컬렉션에서 N인덱스 바로 다음 인덱스 값 반환. 대상 인덱스 값이 존재하지 않으면 NULL 반환
-- DELETE: 컬렉션에 저장된 요소를 삭제한다.
        -- DELETE: 컬렉션에 저장된 모든 데이터 삭제
        -- DELETE(n): n인덱스의 컬렉션 요소 삭제
        -- DELETE(n, m): n인덱스부터 m인덱스까지 요소 삭제
-- EXTEND: 컬렉션의 크기 증가
-- TRIM: 컬렉션의 크기 감소
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

-- 중첩테이블
-- varray


-- 커서: SELECT문 또는 데이터 조작어 같은 SQL문을 실행했을 때 해당 SQL문을 처리하는 정보를 저장한 메모리 공간을 뜻한다.(C언어 포인터 같은 개념)
    -- 커서는 명시적 커서와 묵시적 커서로 나뉜다.
-- 명시적 커서: 사용자가 직접 커서를 선언하고 사용하는 걸 뜻한다.
/*
명시적 커서 4단계
1단계: 커서 선언 - 사용자가 직접 이름을 지정해서 사용할 커서를 SQL문과 함께 선언한다.
2단계: 커서 열기 - 커서를 선언할 때 작성한 SQL문을 실행한다. 이때 실행한 SQL문에 영향을 받는 행을 ACTIVE SET라고 한다.
3단계: 커서에서 읽어온 데이터 사용 - 실행된 SQL문의 결과 행 정보를 하나씩 읽어와서 변수에 저장하고 필요한 작업을 수행.
            대체로 LOOP문을 함께 쓴다.
4단계: 커서 닫기 - 모든 행의 사용이 끝나고 커서를 종료한다.
*/

/*
명시적 커서 작성법
DECLARE
    CURSOR [커서 이름] IS [SQL문]; -- 커서 선언
BEGIN
    OPEN [커서 이름]; -- 커서 열기
    FETCH [커서 이름 INTO 변수]; -- 커서에서 읽어온 데이터 사용(FETCH)
    CLOSE [커서 이름]; -- 커서 닫기
END;
/
*/

-- 단일행일때 사용법
DECLARE
    -- 커서 데이터를 입력할 변수 선언
    V_DEPT_ROW DEPT%ROWTYPE;
    -- 명시적 커서 선언
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
            FROM DEPT
        WHERE DEPTNO = 40;
BEGIN
    -- 커서 열기
    OPEN c1;
    -- 커서로부터 읽어온 데이터 사용(FETCH)
    FETCH c1 INTO V_DEPT_ROW;
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
    -- 커서 닫기
    CLOSE c1;
END;
/

-- 여러행이 조회될 때 LOOP문
DECLARE
    -- 커서 데이터를 입력할 변수 선언
    V_DEPT_ROW DEPT%ROWTYPE;
    -- 명시적 커서 선언
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC FROM DEPT;
BEGIN
    -- 커서 열기
    OPEN c1;
    LOOP
        -- 커서로부터 읽어온 데이터 사용(FETCH : 가지고 오다)
        FETCH c1 INTO V_DEPT_ROW;
        -- 커서의 모든 행을 읽어오기 위해 %NOTFOUND 속성을 지정한다.
        -- %NOTFOUND: 실행된 FETCH문에서 행을 추출했으면 FALSE, 추출하지 않았으면 TRUE 반환
        EXIT WHEN c1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(
            'DEPTNO : ' || V_DEPT_ROW.DEPTNO || ', DNAME : ' || V_DEPT_ROW.DNAME || ', LOC : ' || V_DEPT_ROW.LOC
        );
    END LOOP;
    -- 커서 닫기
    CLOSE c1;
END;
/
-- 커서이름%NOTFOUND: 수행된 FETCH문에서 추출된 행이 있으면 FALSE, 없으면 TRUE 반환
-- 커서이름%FOUND: 수행된 FETCH문에서 추출된 행이 있으면 TRUE, 없으면 FALSE 반환
-- 커서이름%ROWCOUNT: 현재까지 추출된 행 수를 반환
-- 커서이름%ISOPEN: 커서가 OPEN 상태면 TRUE, CLOSE 상태면 FALSE

-- FOR LOOP
/*
FOR [루프 인덱스 이름] IN [커서 이름] LOOP
    [반복한 연산 작업];
END LOOP;
*/
DECLARE
    -- 명시적 커서 선언
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC FROM DEPT;
BEGIN
    -- 커서 FOR LOOP 시작(자동 OPEN, FETCH, CLOSE)
    FOR c1_rec IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE(
            'DEPTNO : ' || c1_rec.DEPTNO || ', DNAME : ' || c1_rec.DNAME || ', LOC : ' || c1_rec.LOC
        );
    END LOOP;
END;
/

-- CURSOR [커서 이름](파라미터 이름 자료형) IS SELECT ...
DECLARE
    -- 커서 데이터를 입력할 변수 선언
    V_DEPT_ROW DEPT%ROWTYPE;
    -- 명시적 커서 선언
    CURSOR c1(p_deptno DEPT.DEPTNO%TYPE) IS
        SELECT DEPTNO, DNAME, LOC FROM DEPT
            WHERE DEPTNO = p_deptno;
BEGIN
    -- 커서 열기: 10번 부서 처리
    OPEN c1 (10);
    LOOP
        -- 커서로부터 읽어온 데이터 사용
        FETCH c1 INTO V_DEPT_ROW;
        -- 커서의 모든 행을 읽어오기 위해 %NOTFOUND 속성을 지정한다.
        -- %NOTFOUND: 실행된 FETCH문에서 행을 추출했으면 FALSE, 추출하지 않았으면 TRUE 반환
        EXIT WHEN c1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(
            '10번 부서 - DEPTNO : ' || V_DEPT_ROW.DEPTNO || ', DNAME : ' || V_DEPT_ROW.DNAME || ', LOC : ' || V_DEPT_ROW.LOC
        );
    END LOOP;
    -- 커서 닫기
    CLOSE c1;
    -- 커서 열기: 20번 부서 처리
    OPEN c1 (20);
    LOOP
        -- 커서로부터 읽어온 데이터 사용
        FETCH c1 INTO V_DEPT_ROW;
        -- 커서의 모든 행을 읽어오기 위해 %NOTFOUND 속성을 지정한다.
        -- %NOTFOUND: 실행된 FETCH문에서 행을 추출했으면 FALSE, 추출하지 않았으면 TRUE 반환
        EXIT WHEN c1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(
            '20번 부서 - DEPTNO : ' || V_DEPT_ROW.DEPTNO || ', DNAME : ' || V_DEPT_ROW.DNAME || ', LOC : ' || V_DEPT_ROW.LOC
        );
    END LOOP;
    -- 커서 닫기
    CLOSE c1;
END;
/

-- 숫자를 직접 입력해서 출력하기
DECLARE
    -- 커서 데이터를 입력할 변수 선언
    V_DEPTNO DEPT.DEPTNO%TYPE;
    -- 명시적 커서 선언
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

-- 묵시적 커서: 별도의 선언 없이 SQL문을 사용했을 때 오라클에서 자동으로 선언되는 커서
-- SQL%NOTFOUND: 추출한 행이 있으면 FALSE, 없으면 TRUE
-- SQL%FOUND: 추출한 행이 있으면 TRUE, 없으면 FALSE
-- SQL%ROWCOUNT: 묵시적 커서에서 현재까지 추출한 행의 수. 또는 DML 명렁어로 영향 받는 행의 수
-- SQL%ISOPEN: 묵시적 커서는 자동으로 SQL문을 실행한 후 CLOSE되므로 이 속성을 항상 FALSE를 반환
BEGIN
    UPDATE DEPT SET DNAME = 'DATABASE'
        WHERE DEPTNO = 40;
    DBMS_OUTPUT.PUT_LINE('갱신된 행의 개수 : ' || SQL%ROWCOUNT);
    IF (SQL%FOUND) THEN
        DBMS_OUTPUT.PUT_LINE('갱신된 행 존재 여부 : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('갱신된 행 존재 여부 : FALSE');
    END IF;
    IF (SQL%ISOPEN) THEN
        DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : FALSE');
    END IF;
END;
/

-- 예외처리(오류)
-- 예외가 발생하면 그 이후 입력한 코드는 실행되지 않는다.
DECLARE
    -- 오류를 위해 VARCHAR2 대신 NUMBER로 자료형 입력
    V_DNAME NUMBER;
    -- [사용자 예외 이름] EXCEPTION;
BEGIN
    -- IF [예외 발생 조건] THEN
        -- RAISE [사용자 예외 이름];
    SELECT DNAME INTO V_DNAME
        FROM DEPT
    WHERE DEPTNO = 10;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리: 수치 또는 값 오류 발생');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('요구보다 많은 행 추출 오류');
    -- WHEN [사용자 예외 이름] THEN ...;
    -- WHEN OTHERS THEN
        -- ...... ;
END;
/
-- ACCESS_INTO_NULL: 초기화되지 않는 객체 속성 값 할당
-- CASE_NOT_FOUND: CASE문의 WHERE절에 조건이 없고 ELSE절도 없는 경우
-- CURSOR_ALREADY_OPEN: 이미 OPEN된 커서를 또 OPEN 시도할 경우
-- DUP_VAL_ON_INDEX: UNIQUE 인텍스가 있는 열에 중복된 값을 저장할 경우
-- INVALID_CURSOR: OPEN되지 않은 커서를 CLOSE할 경우를 포함한 잘못된 CURSOR 작업을 할 경우
-- INVALID_NUMBER: 문자에서 숫자로 변환이 실패할 경우
-- NO_DATA_FOUND: SELECT INTO문에서 결과 행이 없을 경우
-- PROGRAM_ERROR: PL/SQL 내부 오류 발생 시 출력되는 에러
-- ROWTYPE_MISMATCH: 호스트 커서 변수와 PL/SQL 커서 변수의 자료형이 호환되지 않을 경우
-- SELF_IS_NULL: 초기화되지 않은 오브젝트의 MEMBER 메서드를 호출할 경우
-- STORAGE_ERROR: PL/SQL 메모리 부족
-- SYS_INVALID_ROWID: 문자열을 ROWID로 변환할 때 값이 적절하지 않은 경우
-- TIMEOUT_ON_RESOURCE: 자원 대기 시간 초과
-- TOO_MANY_ROWS: SELECT INTO문의 결과 행이 여러개일 때 발생
-- VALUE_ERROR: 산술, 변환, 잘림, 제약 조건 오류가 발생했을 경우
-- ZERO_DIVIDE: 숫자 데이터를 0으로 나누려고 할 경우

DECLARE
    -- 오류를 위해 VARCHAR2 대신 NUMBER로 자료형 입력
    V_DNAME NUMBER;
BEGIN
    SELECT DNAME INTO V_DNAME
        FROM DEPT
    WHERE DEPTNO = 10;
EXCEPTION
    -- 오류 코드와 메시지를 직접 가져와서 출력
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
        DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;
/


-- 저장 서브프로그램 >> 메모리 성능, 재사용성의 장점이 있다(프로시저, 함수 위주로 사용)
-- 저장 프로시저(STORED PROCEDURE): 일반적으로 특정 처리 작업 수행을 위한 서브프로그램으로 SQL문에서는 사용 불가
-- 저장 함수(STORED FUNCTION): 일반적으로 특정 연산을 거친 결과 값을 반환하는 서브 프로그램. SQL문에서 사용 가능
-- 패키지(PACKAGE): 저장 서브프로그램을 그룹화하는데 사용
-- 트리거(TRIGGER): 특정 상황(이벤트)이 발생할 때 자동으로 연달아 수행할 기능을 구현하는데 사용

-- 프로시저 >> 파라미터가 있을수도 있고 없을수도 있다.
/*
CREATE(또는 REPLACE) PROCEDURE [프로시저명]
IS(또는 AS)
    선언부
BEGIN
    실행부
EXCEPTION (생략가능)
    예외 처리부
END [프로시저이름]; -- END; >> 프로시저이름 생략 가능
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

-- 실행
/*
EXECUTE [프로시저명];
*/
EXECUTE PRO_NOPARAM;
-- EXCUTE와 동일
BEGIN
    PRO_NOPARAM;
END;
/
-- 프로시저 삭제
DROP PROCEDURE PRO_NOPARAM;

/*
CREATE(또는 REPLACE) PROCEDURE [프로시저명]
(
([파라미터 이름1] [MODES] 자료형 := 기본값, ... ,
[파라미터 이름n] [MODES] 자료형
)
IS(또는 AS)
    선언부
BEGIN
    실행부
EXCEPTION (생략가능)
    예외 처리부
END [프로시저이름]; -- END; >> 프로시저이름 생략 가능
/
*/

-- IN, OUT, IN OUT
-- IN: 프로시저 호출 시 값을 입력받는다.(생략 가능)
-- OUT: 호출할 때 값을 반환
-- IN OUT: 호출할 때 값을 입력받고 실행 결과를 반환

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

-- 함수
-- 실행: 프로시저는 EXECUTE 또는 다른 PL/SQL 내에서 호출. 함수는 SQL문에서 직접 실행 가능, PL/SQL내에서 직접 사용 가능
-- 파라미터: 프로시저는 파라미터(옵션), IN, OUT, IN OUT 모드 정의 필요. 함수는 파라미터(옵션), IN만 사용 가능
-- 값의 반환: 프로시저는 반환이 있을 수도, 없을 수도 있다. 또는 값을 여러 개 반환할 수 있다. 함수는 RETURN문을 통해 반환한다.
/*
CREATE OR REPLACE FUNCTION [함수 이름]
[(파라미터 이름1 IN 자료형1,
... ,
파라미터 이름n IN 자료형n
)]
RETURN [자료형]
IS 또는 AS
    선언부
BEGIN
    실행부
    RETURN (반환값);
EXCEPTION
    예외 처리부
END [함수이름]; -- END;로 생략 가능
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

-- EMP 테이블에서 세금 공제 후 출력(EMPNO, ENAME, SAL, AFTERTAX)
SELECT
    EMPNO, ENAME, SAL, fn_aftertax(SAL) AS AFTERTAX
FROM EMP;
-- 함수 삭제
DROP FUNCTION fn_aftertax;


-- 패키지: 업무, 기능면에서 연관성이 높은 프로시저, 함수 등 여러개의 PL/SQL 서브프로그램을 하나의 논리 그룹으로 묶어서 통합 관리하는데 사용하는 객체
-- 장점: 모듈성, 쉬운 응용 프로그램 설계, 정보 은닉, 기능성 향상, 성능 향상

-- 패키지는 생성 시 명세, 본문으로 구분되어 작성한다.
/*
패키지 명세
CREATE OR REPLACE PACKAGE [패키지명]
IS 또는 AS
    서브프로그램을 이용한 다양한 객체 선언
END [패키지 이름]; -- END;로 생략 가능
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
패키지 본문
CREATE OR REPLACE PACKAGE BODY [패키지 이름]
IS 또는 AS
    패키지 명세에서 선언한 서브프로그램을 포함한 여러 객체를 정의.
    패키지 명세에 존재하지 않는 객체 및 서브프로그램도 정의 가능
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

-- 서브프로그램 오버로드
/*
CREATE OR REPLACE PACKAGE [패키지 이름]
IS 또는 AS
    서브프로그램 종류 서브프로그램 이름 (파라미터 정의);
    서브프로그램 종류 서브프로그램 이름 (개수나 자료형, 순서가 다른 파라미터 정의);
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

-- 패키지 명세와 본문 모두 삭제
-- DROP PACKAGE [패키지 이름]

-- 패키지의 본문만 삭제
-- DROP PACKAGE BODY [패키지 이름]


-- 트리거: 데이터베이스 안에 특정 상황이나 동작(=이벤트)이 발생할 때 자동으로 실행되는 기능
-- DML 트리거: INSERT, UPDATE, DELETE
-- DDL 트리거: CREATE, ALTER, DROP
-- INSTEAD OF 트리거: 뷰(VIEW)에 사용하는 DML 명령어를 기점으로 동작
-- 시스템 트리거: 데이터베이스나 스키마 이벤트로 동작
-- 단순 트리거: 트리거를 작동시킬 문장이 실행되기 전, 실행된 후, 트리거를 작동시킬 문장이 행에 영향을 미치기 전, 트리서를 작동시킬 문장이 행에 영향을 준 후
-- 복합 트리거: 단순 트리거의 여러 시점에 동작
/*
CREATE OR REPLACE TRIGGER [트리거 이름]
BEFORE 또는 AFTER -- 트리거 작동 시점
INSERT 또는 UPDATE 또는 DELETE ON [테이블 이름]
REFERENCING OLD as old 또는 New as new -- DML로 변경되는 행의 변경 전 값과 변경 후의 값을 참조하는 용도로 사용(생략 가능)
FOR EACH ROW WHEN [조건식] -- DML 문장에 한번만 실행할 지, DML 문장에 영향받는 행 별로 실행할 지 지정
FOLLOWS [트리거 이름1], [트리거 이름2], ... -- 트리거 실행 순서
ENABLE 또는 DISABLE -- 트리거의 활성화, 비활성화
DECLARE
    선언부
BEGIN
    실행부
EXCEPTION
    예외 처리부
END;
/
*/

-- BEFORE
CREATE TABLE EMP_TRG AS SELECT * FROM EMP;

CREATE OR REPLACE TRIGGER trg_emp_nodml_weekend
BEFORE
    INSERT OR UPDATE OR DELETE ON EMP_TRG
BEGIN
    IF TO_CHAR(SYSDATE, 'DY') IN ('토', '일') THEN
        IF INSERTING THEN
            raise_application_error(-20000, '주말 사원 정보 추가 불가');
        ELSIF UPDATING THEN
            raise_application_error(-20001, '주말 사원 정보 수정 불가');
        ELSIF DELETING THEN
            raise_application_error(-20002, '주말 사원 정보 삭제 불가');
        ELSE
            raise_application_error(-20009, '주말 사원 정보 변경 불가');
        END IF;
    END IF;
END;
/

UPDATE emp_trg SET sal = 3500 WHERE EMPNO = 7365;

-- 데이터 사전
-- 인덱스
-- 뷰
-- 동의어


