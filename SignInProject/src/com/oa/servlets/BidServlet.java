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
		//strip tag keyword
		String productitemid = request.getParameter("productItemId");
		System.out.print("ProductItemid=" + productitemid);
		ProductItem productitem = SearchDao.getProductItemByID(productitemid);
		Auction auction = SearchDao.getAuctionByProductItemID(productitemid);
		
		
		//ArrayList<Bid> bids = productitem.getBids();
		
		request.setAttribute("productitem", productitem);
		request.setAttribute("auction", auction);
		String username = (String) request.getSession().getAttribute("username");
		System.out.println("username: " + username);
		String password = (String) request.getSession().getAttribute("password");
		User user = UserDao.getUser(username, password);
		BidDao newbid = new BidDao(username,password);
		String bidPrice = request.getParameter("bidPrice");
		System.out.println("bidPrice: " + bidPrice);
		newbid.updateUserBid(auction.getId(),user.getUserId(), bidPrice, auction.getItemsfk());
		System.out.println( "item id: " + auction.getItemsfk());
		System.out.println( "auction id:" + auction.getId());
		System.out.println( "user id:" + auction.getUserid());
		request.setAttribute("productitem", productitem);
		request.setAttribute("auction", auction);

		RequestDispatcher dp = request.getRequestDispatcher("bidpage.jsp");
		dp.forward(request, response);
		
		out.close();
	}	
	

}
