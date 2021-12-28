package controller.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.dto.UserDTO;

public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = UserDAO.getInstance();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("[JOIN]ID: " + id);
		System.out.println("[JOIN]PW: " + pw);
		
		String url = "";
		if(dao.addUser(new UserDTO(id,pw,new Timestamp(Calendar.getInstance().getTimeInMillis())))) {
			url = "views/login.jsp";
		}
		else {
			url = "views/join.jsp";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}
