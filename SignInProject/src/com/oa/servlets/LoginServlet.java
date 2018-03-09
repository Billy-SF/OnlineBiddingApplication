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


public class LoginServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  

        response.setContentType("text/html");  
        response.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();  
        
        String username= request.getParameter("username");
        
        String password = request.getParameter("password");
        
        // Do we need it? String password= Encryption.encrypt(request.getParameter("password"));  //stores encrypted password
        
        User user = UserDao.login(username, password);
        if(user != null){
        	HttpSession session = request.getSession(false);
            if (session!=null){
            	 session.setAttribute("username", user.getUsername());
            	 session.setAttribute("password", user.getPassword());
            	 session.setAttribute("firstname", user.getFirstname());
            	 session.setAttribute("email", user.getEmail());
            	 session.setAttribute("lastname", user.getLastname());
            }
//            response.sendRedirect("welcome.jsp");  what is the difference?
            
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
            rd.forward(request,response);  
                 
        } else {
        	//out.print("<p style=\"color:red\">Sorry, username or password is incorrect</p>");  
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
            rd.include(request,response);
        }

        out.close();  
    }  


}
