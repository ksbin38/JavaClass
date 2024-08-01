package service;

import java.util.List;

import vo.Boards;

public interface BoardService {
	public List<Boards> boardList();
	public void makeBoardList();
}
