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
