package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;

public class UserUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dir = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");

		System.out.println("dir: " + dir);
		System.out.println("ID: " + id);

		String pw = request.getParameter("pw");
		UserDAO dao = UserDAO.getInstance();
		HttpSession session = request.getSession();

		String url = "";

		if (dir == UserDAO.REMOVE) {
			if (dao.deleteUser(id, pw) == -1) {
				url = "views/userUpdate.jsp";
			}

			else {
				session.removeAttribute("log");
				url="views/main.jsp";
			}
			
		} else if (dir == UserDAO.UPDATE) {
			if (dao.updateUser(id, pw)) {
				new BoardListAction().execute(request, response);
			}
			else {
				url = "views/userUpdate.jsp";
			}
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
