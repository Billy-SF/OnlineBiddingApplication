package com.oa.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;













import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.oa.dao.BidDao;
import com.oa.dao.ChatDao;
import com.oa.dao.ContactDao;
import com.oa.dao.SearchDao;
import com.oa.dao.UserDao;
import com.oa.helpers.Auction;
import com.oa.helpers.Bid;
import com.oa.helpers.Chat;
import com.oa.helpers.Contact;
import com.oa.helpers.ProductItem;
import com.oa.helpers.User;

public class ContactServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");

		Contact contact = new Contact();
		JSONObject json = new JSONObject(); 

		String name = request.getParameter("name");
		contact.setName(name);
		String email = request.getParameter("email");
		contact.setEmail(email);
		String subject = request.getParameter("subject");
		contact.setSubject(subject);
		String message = request.getParameter("message");
		contact.setMessage(message);
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		String dateCreated = df.format(date);
		contact.setDateCreated(dateCreated);
		
		ContactDao.savemessage(contact);
	
		json = new JSONObject();
		try {
			json.put("submit", true);
			// return JSON for is_saved
			out.print(json);
	    } 
		catch (JSONException e) {
			e.printStackTrace();
		}
	
		//request.setAttribute("auctions", auctions);

		//RequestDispatcher dp = request.getRequestDispatcher("contact.jsp");
		//dp.forward(request, response);
		

		out.close();
	}	
	

}
