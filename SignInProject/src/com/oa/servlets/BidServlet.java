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

import com.oa.dao.BidDao;
import com.oa.dao.SearchDao;
import com.oa.dao.UserDao;
import com.oa.helpers.Auction;
import com.oa.helpers.Bid;
import com.oa.helpers.ProductItem;
import com.oa.helpers.User;

public class BidServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		String productitemid = request.getParameter("productitemid");
		ProductItem productitem = SearchDao.getProductItemByID(productitemid);
			
		Auction auction = productitem.getAuction();
		
		//strip tag keyword
		String userId = (String) request.getSession().getAttribute("userId");
		String auctionId = (String) request.getSession().getAttribute("auctionId");
		String username = (String) request.getSession().getAttribute("username");
		System.out.println("username: " + username);
		String password = (String) request.getSession().getAttribute("password");
		User user = UserDao.getUser(username, password);
		BidDao newbid = new BidDao(username,password);
		String bidPrice = request.getParameter("bidPrice");
		System.out.println("bidPrice: " + bidPrice);
		HttpSession session = request.getSession(false);
		if (session!= null)
		{
			session.setAttribute("errorMessageBidDao", null);
		}
		String itemId = newbid.getUserId(auctionId);
		String errorMessage = newbid.updateUserBid(auctionId, userId, bidPrice, itemId);
		//System.out.println( "item id: " + itemId);
		System.out.println( "auction id: " + auctionId);
		System.out.println("userId: " + userId);
		System.out.println("item id: " + itemId);
		System.out.println("About to request dispatch");
		//System.out.println( "user id:" + auction.getUserid());
		//request.setAttribute("productitem", productitem);
		//request.setAttribute("auction", auction);
		
		
		request.setAttribute("itemId", productitemid);
		request.setAttribute("productitem", productitem);
		request.setAttribute("auction", auction);
		request.setAttribute("errorMessageBidDao", errorMessage);

		
		//RequestDispatcher rp = request.getRequestDispatcher("bidpage.jsp");
		//rp.forward(request, response);
		response.sendRedirect("bidPageDisplayServlet?productitemid=" + itemId);
		out.close();
	}	
	

}
