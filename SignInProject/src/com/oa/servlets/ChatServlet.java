package com.oa.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.oa.dao.SearchDao;
import com.oa.dao.UserDao;
import com.oa.helpers.Auction;
import com.oa.helpers.Bid;
import com.oa.helpers.Chat;
import com.oa.helpers.ProductItem;
import com.oa.helpers.User;

public class ChatServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		JSONObject json = new JSONObject(); 
		
		String last_message_id = "0";

		// action: get, write, read
		String action = request.getParameter("action");
		
		
		switch(action) {
		case "get":
			last_message_id = ChatDao.get_last_message_id();

			json = new JSONObject();
			try {
				json.put("last_message_id", last_message_id);
				// return JSON for last_message_id
				out.print(json);
		    } 
			catch (JSONException e) {
				e.printStackTrace();
			}
			break;
		case "write":
			Chat chat = new Chat();
			String userId = request.getParameter("user_id");
			chat.setUserId(userId);

			String auctionId = request.getParameter("auction_id");
			chat.setAuctionId(auctionId);
			
			String message = request.getParameter("message");
			chat.setMessage(message);

			String userName = request.getParameter("user_name");
			chat.setUserName(userName);

			String color = request.getParameter("color");
			chat.setColor(color);
			
			last_message_id = String.valueOf(ChatDao.savemessage(chat));
			
			json = new JSONObject();
			try {
				json.put("last_message_id", last_message_id);
				// return JSON for is_saved
				out.print(json);
		    } 
			catch (JSONException e) {
				e.printStackTrace();
			}

			break;
		case "read":
			last_message_id = request.getParameter("last_message_id");
			String action_id = request.getParameter("auction_id");
			ArrayList<Chat> chats = ChatDao.readmessage(action_id, last_message_id);
			JSONArray jsonArray = new JSONArray(chats);

			
			// return JSON for chats
			//out.print(chats);
			
			out.print(jsonArray);
			
			break;
		}
		


		out.close();
	}	
	

}
