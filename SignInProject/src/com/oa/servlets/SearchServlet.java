package com.oa.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.dao.SearchDao;
import com.oa.helpers.ProductItem;

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
		//strip tag keyword
		String searchKeyword = request.getParameter("search");
        ArrayList<ProductItem> productItem  = SearchDao.searchKeyword(searchKeyword);
		request.setAttribute("productItems", productItem);
		request.setAttribute("keyword", searchKeyword);
		Integer productCount = Integer.valueOf(productItem.size());
		request.setAttribute("productTotal", productCount);
		RequestDispatcher dp = request.getRequestDispatcher("search.jsp");
		dp.forward(request, response);
		
		out.close();
	}
} //End searchServlet class