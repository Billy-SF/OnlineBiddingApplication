package com.oa.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.ArrayList;
import java.util.Currency;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.dao.BidDao;
import com.oa.dao.SearchDao;
import com.oa.helpers.Auction;
import com.oa.helpers.Bid;
import com.oa.helpers.ProductItem;

public class BidPageDisplayServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		// strip tag keyword
		String productitemid = request.getParameter("productitemid");

		ProductItem productitem = SearchDao.getProductItemByID(productitemid);
		System.out.println(productitem == null ? "productitem is Null" : "productitem is not Null");
		Auction auction = productitem.getAuction();
		System.out.println(auction == null ? "auction is Null" : "auction is not Null");
		// ArrayList<Bid> bids = productitem.getBids();

		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String d1 = auction.getBidstarttime();
			System.out.print("d1=" + d1);
			Date date1 = sdf.parse(d1);
			Date today_date = new Date();
			String d2 = auction.getBidendtime();
			Date date2 = sdf.parse(d2);
			if (today_date.after(date2)) {
				auction.setBidstate("0");
				// 0: end
				// 1: start
				// 2: not sarted
				// then write to database
			} else if (date1.after(today_date)) {
				auction.setBidstate("2");
				// 0: end
				// 1: start
				// 2: not sarted
				// then write to database

			} else {
				auction.setBidstate("1");
				// 0: end
				// 1: start
				// 2: not sarted
				// then write to database

			}
			
			
			//Locale locale = new Locale(request.getParameter("locale"));
			//System.out.println("Country is" + locale.getCountry());
			
			//DateFormat df = DateFormat.getTimeInstance(DateFormat.MEDIUM, locale);
			//String formattedDate = df.format(date1);		
			//auction.setBidstarttime(formattedDate);
			System.out.println(request.getParameter("locale"));
			
			if("en_US".equals(request.getParameter("locale"))) {
				
				String bidPriceStart = auction.getBidpricestart();
				Double currencyAmount = new Double(Double.parseDouble(bidPriceStart));
				
			    NumberFormat currencyFormatter = 
			        NumberFormat.getCurrencyInstance(Locale.CANADA);    
			    String formattedCurrency = currencyFormatter.format(currencyAmount);
			    
				auction.setBidpricestart(formattedCurrency);
				
			    System.out.println("Canada" + formattedCurrency);
				
			}
			else {
				
				
				String bidPriceStart = auction.getBidpricestart();
				Double currencyAmount = new Double(Double.parseDouble(bidPriceStart)*6.00);
				
			    NumberFormat currencyFormatter = 
			        NumberFormat.getCurrencyInstance(Locale.CHINA);    
			    String formattedCurrency = currencyFormatter.format(currencyAmount);
			    if(formattedCurrency.length()>1) {
			    	formattedCurrency =  formattedCurrency.substring(1);
			    }
			    
				auction.setBidpricestart(formattedCurrency + "�");
				
			    System.out.println("China" + formattedCurrency);
				
				
			}
		
		

			
			
		} catch (ParseException e) {
			// e.printStackTrace();
			// System.out.print("you get the ParseException");
		}

		
		request.setAttribute("itemId", productitemid);
		request.setAttribute("productitem", productitem);
		request.setAttribute("auction", auction);

		if (null == request.getParameter("errorMessagebd") || request.getParameter("errorMessagebd").trim().isEmpty()
				|| request.getParameter("errorMessagebd").equals("null")) {

		} else {
			request.setAttribute("errorMessageBidDao", request.getParameter("errorMessagebd"));
		}

		RequestDispatcher dp = request.getRequestDispatcher("bidpage.jsp");
		dp.forward(request, response);

		out.close();
	}




}
