package controller;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserServiceImpl;
import vo.Users;

/**
 * Servlet implementation class Login
 */
@WebServlet(description = "로그인 처리", urlPatterns = { "/Login" })
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UserServiceImpl userService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        this.userService = new UserServiceImpl();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.sendRedirect("/login.jsp");
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		// 사용자 목록 생성
		userService.makeUserList();
		// 계정 찾기
		Optional<Users> result = userService.login(userID, userPW);
		if(result.isPresent()) {
			// 세션 생성
			HttpSession session = request.getSession();
			session.setAttribute("userID", userID);
			response.sendRedirect("/index.jsp");
		} else {
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

}
