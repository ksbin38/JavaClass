package service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import vo.Boards;

public class BoardServiceImpl implements BoardService {
	
	private List<Boards> boardList = new ArrayList<Boards>();

	@Override
	public List<Boards> boardList() {
		// TODO Auto-generated method stub
		return this.boardList;
	}

	@Override
	public void makeBoardList() {
		boardList.add(new Boards(1, "제목1", "내용1", LocalDateTime.now(), "admin"));
		boardList.add(new Boards(2, "제목2", "내용2", LocalDateTime.now(), "comput"));
		boardList.add(new Boards(3, "제목3", "내용3", LocalDateTime.now(), "peter"));
		boardList.add(new Boards(4, "제목4", "내용4", LocalDateTime.now(), "abcd"));
		boardList.add(new Boards(5, "제목5", "내용5", LocalDateTime.now(), "student"));
		boardList.add(new Boards(6, "제목6", "내용6", LocalDateTime.now(), "backdev"));
		boardList.add(new Boards(7, "제목7", "내용7", LocalDateTime.now(), "vwxyz"));
		boardList.add(new Boards(8, "제목8", "내용8", LocalDateTime.now(), "kyle"));
		boardList.add(new Boards(9, "제목9", "내용9", LocalDateTime.now(), "wayne"));
		boardList.add(new Boards(10, "제목10", "내용10", LocalDateTime.now(), "edwin"));
	}

}
