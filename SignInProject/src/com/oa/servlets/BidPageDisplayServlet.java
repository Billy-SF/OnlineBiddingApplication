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
import com.oa.helpers.Auction;
import com.oa.helpers.Bid;
import com.oa.helpers.ProductItem;

public class BidPageDisplayServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		//strip tag keyword
		String productitemid = request.getParameter("productitemid");
		System.out.print("fffffffff=" + productitemid);
		ProductItem productitem = SearchDao.getProductItemByID(productitemid);
			
		Auction auction = productitem.getAuction();
				
		//ArrayList<Bid> bids = productitem.getBids();
				
		try {
			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");        
			  String d1 = auction.getBidstarttime();   
System.out.print("d1=" + d1);
			  Date date1 =sdf.parse(d1);      
			  Date today_date = new Date();
			  String d2 = auction.getBidendtime();   
			  Date date2 =sdf.parse(d2);      
			  if(today_date.after(date2)) {
				  auction.setBidstate("0");
				  //0: end
				  //1: start
				  //2: not sarted
				  // then write to database
			  }
			  else if(date1.after(today_date)) {
				  auction.setBidstate("2");
					 //0: end
				  //1: start
					 //2: not sarted
				 // then write to database	  				  

			  }
			  else {
				  auction.setBidstate("1");
				  //0: end
				  //1: start
				  //2: not sarted
				  // then write to database
				  
			  }
			} catch(ParseException e) {
			  //e.printStackTrace();
			  //System.out.print("you get the ParseException");
			}
		
		
		request.setAttribute("productitem", productitem);
		request.setAttribute("auction", auction);
         
		RequestDispatcher dp = request.getRequestDispatcher("bidpage.jsp");
		dp.forward(request, response);
		
		out.close();
	}	
	

}
