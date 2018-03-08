package com.oa.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.nio.file.StandardCopyOption;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.oa.dao.AuctionDao;
import com.oa.dao.UserDao;
import com.oa.helpers.User;

@MultipartConfig
public class AuctionServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {

		InputStream inputStream = null;

		String itemName= request.getParameter("itemName");
		String description = request.getParameter("description");
		String bidStart = request.getParameter("bidStart");
		String bidEnd = request.getParameter("bidEnd");
		String initialPrice = request.getParameter("initialPrice");
		Part filePart = request.getPart("image");
		
		// date validation
		String [] validSatrtBidArray = bidStart.split("T");
		String [] startBidDate = validSatrtBidArray[0].split("-");
		String [] startBidTime = validSatrtBidArray[1].split(":");
		Calendar calS = Calendar.getInstance();
		calS.set(Integer.valueOf(startBidDate[0]), Integer.valueOf(startBidDate[1]) - 1, Integer.valueOf(startBidDate[2]), Integer.valueOf(startBidTime[0]), Integer.valueOf(startBidTime[1]));
		Date start = calS.getTime();

		String [] validEndBidArray = bidEnd.split("T");
		String [] endBidDate = validEndBidArray[0].split("-");
		String [] endBidTime = validEndBidArray[1].split(":");
		Calendar calE = Calendar.getInstance();
		calE.set(Integer.valueOf(endBidDate[0]), Integer.valueOf(endBidDate[1]) - 1, Integer.valueOf(endBidDate[2]), Integer.valueOf(endBidTime[0]), Integer.valueOf(endBidTime[1]));
		Date end = calE.getTime();
		
		
		// if date is not valid, stay on page
		if (end.compareTo(start) < 0 || end.compareTo(new Date()) < 0 || start.compareTo(new Date()) < 0) {
			//System.out.println("invalid start and end");
			RequestDispatcher rd=request.getRequestDispatcher("auction.jsp");  
			rd.include(request,response);  
		}
		else {
			String username = (String)request.getSession(false).getAttribute("username"); 
			String password = (String)request.getSession(false).getAttribute("password");

			// the user has to be logged in order to create an auction
			if(username == null || password == null) {
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
				rd.include(request,response);  
			}

			// if the user doesn't exist in dB, redirect it to register
			User user = UserDao.login(username, password);
			if(user == null) {
				RequestDispatcher rd=request.getRequestDispatcher("register.jsp");  
				rd.include(request,response);  
			}
			else {
				try {
					if (filePart != null) {
						// obtains input stream of the upload file
						inputStream = filePart.getInputStream();
					}

					// creates directory
					File dir = new File("c:\\uploadImageOttawAction");
					try {
						dir.mkdir();
					}catch (SecurityException e) {
						e.getMessage();
						e.printStackTrace();
					}

					File file = File.createTempFile("img", ".jpg", dir);

					String imageFileName = file.getName();

					java.nio.file.Files.copy(inputStream, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
					
					BigDecimal initialPriceBd = new BigDecimal(initialPrice);
					
					String bidStartFormat = bidStart.replaceAll("T", " ").concat(":00");
					String bidEndFormat = bidEnd.replaceAll("T", " ").concat(":00");
					
					/*Date bidStartDate = new SimpleDateFormat("YYYY-MM-DD HH:MM:SS").parse(bidstartFormat);
					Date bidEndDate = new SimpleDateFormat("YYYY-MM-DD HH:MM:SS").parse(bidEndFormat);*/

					AuctionDao.createAction(itemName, description, imageFileName, bidStartFormat, bidEndFormat, initialPriceBd, username, password);

				}catch (Exception e) {
					e.printStackTrace();
				}
				finally {
					IOUtils.closeQuietly(inputStream);
				}

				RequestDispatcher rd=request.getRequestDispatcher("displayAuction.jsp");  
				rd.forward(request,response);  
			}
		}// end else
	}
}
