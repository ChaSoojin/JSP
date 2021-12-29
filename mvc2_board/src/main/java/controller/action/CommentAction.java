package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.CommentDAO;

public class CommentAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDAO commentdao = CommentDAO.getInstance();
		int no = Integer.parseInt(request.getParameter("no"));
		HttpSession session = request.getSession();
		
		String comment = request.getParameter("comment");
		String id = (String) session.getAttribute("log");
		
		if(commentdao.addComment(id, no, comment)) {
			new BoardViewAction().execute(request, response);
		}
		else {
			System.out.println("댓글등록실패!!!!");
		}
	}
}
