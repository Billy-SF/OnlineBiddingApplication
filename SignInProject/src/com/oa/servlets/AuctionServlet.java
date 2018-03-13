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
import javax.swing.filechooser.FileSystemView;

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

		String username = (String)request.getSession(false).getAttribute("username"); 
		String password = (String)request.getSession(false).getAttribute("password");

		if(username != null || password != null) { 

			User user = UserDao.login(username, password);

			if(user != null) {

				String itemName= request.getParameter("itemName");
				String description = request.getParameter("description");
				String bidStart = request.getParameter("bidStart");
				String bidEnd = request.getParameter("bidEnd") ;
				String initialPrice = request.getParameter("initialPrice");
				Part filePart = request.getPart("image");

				if (itemName != null && description != null && bidStart != null && bidEnd != null && initialPrice != null) {
					// date validation
					String [] validSatrtBidArray = bidStart.split("T");
					String [] startBidDate = validSatrtBidArray[0].split("-");

					// time validation
					if(validSatrtBidArray.length > 1) {
						String [] startBidTime = validSatrtBidArray[1].split(":");

						Calendar calS = Calendar.getInstance();
						calS.set(Integer.valueOf(startBidDate[0]), Integer.valueOf(startBidDate[1]) - 1, Integer.valueOf(startBidDate[2]), Integer.valueOf(startBidTime[0]), Integer.valueOf(startBidTime[1]));
						Date start = calS.getTime();

						String [] validEndBidArray = bidEnd.split("T");
						String [] endBidDate = validEndBidArray[0].split("-");
						if(validEndBidArray.length > 1){ 
							String [] endBidTime = validEndBidArray[1].split(":");

							Calendar calE = Calendar.getInstance();
							calE.set(Integer.valueOf(endBidDate[0]), Integer.valueOf(endBidDate[1]) - 1, Integer.valueOf(endBidDate[2]), Integer.valueOf(endBidTime[0]), Integer.valueOf(endBidTime[1]));
							Date end = calE.getTime();


							// if date is not valid, stay on page
							if (end.compareTo(start) > 0 && end.compareTo(new Date()) > 0 && start.compareTo(new Date()) > 0) {

								try {
									if (filePart != null) {
										// obtains input stream of the upload file
										inputStream = filePart.getInputStream();
									}

									// works for both Linux and windows
									String os = System.getProperty("os.name");
									
									String path = os.contains("Windows") ? FileSystemView.getFileSystemView().getHomeDirectory().getParent() : FileSystemView.getFileSystemView().getHomeDirectory().toString();
									 
									// creates directory
									File dir = new File( path + "/uploadImageOttawAction");
									try {
										dir.mkdir();
									}catch (SecurityException e) {
										e.getMessage();
										e.printStackTrace();
									}

									// create a file inside the directory, the extension is "jpg" and the name starts with img and continues with numbers 
									File file = File.createTempFile("img", ".jpg", dir);

									String imageFileName = file.getName();

									// copy the uploaded image to the created file
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
							}// if start date is before end date or start date is before now
							else {
								redirectToPage(request, response, "auction.jsp");
							}
						} // if validEndBidArray < 1
						else {
							redirectToPage(request, response, "auction.jsp");
						}
					}// if validSatrtBidArray < 1
					else {
						redirectToPage(request, response, "auction.jsp");
					}
				}// if form is not completely filled
				else {
					redirectToPage(request, response, "auction.jsp");
				}
			}// if user == null
			else {
				redirectToPage(request, response, "registerForm.jsp");
			}
		}// if user is not on session
		else {
			redirectToPage(request, response, "index.jsp");
		}
	}

	private void redirectToPage(HttpServletRequest request , HttpServletResponse response , String page) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(page);  
		rd.include(request,response);			
	}
}
