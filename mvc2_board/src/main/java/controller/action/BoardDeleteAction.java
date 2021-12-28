package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BoardDAO;

public class BoardDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no = Integer.parseInt(request.getParameter("no"));
		BoardDAO dao = BoardDAO.getInstance();
		String url = "/views/boardView.jsp";
		
		if(dao.deleteBoard(no)){
			new BoardListAction().execute(request, response);
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
