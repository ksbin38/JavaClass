package service;

import java.util.List;
import java.util.Optional;

import vo.Users;

public interface UserService {

	// User 목록
	public List<Users> userList();
	
	// User 목록 생성
	public void makeUserList();
	
	// 로그인 처리
	public Optional<Users> login(String userID, String userPW);
	
}
