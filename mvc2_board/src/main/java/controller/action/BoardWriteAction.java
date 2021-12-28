package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.BoardDAO;
import model.dto.BoardDTO;

public class BoardWriteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = BoardDAO.getInstance();
		HttpSession session = request.getSession();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = (String) session.getAttribute("log");
		String pw = request.getParameter("pw");
		
		BoardDTO board = new BoardDTO(id,pw,title,content);
		String url = "";
		
		if(dao.addBoard(board)){
			new BoardListAction().execute(request, response);
		}
		else {
			url = "views/boardWrite.jsp";
		}
		
		System.out.println(url);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
