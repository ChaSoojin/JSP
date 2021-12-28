package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import model.dto.BoardDTO;
import util.DBManager;

public class BoardDAO {

	private BoardDAO() {}
	
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	ArrayList<BoardDTO> boardlist = null;
	private int cnt = 0;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//게시판 전체목록 get
	public ArrayList<BoardDTO> getBoardList() {
		
		try {
			conn = DBManager.getConnection();
			
			String str = "select * from board";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			boardlist = new ArrayList<BoardDTO>();
			
			//no id pw title content likes regdate
			while(rs.next()) {
				int no = rs.getInt(1);
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				int likes = rs.getInt(6);
				Timestamp regDate = rs.getTimestamp(7);
				
				boardlist.add(new BoardDTO(no,id,pw,title,content,likes,regDate));
				cnt++;
				System.out.println(boardlist);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return boardlist;
	}
	
	//상세보기
	public BoardDTO getBoardView(int no) {
		BoardDTO board = null;
		
		try {
			conn = DBManager.getConnection();
			
			String str = "select * from board where no = '" + no + "'";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				int likes = rs.getInt(6);
				Timestamp regDate = rs.getTimestamp(7);
				
				board = new BoardDTO(no,id,pw,title,content,likes,regDate);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return board;
	}
	
	//게시판 글 추가
	public boolean addBoard (BoardDTO board) {
		
		try {						
			Calendar cd = Calendar.getInstance();
			long time = cd.getTimeInMillis();
			Timestamp regDate = new Timestamp(time);		

			conn = DBManager.getConnection();
			String str = "insert into board(id,pw,title,content,regdate) values(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(str);
			
			pstmt.setString(1, board.getId());
			pstmt.setString(2, board.getPw());
			pstmt.setString(3, board.getTitle());
			pstmt.setString(4, board.getContent());
			pstmt.setTimestamp(5, regDate);
			
			pstmt.executeUpdate();
			
			//no id pw title content likes regdate
			//public BoardDTO(int no, String id, String pw, String title, String content, int likes, Timestamp regDate)
			
			BoardDTO newBoard = new BoardDTO(cnt,board.getId(), board.getPw(), board.getTitle(), board.getContent(), 0, regDate);
			boardlist.add(newBoard);
			
			System.out.println("게시판 등록 성공");						
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("게시판 등록 실패");
		}
		return true;
	}
	
	//게시판 글 업데이트
	public boolean updateBoard(int no, String title, String content) {
		Calendar cd = Calendar.getInstance();
		long time = cd.getTimeInMillis();
		Timestamp regDate = new Timestamp(time);
		
		try {
			conn = DBManager.getConnection();
			String str = "update board set title = ?, content = ? where no = '" + no + "'";
			pstmt = conn.prepareStatement(str);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.executeUpdate();
			
			for(BoardDTO board : boardlist) {
				if(board.getNo() == no) {
					board.setTitle(title);
					board.setContent(content);
					board.setRegDate(regDate);
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
	public boolean deleteBoard(int no) {
		int delIdx = -1;
		
		try {
			conn = DBManager.getConnection();
			String str = "delete from board where no = '" + no + "'";
			pstmt = conn.prepareStatement(str);
			pstmt.executeUpdate();
			
			for(int i = 0; i < boardlist.size(); i++) {
				if(boardlist.get(i).getNo() == no) {
					delIdx = i;
				}
			}
			
			boardlist.remove(delIdx);
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
			String str = "select count(*) from board_like where boardno = '" + no + "' and id = '" + id + "'";
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
				sql = "delete from board_like where boardno = '" + no + "' and id = '" + log + "'";
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();	
				chk = 0;
				System.out.println("좋아요 취소");
			}
			else {
				sql = "insert into board_like(boardno, id) values (?,?)";
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
			
			String sql = "update board set likes = ? where no = '" + no + "'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, likes);								
			boardlist.get(idx).setLikes(likes);
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
			likes = boardlist.get(idx).getLikes();
			System.out.println("좋아요개수: " + likes);			
		}
		
		return likes;
	}
	
	private int findIdx(int no) {
		int idx = -1;
		boardlist = getBoardList();
		
		for(int i = 0; i < boardlist.size(); i++) {
			if(boardlist.get(i).getNo() == no) {
				idx = i;
			}
		}
		
		return idx;
	}
}
