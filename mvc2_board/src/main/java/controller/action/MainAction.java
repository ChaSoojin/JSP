package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String link = request.getParameter("link");
		System.out.println("LINK:: " + link);
		
		String url = "";
		
		if(link.equals("login")) {
			url = "views/login.jsp";
		}
		else if(link.equals("join")) {
			url = "views/join.jsp";
		}
		else if(link.equals("쓰기")) {
			url = "views/boardWrite.jsp";
		}
		else if(link.equals("수정하기")) {
			url = "views/boardUpdate.jsp";
		}
		else if(link.equals("회원정보수정")) {
			url = "views/userUpdate.jsp";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
