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

public class UsersServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {

		ArrayList<User> users = (ArrayList<User>) UserDao.getAllUsers();
		request.getSession(false).setAttribute("users", users);
		RequestDispatcher rd = request.getRequestDispatcher("users.jsp");  
		rd.include(request,response);			
	}
}
