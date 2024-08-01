package vo;

import java.time.LocalDateTime;

public class Boards {
	private int idx;
	private String title;
	private String content;
	private LocalDateTime regDate;
	private String regUser;
	
	public Boards(int idx, String title, String content, LocalDateTime regDate, String regUser) {
		super();
		this.idx = idx;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.regUser = regUser;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	public String getRegUser() {
		return regUser;
	}
	public void setRegUser(String regUser) {
		this.regUser = regUser;
	}
	@Override
	public String toString() {
		return "Boards [idx=" + idx + ", title=" + title + ", content=" + content + ", regDate=" + regDate
				+ ", regUser=" + regUser + ", toString()=" + super.toString() + "]";
	}
	
}
