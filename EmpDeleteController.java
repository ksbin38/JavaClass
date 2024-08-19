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

/**
 * Servlet implementation class EmpDeleteController
 */
@WebServlet(name = "empDelete", urlPatterns = { "/empDelete" })
public class EmpDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmpDAO empDAO;
    
    public EmpDeleteController() {
        super();
        this.empDAO = new EmpDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<EmpVO> resultList = empDAO.selectEmpList();
		// jsp에 사용할 속성 지정
		request.setAttribute("list", resultList);
		request.getRequestDispatcher("/empDelete.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터로 삭제하고자 하는 조건 EMPNO를 받아서
		// empDAO의 deleteEmp의 파라미터로 전달한다.
//		int empNo = Integer.parseInt(request.getParameter("EMPNO"));
//		empDAO.deleteEmp(empNo);
		String[] empNoList = request.getParameterValues("EMPNO[]");
		for (String item : empNoList) {
			// empNoList가 String 타입알 int로 형변환
			int id = Integer.parseInt(item);
			empDAO.deleteEmp(id);
		}
		// 삭제 후 empDelete 페이지로 리다이렉트
		response.sendRedirect("/empDelete");
	}

}
