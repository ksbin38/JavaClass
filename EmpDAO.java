package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

import vo.EmpVO;

public class EmpDAO {
	
	// DB 연결을 위한 초기 변수
	Connection conn = null;
	// 쿼리 실행을 위한 변수
	PreparedStatement stmt;
	// JDBC 드라이버 및 접속 경로
	final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	// JDBC (Java Database Connectivity)
	// JDBC를 사용해서 데이터베이스 연결한다.
	// JDBC API를 통해서 데이터베이스와 연결할 수 있도록 해주는 프로토콜을 의미한다.
	// oracle : 데이터베이스 벤더를 나타낸다.
	// thin : JDBC 드라이버 유형 'thin' 드라이버는 오라클의
	// 순수 자바드라이버
	// @ : 서버의 주소와 포트, 데이터베이스 식별자를 구분하는 기호
	// localhost : 데이터베이스가 있는곳의 주소 333.222.111.000
	// 1521 : 포트번호이고 오라클의 기본 포트 번호는 1521
	// xe : DB인스턴스 식별자이고 'xe' 오라클 Express Edition의 기본값
	final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	// DB 로그인 정보
	final String ID = "scott";
	final String PW = "tiger";
	
	// DB 접속
	private void open() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, ID, PW);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// DB 접속 종료
	private void close() {
		try {
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// EMP 목록 SELECT
	public List<EmpVO> selectEmpList() {
		open();

		// 반환할 데이터
		List<EmpVO> resultList = new ArrayList();
		
		try {
			// 실행할 쿼리문 작성
			String sql = "SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, ROW_NUMBER() OVER (ORDER BY EMPNO DESC) AS ID FROM EMP ORDER BY EMPNO ASC";
			stmt = conn.prepareStatement(sql);
			stmt.execute();
			// 쿼리 결과 반환
			ResultSet resultSet = stmt.executeQuery(sql);
			
			// 결과 출력
			while(resultSet.next()) {
				int id = resultSet.getInt("ID");
				int empNo = resultSet.getInt("EMPNO");
				String eName = resultSet.getString("ENAME");
				String job = resultSet.getString("JOB");
				int mgr = resultSet.getInt("MGR");
				Date hireDate = resultSet.getDate("HIREDATE");
				int sal = resultSet.getInt("SAL");
				int comm = resultSet.getInt("COMM");
				int deptNo = resultSet.getInt("DEPTNO");
				
				EmpVO empVO = new EmpVO();
				empVO.setId(id);
				empVO.setEmpNo(empNo);
				empVO.seteName(eName);
				empVO.setJob(job);
				empVO.setMgr(mgr);
				empVO.setHireDate(hireDate);
				empVO.setSal(sal);
				empVO.setComm(comm);
				empVO.setDeptNo(deptNo);
				
				resultList.add(empVO);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return resultList;
	}
	
	// EMP 1행만 SELECT
	public EmpVO selectEmp(int empNo) {
		open();

		EmpVO empVO = new EmpVO();
		
		try {
			// 실행할 쿼리문 작성
			String sql = "SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, ROW_NUMBER() OVER (ORDER BY EMPNO DESC) AS ID FROM EMP ORDER BY EMPNO ASC";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, empNo);
			// 쿼리 결과 반환
			ResultSet resultSet = stmt.executeQuery(sql);
			
			// 결과 출력
			while(resultSet.next()) {
				String eName = resultSet.getString("ENAME");
				String job = resultSet.getString("JOB");
				int mgr = resultSet.getInt("MGR");
				Date hireDate = resultSet.getDate("HIREDATE");
				int sal = resultSet.getInt("SAL");
				int comm = resultSet.getInt("COMM");
				int deptNo = resultSet.getInt("DEPTNO");
				
				
				empVO.setEmpNo(empNo);
				empVO.seteName(eName);
				empVO.setJob(job);
				empVO.setMgr(mgr);
				empVO.setHireDate(hireDate);
				empVO.setSal(sal);
				empVO.setComm(comm);
				empVO.setDeptNo(deptNo);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return empVO;
	}
	
	// EMP 1행만 UPDATE
	public void updateEmp() {}
	
	// EMP 1행만 DELETE
	public void deleteEmp(int empNo) {
		// EMPNO를 파라미터로 받아서
		// DELETE문의 WHERE 절에 적용 후 실행한다.
		open();
		try {
			String sql = "DELETE FROM EMP WHERE EMPNO = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, empNo);
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
		} finally {
			close();
		}
	}
	
	// EMP 1행만 INSERT
	public void insertEmp(EmpVO empVO) {
		open();
		
		try {
			String sql = "INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (?, ?, ?, ?, SYSDATE, ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, empVO.getEmpNo());
			stmt.setString(2, empVO.geteName());
			stmt.setString(3, empVO.getJob());
			stmt.setInt(4, empVO.getMgr());
			stmt.setInt(5, empVO.getSal());
			stmt.setInt(6, empVO.getComm());
			stmt.setInt(7, empVO.getDeptNo());
			
			// 자료 넣기
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
}
