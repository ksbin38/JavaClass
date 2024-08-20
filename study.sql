-- 0820
-- SQL Injection
-- sql injection 공격은 데이터베이스의 무단 접근, 데이터 손상, 데이터 유출 등

-- 데이터 사전
-- 오라클에서 데이터베이스 테이블은 사용자 테이블, 데이터사전 2개로 나뉨
-- 데이터 사전: 데이터베이스를 구성하고 운영하는데 필요한 모든 정보를 저장하는 공간

-- 접두어
-- USER_XXXXX: 현재 DB에 접속한 사용자가 소유한 객체 정보
-- ALL_XXXX: 현재 DB에 접속한 사용자가 소유한 객체 또는 다른 사용자가 소유한 객체 중 사용 허가를 받은 객체
-- DBA_XXXX: DB 관리를 위한 정보(관리 권한 계정만 열람 가능) SYS또는 SYSTEM
-- VS_XXXXX: 

-- 사용 가능한 데이터 사전 목록
SELECT * FROM DICT; -- DICTIONARY

-- USER_XXX USER 접두어를 가진 데이터 사전
SELECT TABLE_NAME FROM USER_TABLES;

-- ALL_ 접두워를 가진 데이터 사전
SELECT * FROM ALL_TABLES;

-- index
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_IND_COLUMNS;

/*
CREATE INDEX [인덱스이름]
    ON [테이블이름] (열이름1 ASC 또는 DESC, 열이름n ASC 또는 DESC);
*/
-- EMP >>> SAL
CREATE INDEX IDX_EMP_SAL_AND_COMM
    ON EMP(SAL, COMM);
-- index 삭제
DROP INDEX IDX_EMP_SAL_AND_COMM;

-- 뷰(View)
-- 하나 이상의 테이블을 조회하는 SELECT문을 저장한 객체
-- SELECT문을 저장하기 때문에 물리적인 데이터를 저장하지 않는다.

SELECT * FROM
(
    SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP
        WHERE DEPTNO = 20
);

/*
CREATE[OR REPLACE] [FORCE | NOFORCE]
VIEW [뷰이름] (열이름1, ... , 열이름n) AS (저장할 SELECT문)
[WITH CHECK OPTION [CONSTRAINT 제약조건]]
[WITH READ ONLY [CONSTRAINT 제약조건]]
*/

CREATE VIEW VW_EMP20
    AS (
        SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP
            WHERE DEPTNO = 20
    );

SELECT * FROM VW_EMP20;

-- USERS 테이블 ---> 일반적인 회원가입 테이블
-- SOCIAL 테이블 ---> 소셜로 가입한 회원 테이블

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

-- 동의어(synonym)
-- 동의어는 테이블, 뷰, 시퀀스 등 객체 이름 대신 사용할 수 있는 다른 이름을 부여하는 객체
/*
CREATE [PUBLIC(선택사항)] SYNONYM [동의어 이름]
FOR [사용자.][객체이름];
*/

CREATE SYNONYM E
FOR EMP;

SELECT * FROM E;

DROP SYNONYM E;


