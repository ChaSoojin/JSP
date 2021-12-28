package model.dto;

import java.sql.Timestamp;

public class UserDTO {
	private String id, pw;
	private Timestamp regDate;
	
	public UserDTO(String id, String pw, Timestamp regDate) {
		this.id = id;
		this.pw = pw;
		this.regDate = regDate;
	}

	public UserDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	public String getId() {
		return id;
	}
	
	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public Timestamp getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return String.format("%s/%s/%s", id, pw, regDate);
	}
}
