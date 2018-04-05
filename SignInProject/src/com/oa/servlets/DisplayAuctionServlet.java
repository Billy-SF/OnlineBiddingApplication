package com.oa.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.dao.AuctionDao;
import com.oa.helpers.Auction;
import com.oa.helpers.ProductItem;

public class DisplayAuctionServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {
		
		// add info to be displayed in the page
		List <Auction> openAuctions = AuctionDao.getOpenAuctions();
		Map<String, String> highestBidpriceForOpenAuctions = AuctionDao.getHighestBidPriceForAucions(openAuctions);
		Map<String, ProductItem> ItemsForOpenAuctions = AuctionDao.getItemsForAuctions(openAuctions);
		Map<String, String> buyersMapForOpenAuctions = AuctionDao.getHighestBiderForAuctions(openAuctions);
		Map<String, String> sellersMapForOpenAuctions = AuctionDao.getSellersForAucions(openAuctions);
		
		request.getSession(false).setAttribute("openAuctions", openAuctions);
		request.getSession(false).setAttribute("highestBidpriceForOpenAuctions", highestBidpriceForOpenAuctions);
		request.getSession(false).setAttribute("ItemsForOpenAuctions", ItemsForOpenAuctions);
		request.getSession(false).setAttribute("buyersMapForOpenAuctions", buyersMapForOpenAuctions);
		request.getSession(false).setAttribute("sellersMapForOpenAuctions", sellersMapForOpenAuctions);
		
		RequestDispatcher rd=request.getRequestDispatcher("displayAuction.jsp");  
		rd.forward(request,response);

	}
}
