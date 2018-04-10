package com.oa.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
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
for(Auction auction: soldAuctions) {
			
			
			if ("en_US".equals(request.getParameter("locale"))) {

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String startDateS = auction.getBidstarttime();
				System.out.println("start:" + startDateS);
				if (null != startDateS) {
					try {
						Date startDate = sdf.parse(startDateS);
						DateFormat df = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.MEDIUM,
								Locale.CANADA);
						String formattedDate = df.format(startDate);
						auction.setBidstarttimeLocale(formattedDate);

					} catch (ParseException e) {

					}
				}

				String startDateE = auction.getBidendtime();
				if (null != startDateS) {
					try {
						Date endDate = sdf.parse(startDateE);
						DateFormat df2 = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.MEDIUM,
								Locale.CANADA);
						String formattedDate2 = df2.format(endDate);
						auction.setBidendtimeLocale(formattedDate2);

					} catch (ParseException e) {

					}
				}
				
				String bidPriceMax = auction.getBidpricestart();
				Double currencyMaxAmount = new Double(Double.parseDouble(bidPriceMax));

				NumberFormat currencyMaxFormatter = NumberFormat.getCurrencyInstance(Locale.CANADA);
				String formattedMaxCurrency = currencyMaxFormatter.format(currencyMaxAmount);

				auction.setBidpricestartLocale(formattedMaxCurrency);
				
				
			} else {

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String startDateS = auction.getBidstarttime();
				if (null != startDateS) {
					try {
						Date startDate = sdf.parse(startDateS);
						DateFormat df = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.MEDIUM,
								Locale.CHINA);
						String formattedDate = df.format(startDate);
						auction.setBidstarttimeLocale(formattedDate);

					} catch (ParseException e) {

					}
				}
				String startDateE = auction.getBidendtime();
				if (null != startDateE) {
					try {
						Date endDate = sdf.parse(startDateE);
						DateFormat df2 = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.MEDIUM,
								Locale.CHINA);
						String formattedDate2 = df2.format(endDate);
						auction.setBidendtimeLocale(formattedDate2);

					} catch (ParseException e) {

					}
				}
				String bidPriceMax = auction.getBidpricestart();
				Double currencyMaxAmount = new Double(Double.parseDouble(bidPriceMax) * 4.96);

				NumberFormat currencyMaxFormatter = NumberFormat.getCurrencyInstance(Locale.CANADA);
				String formattedMaxCurrency = currencyMaxFormatter.format(currencyMaxAmount);
				if (formattedMaxCurrency.length() > 1) {
					formattedMaxCurrency = formattedMaxCurrency.substring(1);
				}
				auction.setBidpricestartLocale(formattedMaxCurrency + "&#xA5;");


			}

		}
		
		Map<String, String> buyersMapForSoldAuctions = AuctionDao.getHighestBiderForAuctions(soldAuctions);

		
		Map<String, String> highestBidPriceMapForSoldAuctions = AuctionDao.getHighestBidPriceForAucions(soldAuctions);
		for (Map.Entry<String, String> entry : highestBidPriceMapForSoldAuctions.entrySet())
		{
		    
			
			if ("en_US".equals(request.getParameter("locale"))) {
				
				String bidPriceMax = entry.getValue();
				Double currencyMaxAmount = new Double(Double.parseDouble(bidPriceMax));

				NumberFormat currencyMaxFormatter = NumberFormat.getCurrencyInstance(Locale.CANADA);
				String formattedMaxCurrency = currencyMaxFormatter.format(currencyMaxAmount);

				entry.setValue(formattedMaxCurrency);
			}
			else {
				String bidPriceMax = entry.getValue();
				Double currencyMaxAmount = new Double(Double.parseDouble(bidPriceMax) *  4.96);

				NumberFormat currencyMaxFormatter = NumberFormat.getCurrencyInstance(Locale.CANADA);
				String formattedMaxCurrency = currencyMaxFormatter.format(currencyMaxAmount);
				if (formattedMaxCurrency.length() > 1) {
					formattedMaxCurrency = formattedMaxCurrency.substring(1);
				}
				entry.setValue(formattedMaxCurrency + "&#xA5;");
				
			}
			
		}
		Map<String, ProductItem> soldItems = AuctionDao.getItemsForAuctions(soldAuctions);
		Map<String, String> sellersMapForSoldAuctions = AuctionDao.getSellersForAucions(soldAuctions);
		
		request.getSession(false).setAttribute("soldAuctions", soldAuctions);
		request.getSession(false).setAttribute("buyersMapForSoldAuctions", buyersMapForSoldAuctions);
		request.getSession(false).setAttribute("highestBidPriceMapForSoldAuctions", highestBidPriceMapForSoldAuctions);
		request.getSession(false).setAttribute("soldItems", soldItems);
		request.getSession(false).setAttribute("sellersMapForSoldAuctions", sellersMapForSoldAuctions);
		
		RequestDispatcher rd = request.getRequestDispatcher("closedBids.jsp");  
		rd.include(request,response);			
	}
}
