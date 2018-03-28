package com.oa.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.dao.AuctionDao;
import com.oa.helpers.Auction;
import com.oa.helpers.ProductItem;

public class ClosedBidsServlet  extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {
		
		ArrayList<Auction> soldAuctions = (ArrayList<Auction>)AuctionDao.getClosedAuctions();
		Map<String, String> usernamesMap = AuctionDao.getHighestBiderForSoldAuctions(soldAuctions);
		Map<String, String> highestBidPriceMap = AuctionDao.getHighestBidPriceForSoldAucions(soldAuctions);
		Map<String, ProductItem> soldItems = AuctionDao.getItemsForSoldAuctions(soldAuctions);
		
		request.getSession(false).setAttribute("soldAuctions", soldAuctions);
		request.getSession(false).setAttribute("usernamesMap", usernamesMap);
		request.getSession(false).setAttribute("highestBidPriceMap", highestBidPriceMap);
		request.getSession(false).setAttribute("soldItems", soldItems);
		
		RequestDispatcher rd = request.getRequestDispatcher("closedBids.jsp");  
		rd.include(request,response);			
	}
}
