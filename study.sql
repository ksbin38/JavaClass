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