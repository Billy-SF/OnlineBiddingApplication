package com.oa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;
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
import com.oa.helpers.ProductItem;
import com.oa.helpers.User;
import com.oa.utilities.Encryption;
import com.oa.utilities.Mailer;

/**
 * @author Julie
 *
 */
public class ChatDao {
	/**
	 * @param keyword
	 * @return productItem
	 */

	// get last_message_id from table "chat"
	public static String get_last_message_id(){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		String last_message_id= "0";

		// highestPrice
		try{
			pst = conn.prepareStatement("select * from chat order by id desc limit 1");
			//pst.setString(1, last_message_id);
	
			rs = pst.executeQuery();
			int size =0;
			if (rs != null) 
			{
			  rs.beforeFirst();
			  rs.last();
			  size = rs.getRow();
			}
	
			rs.beforeFirst();
			int i = 0;
			while(rs.next() && i<size){
				last_message_id = rs.getString("id");
				i++;
			}
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
		return last_message_id;
	}

	
	// save chat message to table "chat"
	public static int savemessage(Chat chat){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		int numero = 0;

		// highestPrice
		try{
		
			String userName = chat.getUserName();
			String auctionId = chat.getAuctionId();
			String message = chat.getMessage();
			String color = chat.getColor();
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			String dateCreated = df.format(date);
			chat.setDateCreated(dateCreated);

			pst = conn.prepareStatement("INSERT INTO chat (user_id,user_name,auction_id,message,color,date_created) VALUES (?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

			pst.setString(2, userName);
			pst.setString(3, auctionId);
			pst.setString(4, message);
			pst.setString(5, color);
			pst.setTimestamp(6, date);
			pst.executeUpdate();

			ResultSet rrss = pst.getGeneratedKeys();
			if(rrss.next()){
				numero=rrss.getInt(1);
            }
			
			return numero;
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
		return numero;
	}

	
	// read chat message from table "chat"
	public static ArrayList<Chat> readmessage(String auction_id, String last_message_id){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<Chat> chats= null;

		try{
			pst = conn.prepareStatement("select * from chat where auction_id = ? and id > ?");
			pst.setString(1, auction_id);
			pst.setString(2, last_message_id);
	
			rs = pst.executeQuery();
			int size =0;
			if (rs != null) 
			{
			  rs.beforeFirst();
			  rs.last();
			  size = rs.getRow();
			}
	
			rs.beforeFirst();
			 int i = 0;
			 chats = new ArrayList<Chat>();
			while(rs.next() && i<size){
				
				Chat chat = new Chat();
			
				chat.setId(rs.getString("id"));
			
				chat.setUserName(rs.getString("user_name"));
				chat.setAuctionId(rs.getString("auction_id"));
				chat.setMessage(rs.getString("message"));
				chat.setColor(rs.getString("color"));
				chat.setDateCreated(rs.getString("date_created"));
				
				chats.add(chat);	
				i++;
			}
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
		return chats;
	}
}//End of ChatDao

