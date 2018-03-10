package com.oa.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.dao.AuctionDao;
import com.oa.dao.SellerFeedbackDao;

public class MatchSellerServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		String seller = AuctionDao.MatchUserFromAuctionId(Integer.parseInt((String)request.getSession(false).getAttribute("auctionId")));
		request.getSession(false).setAttribute("seller", seller);
		request.getSession(false).setAttribute("currentRating", SellerFeedbackDao.getAverageRatingMessage(seller));
		RequestDispatcher rp = request.getRequestDispatcher("seller.jsp?seller=" + seller);
		rp.forward(request, response);

	}
}
