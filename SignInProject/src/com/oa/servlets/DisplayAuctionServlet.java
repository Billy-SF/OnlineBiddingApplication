package com.oa.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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

public class DisplayAuctionServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {
		
		// add info to be displayed in the page
		List <Auction> openAuctions = AuctionDao.getOpenAuctions();
		for(Auction auction: openAuctions) {
			
			
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
				Double currencyMaxAmount = new Double(Double.parseDouble(bidPriceMax) * 6.00);

				NumberFormat currencyMaxFormatter = NumberFormat.getCurrencyInstance(Locale.CANADA);
				String formattedMaxCurrency = currencyMaxFormatter.format(currencyMaxAmount);
				if (formattedMaxCurrency.length() > 1) {
					formattedMaxCurrency = formattedMaxCurrency.substring(1);
				}
				auction.setBidpricestartLocale(formattedMaxCurrency + "¥");

			}

		}
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
