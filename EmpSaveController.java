package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmpDAO;
import vo.EmpVO;

@WebServlet(name = "empSave", urlPatterns = { "/empSave" })
public class EmpSaveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private EmpDAO empDao;
    
    public EmpSaveController() {
        super();
        this.empDao = new EmpDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get 방식 호출");
		request.getRequestDispatcher("/empSave.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post 방식 호출");
		
		int empNo = Integer.parseInt(request.getParameter("EMPNO"));
		String eName = request.getParameter("ENAME");
		String job = request.getParameter("JOB");
		int mgr = Integer.parseInt(request.getParameter("MGR"));
		int sal = Integer.parseInt(request.getParameter("SAL"));
		int comm = Integer.parseInt(request.getParameter("COMM"));
		int deptNo = Integer.parseInt(request.getParameter("DEPTNO"));
		
		EmpVO empVO = new EmpVO();
		empVO.setEmpNo(empNo);
		empVO.seteName(eName);
		empVO.setJob(job);
		empVO.setMgr(mgr);
		empVO.setSal(sal);
		empVO.setComm(comm);
		empVO.setDeptNo(deptNo);
		
		this.empDao.insertEmp(empVO);
		
		// 저장 후 흰화면대신 empSave화면으로 다시 이동한다.
		response.sendRedirect("/empSave");
	}

}
