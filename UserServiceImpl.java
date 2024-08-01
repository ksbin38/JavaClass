package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import vo.Users;

public class UserServiceImpl implements UserService {
	
	private List<Users> userList = new ArrayList<Users>();

	@Override
	public List<Users> userList() {
		return this.userList;
	}

	@Override
	public void makeUserList() {
		// Users 정보 10개 생성
        userList.add(new Users(1, "admin", "admin"));
        userList.add(new Users(2, "sys", "sys"));
        userList.add(new Users(3, "abcd", "abcd"));
        userList.add(new Users(4, "zxcv", "zxcv"));
        userList.add(new Users(5, "qwer", "qwer"));
        userList.add(new Users(6, "kkii", "kkii"));
        userList.add(new Users(7, "rttt", "rttt"));
        userList.add(new Users(8, "zxcv", "zxcv"));
        userList.add(new Users(9, "mmmm", "mmmm"));
        userList.add(new Users(10, "nnnn", "nnnn"));
	}

	@Override
	public Optional<Users> login(String userID, String userPW) {
		for (int i = 0; i < userList.size(); i++) {
			if (
				userID.equals(userList.get(i).getUserID()) && userPW.equals(userList.get(i).getUserPW())
				) {
				return Optional.of(userList.get(i));
			}	
		}
		return Optional.empty();
	}

}
