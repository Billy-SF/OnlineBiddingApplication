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


public class VerifyEmailServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession(false);
		
		int verificationAttempts = 0;
		String attempts="";
		System.out.println("InVerifyServlet");
		PrintWriter out = response.getWriter();
		Boolean result;
		response.setContentType("text/html");
		String username = (String) request.getSession().getAttribute("username");
		System.out.println("username: " + username);
		String password = (String) request.getSession().getAttribute("password");
		String verificationCode = request.getParameter("code");
		result = UserDao.verifyVerificationCode(username,password,verificationCode);
		
		if(result == true) 
		{
			out.println("Verification code verified!");
			System.out.println("True");
		} 
		else 
		{	
			attempts = (String) request.getSession().getAttribute("verificationAttempt");
			verificationAttempts = Integer.valueOf(attempts);
			if(verificationAttempts == 3)
			{
				UserDao.deleteUser(username, password);
				out.print("<p style=\"color:red\">Please register again for security purposes!</p>"); 
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
			}
			else
			{
				System.out.print(verificationAttempts);
				verificationAttempts++;
				session.setAttribute("verificationAttempt", String.valueOf(verificationAttempts));
				out.print("<p style=\"color:red\">Invalid Input! Please enter a valid verification code!</p>"); 
				RequestDispatcher rd=request.getRequestDispatcher("verifyEmail.jsp");  
		        rd.include(request,response);
			}
		}
	}
}

