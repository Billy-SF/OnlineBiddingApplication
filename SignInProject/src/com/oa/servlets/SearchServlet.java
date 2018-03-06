package com.oa.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.dao.SearchDao;

/**
 * @author Zhel * 
 *
 */
public class SearchServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		String searchKeyword = request.getParameter("search");
		request.setAttribute("productItems", SearchDao.searchKeyword(searchKeyword));
		RequestDispatcher dp = request.getRequestDispatcher("search.jsp");
		dp.forward(request, response);
		
		out.close();
	}
} //End searchServlet class