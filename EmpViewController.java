package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmpDAO;
import vo.EmpVO;


@WebServlet(name = "empView", urlPatterns = { "/empView" })
public class EmpViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmpDAO empDAO;
    
    public EmpViewController() {
        super();
        this.empDAO = new EmpDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. empView 페이지에서 a 태그에 지정한 파라미터값 empNo를 받는다.
		int empNo = Integer.parseInt(request.getParameter("empNo"));
		// 2. 파라미터로 받은 empNo값을 데이터베이스에서 조회한다.
		EmpVO empVO = empDAO.selectEmp(empNo);
		System.out.println(empVO.toString());
		// 3. 조회한 데이터를 EmpVO 형으로 세팅한다.
		// 4. 세팅한 데이터를 empView에 setAttribute 메서드로 지정한다.
		request.setAttribute("data", empVO);
		// 5. 세팅한 데이터를 jsp 페이지 input 태그에 값을 출력한다.
		request.getRequestDispatcher("/empView.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
