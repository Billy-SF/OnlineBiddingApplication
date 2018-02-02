package com.oa.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.dao.UserDao;
import com.oa.utilities.Encryption;


public class EditServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{			
		response.setContentType("text/html");
		
		String userId = request.getParameter("userId");
		String username = request.getParameter("username");
		String password = Encryption.encrypt(request.getParameter("password"));  //stores encrypted password
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String email = request.getParameter("email");

		
		if(username != null)
		{
			UserDao.editProfile(userId, username,  firstName, lastName, email, password);
			response.sendRedirect("profile.jsp");
		}else
		{
		    response.sendRedirect("index.jsp"); 
		}
	}//End of doPost	
}//End of EditProfileServlet
