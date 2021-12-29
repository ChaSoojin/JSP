package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import model.dto.CommentDTO;
import util.DBManager;

public class CommentDAO {

	private CommentDAO() {
	}

	private static CommentDAO instance = new CommentDAO();

	public static CommentDAO getInstance() {
		return instance;
	}

	ArrayList<CommentDTO> comments = null;

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 댓글 추가
	public boolean addComment(String id, int no, String comment) {
		try {
			Calendar cd = Calendar.getInstance();
			long time = cd.getTimeInMillis();
			Timestamp regDate = new Timestamp(time);

			conn = DBManager.getConnection();
			String str = "insert into board_comment(id,boardno,comment,regdate) values(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(str);

			pstmt.setString(1, id);
			pstmt.setInt(2, no);
			pstmt.setString(3, comment);
			pstmt.setTimestamp(4, regDate);

			pstmt.executeUpdate();

			System.out.println("댓글 등록 성공");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("댓글 등록 실패");
		}
		return true;
	}

	// 댓글 가져오기
	public ArrayList<CommentDTO> getComments(int no) {
		try {
			conn = DBManager.getConnection();
			String str = "select * from board_comment where boardno = '" + no + "'";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();

			comments = new ArrayList<CommentDTO>();
			int cnt = 0;

			// no(1) id(2) boardno(3) comment(4) likes(5) notlikes(6) regdate(7)
			while (rs.next()) {
				cnt++;
				int originalno = rs.getInt(1);
				String id = rs.getString(2);
				int boardno = rs.getInt(3);
				String comment = rs.getString(4);
				int likes = rs.getInt(5);
				int notlikes = rs.getInt(6);
				Timestamp regDate = rs.getTimestamp(7);

				comments.add(new CommentDTO(cnt, originalno, id, boardno, comment, likes, notlikes, regDate));
			}
			
			for(CommentDTO co : comments) {
				System.out.println("코멘트: " + co.getComment());
				
			}
			System.out.println("댓글 등록 성공");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("댓글 등록 실패");
		}
		return comments;
	}
	
	//댓글삭제
	public boolean deleteComment(int no, int originalno) {
		int delIdx = -1;
		comments = getComments(no);
		
		try {
			conn = DBManager.getConnection();
			String str = "delete from board_comment where no = '" + originalno + "' and boardno = '" + no +"'";
			pstmt = conn.prepareStatement(str);
			pstmt.executeUpdate();
			
			for(int i = 0; i < comments.size(); i++) {
				if(comments.get(i).getOriginalno() == originalno) {
					delIdx = i;
				}
			}
			
			comments.remove(delIdx);
			System.out.println("댓글 삭제 성공");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("댓글 삭제 실패");			
		}
		
		return true;
	}
	
	//댓글 추천 비추천
	public boolean updateCommentLikes(int chk, int boardno, int commentno) {
		try {
			int idx = -1;
			comments = getComments(boardno);
			for(int i = 0; i < comments.size(); i++) {
				if(comments.get(i).getOriginalno() == commentno) {
					idx = i;
				}
			}
			
			conn = DBManager.getConnection();
			String str = "";
			int likes = 0;
			
			//추천
			if(chk == 1) {
				likes = comments.get(idx).getLikes();
				comments.get(idx).setLikes(likes++);
				str = "update board_comment set likes = ? where boardno = '" + boardno + "' and no = '" + commentno + "'";				
			}
			
			//비추천
			else if(chk == 0) {
				likes = comments.get(idx).getNotlikes();
				comments.get(idx).setNotlikes(likes++);
				str = "update board_comment set notlikes = ? where boardno = '" + boardno + "' and no = '" + commentno + "'";								
			}
			
			pstmt = conn.prepareStatement(str);
			pstmt.setInt(1, likes);
			pstmt.executeUpdate();
			
			System.out.println("추천 업데이트 성공");
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("추천 업데이트 실패");
		}
		
		return true;
	}
}
