package com.oa.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.dao.UserDao;
import com.oa.helpers.User;
import com.oa.utilities.Encryption;

public class EditServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {			
		response.setContentType("text/html");
		
		String currentUsername = (String) request.getSession().getAttribute("username");
		String currentPassword = (String) request.getSession().getAttribute("password");
		//String password = Encryption.encrypt(request.getParameter("password"));  //stores encrypted password
		String password = request.getParameter("password");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		
		User user = UserDao.getUser(currentUsername, currentPassword);
		
        if(user != null){
        	HttpSession session = request.getSession(false);
            if (session!=null){
            	 session.setAttribute("username", username);
            	 session.setAttribute("password", password);
            	 session.setAttribute("firstname", firstname);
            	 session.setAttribute("lastname", lastname);
            	 session.setAttribute("email", email);
            }
        }
		
		if(username != null)
		{
			UserDao.editProfile( user.getUserId() , username,  firstname, lastname, email, password);
			response.sendRedirect("index.jsp");
		}else
		{
		    response.sendRedirect("index.jsp"); 
		}
	}//End of doPost	
}//End of EditProfileServlet
