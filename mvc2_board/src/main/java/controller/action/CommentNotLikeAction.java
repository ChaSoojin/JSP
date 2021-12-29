package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CommentDAO;
import model.dto.CommentDTO;

public class CommentNotLikeAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("NO-> " + no);

		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("NUM-> " + num);

		CommentDAO dao = CommentDAO.getInstance();
		ArrayList<CommentDTO> commentlist = dao.getComments(no);

		int originalno = 0;
		int chk = 0;

		for (CommentDTO comment : commentlist) {
			if (comment.getNo() == num) {
				originalno = comment.getOriginalno();
			}
		}

		if (dao.updateCommentLikes(chk, no, originalno)) {
			System.out.println("댓글추천완료........");
		}

		new BoardViewAction().execute(request, response);
	}
}
