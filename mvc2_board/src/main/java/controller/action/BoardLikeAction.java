package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.BoardDAO;

public class BoardLikeAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int no = Integer.parseInt(request.getParameter("no"));
		String log = (String)session.getAttribute("log");

		BoardDAO dao = BoardDAO.getInstance();
		int chk = dao.likeSwap(no, log);
		
		//좋아요취소
		if(chk == 0){
			System.out.println("좋아요취소완료");
			dao.updateLikes(no,chk);
		}
		
		//좋아요추가
		else if(chk == 1){
			System.out.println("좋아요완료");		
			dao.updateLikes(no,chk);
		}

		new BoardViewAction().execute(request, response);
	}
}
