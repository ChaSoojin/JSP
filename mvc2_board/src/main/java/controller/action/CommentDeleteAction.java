package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.CommentDAO;
import model.dto.CommentDTO;

public class CommentDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDAO commentdao = CommentDAO.getInstance();
		int no = Integer.parseInt(request.getParameter("no"));
		
		ArrayList<CommentDTO> commentlist = commentdao.getComments(no);
		int num = Integer.parseInt(request.getParameter("num"));
		int originalno = 0;
		
		for(CommentDTO comment : commentlist){
			if(comment.getNo() == num){
				originalno = comment.getOriginalno();
			}
		}
		System.out.println("NO: " + no + " Num: " + num + " 원래번호: " + originalno);
		
		if (commentdao.deleteComment(no, originalno)) {
			new BoardViewAction().execute(request, response);
		} else {
			System.out.println("댓글삭제실패!!!!");
		}
	}
}
