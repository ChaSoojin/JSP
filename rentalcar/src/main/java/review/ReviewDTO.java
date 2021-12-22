package review;

import java.sql.Timestamp;

//review_seq id(FK) title content enrolldate
public class ReviewDTO {
	private int no, likes;
	private String id, title, content;
	private Timestamp enrolldate;
	
	public ReviewDTO(int no, String id, String title, String content, int likes, Timestamp enrolldate) {
		this.no = no;
		this.id = id;
		this.title = title;
		this.content = content;
		this.likes = likes;
		this.enrolldate = enrolldate;
	}

	public ReviewDTO(String id, String title, String content) {
		this.id = id;
		this.title = title;
		this.content = content;
	}
	
	public int getNo() {
		return no;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getId() {
		return id;
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

	public Timestamp getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Timestamp enrolldate) {
		this.enrolldate = enrolldate;
	}
}
