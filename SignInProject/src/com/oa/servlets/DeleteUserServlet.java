package com.oa.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.dao.UserDao;
import com.oa.helpers.User;

public class DeleteUserServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {
		
			String username = (String) request.getSession(false).getAttribute("username");
			String password = (String) request.getSession(false).getAttribute("password");
			User user = UserDao.getUser(username, password);
			String userId = request.getParameter("userId");
			if (userId != null && !userId.equals(user.getUserId())) {
				UserDao.deleteUser(Integer.valueOf(userId));
			}
			ArrayList<User> users = (ArrayList<User>) UserDao.getAllUsers();
			request.getSession(false).setAttribute("users", users);
			RequestDispatcher dp = request.getRequestDispatcher("users.jsp");
			dp.forward(request, response);
	}
}
