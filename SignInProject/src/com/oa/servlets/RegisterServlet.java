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
		response.setCharacterEncoding("UTF-8");
		User user;
		String message = null;
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String username = request.getParameter("userName");
		String password = Encryption.encrypt(request.getParameter("password")); 
		String email = request.getParameter("email");
		user = UserDao.register(username, password, firstName, lastName, email);
		
		if(user != null)
		{
			HttpSession session = request.getSession(false);
			if (session!=null){
				session.setAttribute("firstName", user.getFirstname());
				session.setAttribute("lastName", user.getLastname());
				session.setAttribute("username", user.getUsername());
				session.setAttribute("password", user.getPassword());
				session.setAttribute("email", user.getEmail());
				session.setAttribute("verificationAttempt", "0");
				session.setAttribute("message", null);
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("role", "0");
			}
			
			response.sendRedirect("verifyEmail.jsp"); 
		} else {
			
			message = "Email already exists</p>";
			request.setAttribute("message", message);
			request.getRequestDispatcher("registrationForm.jsp").forward(request, response);
		}
		out.close();
	}
} //End Registerservlet class