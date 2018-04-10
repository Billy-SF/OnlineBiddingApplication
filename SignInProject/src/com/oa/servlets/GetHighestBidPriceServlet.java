package com.oa.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;






import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.oa.dao.BidDao;
import com.oa.dao.SearchDao;
import com.oa.dao.UserDao;
import com.oa.helpers.Auction;
import com.oa.helpers.Bid;
import com.oa.helpers.ProductItem;
import com.oa.helpers.User;

public class GetHighestBidPriceServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		JSONObject json = new JSONObject(); 
		
		String productitemid = request.getParameter("productitemid");
		String userId = (String) request.getSession().getAttribute("userId");
		
		
		
	    Bid bid = BidDao.getHigestBid(productitemid);
	    String highestprice =  bid.getBidprice();
	    
	   
	    json = new JSONObject();
		try {
			json.put("highestprice", highestprice);
			// return JSON for last_message_id
			out.print(json);
	    } 
		catch (JSONException e) {
			e.printStackTrace();
		}
	    out.close();
	}	
	

}
