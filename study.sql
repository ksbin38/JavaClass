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

