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