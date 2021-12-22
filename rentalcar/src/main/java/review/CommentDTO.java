package review;

import java.sql.Timestamp;

public class CommentDTO {
	//no(1) id(2) reviewno(3) comment(4) likes(5) notlikes(6) regdate(7)
	private int no, originalno, reviewno, likes, notlikes;
	private String id, comment;
	private Timestamp regdate;
	
	public CommentDTO(int no, int originalno, String id, int reviewno, String comment, int likes, int notlikes, Timestamp regdate) {
		this.no = no;
		this.originalno = originalno;
		this.id = id;
		this.reviewno = reviewno;
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
	
	public int getReviewno() {
		return reviewno;
	}

	public void setReviewno(int reviewno) {
		this.reviewno = reviewno;
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
