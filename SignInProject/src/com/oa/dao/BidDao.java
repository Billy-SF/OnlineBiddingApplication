package com.oa.dao;


import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;
import java.util.concurrent.ThreadLocalRandom;

import com.oa.helpers.User;

public class BidDao {
	String username;
	String password;
	String userId;
	String itemId;
	String AuctionId;
	String bidPrice;
	
public BidDao(String username, String password) {
	User user = UserDao.getUser(username, password);
	this.username = user.getUsername();
	this.password = user.getPassword();
	this.userId = user.getUserId();
}
public void updateUserBid(String auctionfk, String userId, String bidPrice, String itemId) {
	
	//Validate String to only contain set of numbers with a dot
	String pattern = "([0-9]*[.])?[0-9]+";
	if(bidPrice.matches(pattern)) {
		
		BigDecimal bidPrice2 = new BigDecimal("bidPrice");
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		System.out.print(rs);
		
		try {
			
			//Check the current price with the price the user wants to bid
			//INSERT INTO `ottawauction`.`bids` (`bid_price`,`auctions_fk`, `users_fk`, `date_created`) VALUES ('12.22','1','1','2018-01-22 12:12:12');
			pst = conn.prepareStatement("select highest_bid_price from currenthighestBidder where item_id_fk = ?");
			pst.setString(1, itemId);
			rs = pst.executeQuery();
			
			
			if(bidPrice2.compareTo(rs.getBigDecimal(1)) >  0)
			{
				//Check with last highest bid time first 
				//Insert into bids the current bid
				//Insert highest bidtable/Update for the item the price and the user
			}
		}
		catch(Exception e)
		{
		        e.printStackTrace();
		        } finally {
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
	//Need AuctionId
	//Need Item_Id
	//Need current bid price on item in auction
	
	
	//Grab item id that's in the auction
	
	//Validate the price first, if it's correct and if it's higher than the current bid
	//Change the user who's holding the current highest bid for the item
	
	
	//Check time of bid vs end of bid date
	//Validate field as Big Decimal(no incorrect format)
	//Validate the bid price > (must be higher than current highest bid)
	//Insert into bids and insert into highest bid table
	
		
	}
}
