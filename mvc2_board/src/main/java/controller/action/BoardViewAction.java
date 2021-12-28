package controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BoardDAO;
import model.dto.BoardDTO;

public class BoardViewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = BoardDAO.getInstance();
		int no = Integer.parseInt(request.getParameter("no"));
    	BoardDTO board = dao.getBoardView(no);
		
    	request.setAttribute("boardview", board);
    	
		String url = "/views/boardView.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}
}
