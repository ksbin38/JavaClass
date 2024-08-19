package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmpDAO;
import vo.EmpVO;

@WebServlet("/empList")
public class EmpListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private EmpDAO empDao;
    
    public EmpListController() {
        super();
        empDao = new EmpDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 쿼리 결과
		List<EmpVO> resultList = empDao.selectEmpList();
		// jsp에 사용할 속성 지정
		request.setAttribute("list", resultList);
		// forward
		request.getRequestDispatcher("/empList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
