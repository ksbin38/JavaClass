package vo;

public class Users {
	private int idx;
	private String userID;
	private String userPW;
	
	public Users() {}
	
	public Users(int idx, String userID, String userPW) {
		this.idx = idx;
		this.userID = userID;
		this.userPW = userPW;
	}
	
	@Override
	public String toString() {
		return this.idx + " / " + this.userID + " / " + this.userPW;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserPW() {
		return userPW;
	}

	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}

	
}
