package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BoardDAO;
import model.dto.BoardDTO;

public class BoardListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/views/boardlist.jsp";
		
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardDTO> boardList = dao.getBoardList();
		
		for(BoardDTO board : boardList) {
			System.out.println(board.getTitle() + " " + board.getContent());
		}
		
		request.setAttribute("boardlist", boardList);
		request.getRequestDispatcher(url).forward(request, response);
	}
}
