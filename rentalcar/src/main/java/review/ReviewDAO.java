package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import util.DBManager;

public class ReviewDAO {

	private ReviewDAO() {}
	
	private static ReviewDAO instance = new ReviewDAO();
	
	public static ReviewDAO getInstance() {
		return instance;
	}
	
	ArrayList<ReviewDTO> reviewlist = null;
	private int cnt = 0;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//리뷰게시판 전체목록 get
	public ArrayList<ReviewDTO> getreviewList() {
		
		try {
			conn = DBManager.getConnection();
			
			String str = "select * from review";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			reviewlist = new ArrayList<ReviewDTO>();
			
			//reviewSeq id title content likes enrollDate
			while(rs.next()) {
				int no = rs.getInt(1);
				String id = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				int likes = rs.getInt(5);
				Timestamp enrolldate = rs.getTimestamp(6);
				
				reviewlist.add(new ReviewDTO(no,id,title,content,likes,enrolldate));
				cnt++;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return reviewlist;
	}
	
	//상세보기
	public ReviewDTO getreviewView(int no) {
		ReviewDTO review = null;
		
		try {
			conn = DBManager.getConnection();
			
			String str = "select * from review where reviewSeq = '" + no + "'";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			//reviewSeq id title content likes enrollDate
			while(rs.next()) {
				String id = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				int likes = rs.getInt(5);
				Timestamp enrolldate = rs.getTimestamp(6);
				
				review = new ReviewDTO(no,id,title,content,likes,enrolldate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return review;
	}
	
	//게시판 글 추가
	public boolean addreview (ReviewDTO review) {
		try {						
			Calendar cd = Calendar.getInstance();
			long time = cd.getTimeInMillis();
			Timestamp enrollDate = new Timestamp(time);		

			conn = DBManager.getConnection();
			String str = "insert into review(id,title,content,enrollDate) values(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(str);
			
			pstmt.setString(1, review.getId());
			pstmt.setString(2, review.getTitle());
			pstmt.setString(3, review.getContent());
			pstmt.setTimestamp(4, enrollDate);
			
			pstmt.executeUpdate();
			
			//no id pw title content likes enrollDate
			//public ReviewDTO(int no, String id, String pw, String title, String content, int likes, Timestamp enrollDate)
			
			ReviewDTO newreview = new ReviewDTO(cnt,review.getId(), review.getTitle(), review.getContent(), 0, enrollDate);
			reviewlist.add(newreview);
			
			System.out.println("게시판 등록 성공");						
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("게시판 등록 실패");
		}
		return true;
	}
	
	//게시판 글 업데이트
	public boolean updatereview(int no, String title, String content) {
		Calendar cd = Calendar.getInstance();
		long time = cd.getTimeInMillis();
		Timestamp enrollDate = new Timestamp(time);
		
		try {
			conn = DBManager.getConnection();
			String str = "update review set title = ?, content = ? where reviewSeq = '" + no + "'";
			pstmt = conn.prepareStatement(str);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.executeUpdate();
			
			for(ReviewDTO review : reviewlist) {
				if(review.getNo() == no) {
					review.setTitle(title);
					review.setContent(content);
					review.setEnrolldate(enrollDate);
				}
			}
			System.out.println("업데이트 성공");
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("업데이트 실패");
		}
		
		return true;
	}
	
	
	//게시글 삭제
	public boolean deletereview(int no) {
		int delIdx = -1;
		
		try {
			conn = DBManager.getConnection();
			String str = "delete from review where reviewSeq = '" + no + "'";
			pstmt = conn.prepareStatement(str);
			pstmt.executeUpdate();
			
			for(int i = 0; i < reviewlist.size(); i++) {
				if(reviewlist.get(i).getNo() == no) {
					delIdx = i;
				}
			}
			
			reviewlist.remove(delIdx);
			System.out.println("게시글 삭제 성공");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("게시글 삭제 실패");			
		}
		
		return true;
	}
	
	//현재 로그인중인 아이디가 해당 게시글에 좋아요를 눌렀는지 체크 메소드
	public boolean getLike(int no, String id) {
		boolean chk = false;
		
		try {
			conn = DBManager.getConnection();
			String str = "select count(*) from review_like where reviewno = '" + no + "' and id = '" + id + "'";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			int cnt = 0;

			if(rs.next()) {
				cnt = rs.getInt(1);
				System.out.println("개수: " + cnt);
			}
			
			if(cnt > 0) chk = true;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("실패..");
		}
		
		return chk;
	}
	
	//좋아요 스왑
	public int likeSwap(int no, String log) {
		int chk = -1;
		
		try {
			conn = DBManager.getConnection();
			String sql = "";

			if(getLike(no,log)) {
				sql = "delete from review_like where reviewno = '" + no + "' and id = '" + log + "'";
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();	
				chk = 0;
				System.out.println("좋아요 취소");
			}
			else {
				sql = "insert into review_like(reviewno, id) values (?,?)";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, no);
				pstmt.setString(2, log);
				pstmt.executeUpdate();
				
				chk = 1;
				System.out.println("좋아요");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("좋아요 스왑 실패");
		}
		
		return chk;
	}
	
	//게시판 좋아요 수 업데이트
	public void updateLikes(int no, int chk) {
		try {
			conn = DBManager.getConnection();
			
			int idx = findIdx(no);
			int likes = findLikeCnt(no);
			System.out.println("[전]좋아요 개수: " + likes);
			
			//좋아요취소
			if(chk == 0) {
				likes--;
			}
			//좋아요
			else if(chk == 1) {
				likes++;
			}
			
			String sql = "update review set likes = ? where reviewSeq = '" + no + "'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, likes);								
			reviewlist.get(idx).setLikes(likes);
			pstmt.executeUpdate();
			
			System.out.println("[후]좋아요 개수: " + likes);
			System.out.println("좋아요 개수 업데이트 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("좋아요 개수 업데이트 실패");
		}
	}
	
	private int findLikeCnt(int no) {
		int idx = findIdx(no);
		int likes = -1;
		
		if(idx != -1) {
			likes = reviewlist.get(idx).getLikes();
			System.out.println("좋아요개수: " + likes);			
		}
		
		return likes;
	}
	
	private int findIdx(int no) {
		int idx = -1;
		reviewlist = getreviewList();
		
		for(int i = 0; i < reviewlist.size(); i++) {
			if(reviewlist.get(i).getNo() == no) {
				idx = i;
			}
		}
		
		return idx;
	}
}
