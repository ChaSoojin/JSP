package controller;

import controller.action.Action;
import controller.action.BoardDeleteAction;
import controller.action.BoardListAction;
import controller.action.BoardUpdateAction;
import controller.action.BoardViewAction;
import controller.action.BoardWriteAction;
import controller.action.CommentAction;
import controller.action.JoinAction;
import controller.action.LoginAction;
import controller.action.LogoutAction;
import controller.action.MainAction;
import controller.action.UserUpdateAction;

public class ActionFactory {

	private ActionFactory() {}
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		
		System.out.println("커맨드: " + command);
		
		if(command.equals("main")) {
			action = new MainAction();
		}
		if(command.equals("login")) {
			action = new LoginAction();
		}
		if(command.equals("join")) {
			action = new JoinAction();
		}
		if(command.equals("logout")) {
			action = new LogoutAction();
		}
		if(command.equals("boardlist")) {
			action = new BoardListAction();
		}
		if(command.equals("boardWrite")) {
			action = new BoardWriteAction();
		}
		if(command.equals("boardView")) {
			action = new BoardViewAction();
		}
		if(command.equals("boardDelete")) {
			action = new BoardDeleteAction();
		}
		if(command.equals("userUpdate")) {
			action = new UserUpdateAction();
		}
		if(command.equals("등록")) {
			action = new CommentAction();
		}

		return action;
	}
}

