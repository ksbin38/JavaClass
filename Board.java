package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardServiceImpl;
import vo.Boards;

/**
 * Servlet implementation class Board
 */
@WebServlet(description = "게시판", urlPatterns = { "/boardList" })
public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final BoardServiceImpl boardService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Board() {
        super();
        this.boardService = new BoardServiceImpl();
        boardService.makeBoardList();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Boards> result = boardService.boardList();
		System.out.println(result.size());
		request.setAttribute("boardList", result);
		request.getRequestDispatcher("/boardList.jsp").forward(request, response);
	}

}
