package com.oa.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.dao.BidDao;
import com.oa.dao.UserDao;
import com.oa.helpers.User;
import com.oa.utilities.Encryption;

public class BidServlet extends HttpServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		//BidDao newbid = new BidDao(username,password);
		//newbid.updateUserBid(auctionfk, userId, bidPrice, itemId)
		//PrintWriter out = response.getWriter();
		//response.setContentType("text/html");
		//String auctionfk = null;
		//String userId = null;
		//String bidPrice = null;
		//String itemId = null;
	}
}
