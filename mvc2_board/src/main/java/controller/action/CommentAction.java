package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CommentDAO;
import model.dto.CommentDTO;

public class CommentAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDAO commentdao = CommentDAO.getInstance();
		int no = Integer.parseInt(request.getParameter("no"));
		ArrayList<CommentDTO> comments = commentdao.getComments(no);
		request.setAttribute("comment", comments);
	}
}
