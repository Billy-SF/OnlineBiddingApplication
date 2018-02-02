package com.oa.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.dao.UserDao;
import com.oa.helpers.User;
import com.oa.utilities.Encryption;

public class RegisterServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		User user;

		String username = request.getParameter("username");
		String password = Encryption.encrypt(request.getParameter("userpass")); 
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String email = request.getParameter("email");
		user = UserDao.register(username, password, firstName, lastName, email);

		if(user != null){
			HttpSession session = request.getSession(false);
			if (session!=null){
				session.setAttribute("username", user.getUsername());
				session.setAttribute("user_id", user.getUserId());
				session.setAttribute("firstName", user.getFirstname());
				session.setAttribute("lastName", user.getLastname());


			}
			response.sendRedirect("verifyEmail.jsp"); 
		} else {
			out.print("<p style=\"color:red\">Email already exists</p>"); 
			RequestDispatcher rd=request.getRequestDispatcher("registration.jsp");  
			rd.include(request,response);
		}
	}
} //End Registerservlet class
