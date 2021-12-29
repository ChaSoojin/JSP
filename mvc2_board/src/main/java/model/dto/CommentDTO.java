package model.dto;

import java.sql.Timestamp;

public class CommentDTO {
	//no(1) id(2) boardno(3) comment(4) likes(5) notlikes(6) regdate(7)
	private int no, originalno, boardno, likes, notlikes;
	private String id, comment;
	private Timestamp regdate;
	
	public CommentDTO(int no, int originalno, String id, int boardno, String comment, int likes, int notlikes, Timestamp regdate) {
		this.no = no;
		this.originalno = originalno;
		this.id = id;
		this.boardno = boardno;
		this.comment = comment;
		this.likes = likes;
		this.notlikes = notlikes;
		this.regdate = regdate;
	}

	public int getOriginalno() {
		return originalno;
	}
	
	public int getNo() {
		return no;
	}
	
	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getNotlikes() {
		return notlikes;
	}

	public void setNotlikes(int notlikes) {
		this.notlikes = notlikes;
	}

	public String getId() {
		return id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
}
