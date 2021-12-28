package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;

public class LoginAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = UserDAO.getInstance();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		HttpSession session = request.getSession();
		String url = "";
		
		if(dao.checkLogin(id, pw)) {
			url = "views/main.jsp";
			session.setAttribute("log", id);
		}
		else {
			url = "views/login.jsp";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}
