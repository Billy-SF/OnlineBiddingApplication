package com.oa.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oa.dao.AdminDao;

public class AdminServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String param;

		response.setContentType("text/html");

		param = request.getParameter("auctionId");
		if(param != null) {
			deleteAuction(param);
		}

		//RequestDispatcher rp = request.getRequestDispatcher("search.jsp?search=" + request.getAttribute("keyword"));
		response.sendRedirect("searchServlet?search=" + request.getSession(false).getAttribute("keyword"));
		

	}

	void deleteAuction(String auctionId) {
		AdminDao.deleteAuction(auctionId);
	}
}
