package com.oa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.concurrent.ThreadLocalRandom;

import com.mysql.jdbc.Statement;
import com.oa.helpers.Address;
import com.oa.helpers.Auction;
import com.oa.helpers.Bid;
import com.oa.helpers.Chat;
import com.oa.helpers.Contact;
import com.oa.helpers.ProductItem;
import com.oa.helpers.User;
import com.oa.utilities.Encryption;
import com.oa.utilities.Mailer;

/**
 * @author Julie
 *
 */
public class ContactDao {
	/**
	 * @param keyword
	 * @return productItem
	 */


	// save chat message to table "chat"
	public static void savemessage(Contact contact){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;

		// highestPrice
		try{
			//String userId = chat.getUserId();
			String name = contact.getName();
			String email = contact.getEmail();
			String subject = contact.getSubject();
			String message = contact.getMessage();
			String dateCreated = contact.getDateCreated();
			
			//java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			Date date = df.parse(dateCreated);
			Timestamp timestamp = new Timestamp(date.getTime());
			//String dateCreated = df.format(date);
			//chat.setDateCreated(dateCreated);

			pst = conn.prepareStatement("INSERT INTO contacts (name,email,subject,message,date_created) VALUES (?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
			//pst.setString(1, userId);
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, subject);
			pst.setString(4, message);
			pst.setTimestamp(5, timestamp);
			pst.executeUpdate();
		}
		catch (Exception e) {
	        e.printStackTrace();
	    } 
		finally {
	    	if (conn != null) {
	    		Dao.closeConnection();
	    	}
	        if (pst != null) {
	            try {
	                pst.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (rs != null) {
	            try {
	                rs.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	       
	    }
	}


}//End of ChatDao

