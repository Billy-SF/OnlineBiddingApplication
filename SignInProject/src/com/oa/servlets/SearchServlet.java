package com.oa.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

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
public class SearchServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		String searchKeyword = request.getParameter("search");
		String languageLocale = request.getParameter("locale");
		if (null == languageLocale || languageLocale.trim().isEmpty() || !(languageLocale.equals("zh_CN"))) {
			languageLocale = "en_US";
		}

		// strip html tag
		searchKeyword = searchKeyword.replaceAll("\\<.*?\\>", "");
		// trim
		searchKeyword = searchKeyword.trim();
		// sql injection: in DAO: the PreparedStatements
		ArrayList<ProductItem> productItem = SearchDao.searchKeyword(searchKeyword);

		for (ProductItem product : productItem) {

			if ("en_US".equals(request.getParameter("locale"))) {

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String startDateS = product.getAuction().getBidstarttime();
				System.out.println("start:" + startDateS);
				if (null != startDateS) {
					try {
						Date startDate = sdf.parse(startDateS);
						DateFormat df = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.MEDIUM,
								Locale.CANADA);
						String formattedDate = df.format(startDate);
						product.getAuction().setBidstarttimeLocale(formattedDate);

					} catch (ParseException e) {

					}
				}

				String startDateE = product.getAuction().getBidendtime();
				if (null != startDateS) {
					try {
						Date endDate = sdf.parse(startDateE);
						DateFormat df2 = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.MEDIUM,
								Locale.CANADA);
						String formattedDate2 = df2.format(endDate);
						product.getAuction().setBidendtimeLocale(formattedDate2);

					} catch (ParseException e) {

					}
				}
				
				String bidPriceMax = product.getHighestPrice();
				Double currencyMaxAmount = new Double(Double.parseDouble(bidPriceMax));

				NumberFormat currencyMaxFormatter = NumberFormat.getCurrencyInstance(Locale.CANADA);
				String formattedMaxCurrency = currencyMaxFormatter.format(currencyMaxAmount);

				product.setHighestPriceLocale(formattedMaxCurrency);
			} else {

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String startDateS = product.getAuction().getBidstarttime();
				if (null != startDateS) {
					try {
						Date startDate = sdf.parse(startDateS);
						DateFormat df = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.MEDIUM,
								Locale.CHINA);
						String formattedDate = df.format(startDate);
						product.getAuction().setBidstarttimeLocale(formattedDate);

					} catch (ParseException e) {

					}
				}
				String startDateE = product.getAuction().getBidendtime();
				if (null != startDateE) {
					try {
						Date endDate = sdf.parse(startDateE);
						DateFormat df2 = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.MEDIUM,
								Locale.CHINA);
						String formattedDate2 = df2.format(endDate);
						product.getAuction().setBidendtimeLocale(formattedDate2);

					} catch (ParseException e) {

					}
				}
				
				String bidPriceMax = product.getHighestPrice();
				Double currencyMaxAmount = new Double(Double.parseDouble(bidPriceMax) * 6.00);

				NumberFormat currencyMaxFormatter = NumberFormat.getCurrencyInstance(Locale.CANADA);
				String formattedMaxCurrency = currencyMaxFormatter.format(currencyMaxAmount);
				if (formattedMaxCurrency.length() > 1) {
					formattedMaxCurrency = formattedMaxCurrency.substring(1);
				}
				product.setHighestPriceLocale(formattedMaxCurrency + "¥");

			}

		}
		request.setAttribute("productItems", productItem);
		request.setAttribute("keyword", searchKeyword);
		request.getSession(false).setAttribute("keyword", searchKeyword);

		Integer productCount = Integer.valueOf(productItem.size());
		request.setAttribute("productTotal", productCount);
		request.setAttribute("locale", languageLocale);
		RequestDispatcher dp = request.getRequestDispatcher("search.jsp");
		dp.forward(request, response);

		out.close();
	}
} // End searchServlet class
