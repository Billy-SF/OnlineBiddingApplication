package com.oa.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.dao.SellerFeedbackDao;

public class SellerFeedbackServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/plain");
		String seller = (String)request.getSession(false).getAttribute("seller");
		String description = request.getParameter("description");
		String rating = request.getParameter("rating");
		SellerFeedbackDao.updateRating(seller, description, rating);
		PrintWriter out = response.getWriter();
		out.print("Thank you for rating this seller! <p><a href='matchSellerServlet'>Go back to Seller Page<a><p>");		
		//response.sendRedirect("ratingConfirmation.jsp");
		out.close();
	}
}
