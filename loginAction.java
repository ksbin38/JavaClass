package week5Third;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Users;

/**
 * Servlet implementation class loginAction
 */
@WebServlet("/loginAction")
public class loginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private List<Users> userList = new ArrayList<>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginAction() {
        super();
        // Users 정보 10개 생성
        Users user = new Users();
        userList.add(new Users(1, "admin", "admin"));
        userList.add(new Users(2, "comput", "comput"));
        userList.add(new Users(3, "peter", "peter"));
        userList.add(new Users(4, "abcd", "abce"));
        userList.add(new Users(5, "student", "student"));
        userList.add(new Users(6, "backdev", "backdev"));
        userList.add(new Users(7, "vwxyz", "vwxyz"));
        userList.add(new Users(8, "kyle", "kyle"));
        userList.add(new Users(9, "wayne", "wayne"));
        userList.add(new Users(10, "edwin", "edwin"));
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		boolean isFound = false;
		
//		for(int i = 0; i < userList.size(); i++) {
//			if(userID.equals(userList.get(i).getUserID()) && userPW.equals(userList.get(i).getUserPW())) {
//				isFound = true;
//				break;
//			}
//		}
		for (Users user : userList) {
			if (userID.equals(user.getUserID()) && userPW.equals(user.getUserPW())) {
				isFound = true;
				break;
			}
		}
		
		if (isFound) {
			HttpSession session = request.getSession();
			session.setAttribute("userID", userID);
//			Cookie cookie = new Cookie("userID", userID);
//			cookie.setMaxAge(60 * 60);
//			response.addCookie(cookie);
			request.setAttribute("userList", userList);
		}
		
//		response.sendRedirect(isFound? "index.jsp": "loginError.jsp");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(isFound? "/index.jsp": "/loginError.jsp");
		dispatcher.forward(request, response);
	}

}
