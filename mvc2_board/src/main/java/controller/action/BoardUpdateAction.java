package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.BoardDAO;

public class BoardUpdateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = BoardDAO.getInstance();
		int no = Integer.parseInt(request.getParameter("no"));

		System.out.println("NO: " + no);
		
		HttpSession session = request.getSession();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = (String) session.getAttribute("log");
		String url = "";
		
		if(dao.updateBoard(no, title, content)){
			new BoardViewAction().execute(request, response);
		}
		else {
			new BoardListAction().execute(request, response);
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}
