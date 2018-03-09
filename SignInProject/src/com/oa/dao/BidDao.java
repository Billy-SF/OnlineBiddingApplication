package com.oa.dao;


import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.oa.helpers.User;

public class BidDao {
	String username;
	String password;
	String userId;
	String itemId;

	public BidDao(String username, String password) {
		User user = UserDao.getUser(username, password);
		this.username = user.getUsername();
		this.password = user.getPassword();
		this.userId = user.getUserId();
	}
	public Boolean updateUserBid(String auctionfk, String userId, String bidPrice, String itemId) {

		//Validate user bid Price to only contain set of numbers and a decimal if applicable
		String pattern = "([0-9]*[.])?[0-9]+";
		//If the bid price is valid
		if(bidPrice.matches(pattern)) {

			BigDecimal bidPrice2 = new BigDecimal("bidPrice");
			Connection conn = Dao.getConnection();
			PreparedStatement pst = null;
			ResultSet rs = null;
			System.out.print(rs);

			try {

				//Check the current price with the price the user wants to bid
				pst = conn.prepareStatement("select highest_bid_price from currenthighestBidder where item_id_fk = ?");
				pst.setString(1, itemId);
				rs = pst.executeQuery();
				pst.close();

				//If The user entered price is bigger than the current price in the database
				if(bidPrice2.compareTo(rs.getBigDecimal(1)) >  0)
				{
					//Record the current date and time
					Date date = new GregorianCalendar().getTime();
					String dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:MM:SS").format(date);

					//Compare the time the user wants to bid at with the bidding time for the current item in the database
					pst = conn.prepareStatement("select bidding_time from currenthighestBidder where item_id_fk = ?");
					pst.setString(1, itemId);
					rs = pst.executeQuery();
					pst.close();

						//If new date is bigger then the one in the table
						if(date.compareTo(rs.getDate(1)) > 0 || !rs.next()) {
							//Insert into bids the current bid
							pst = conn.prepareStatement("INSERT INTO bids (bid_price,auctions_fk,users_fk,date_created) VALUES (?,?,?,?)");
							pst.setString(1, bidPrice);
							pst.setString(2, auctionfk);
							pst.setString(3, userId);
							pst.setString(4, dateFormat);
							rs = pst.executeQuery();
							pst.close();


							//If a user already holds the highest bid in the table just update the data to reflect the new highest bidder
							pst = conn.prepareStatement("select item_id_fk from currenthighestbidder where item_id_fk = ?");
							pst.setString(1, itemId);
							rs = pst.executeQuery();
							pst.close();

							//If the item is already in the table just update its data
							if(rs.getInt(1) == Integer.valueOf(itemId))
							{
								pst = conn.prepareStatement("Update currenthighestbidder set user_id_fk = ?, highest_bid_price = ?, bidding_time = ?");
								pst.setString(1, userId);
								pst.setString(3, bidPrice);
								pst.setString(4, dateFormat);
								pst.executeUpdate();
								pst.close();
							}
							else {
								// Otherwise add the bidder bid to the current highest bidder table
								pst = conn.prepareStatement("INSERT INTO currenthighestbidder (user_id_fk,item_id_fk,highest_bid_price, bidding_time) VALUES (?,?,?,?)");
								pst.setString(1, userId);
								pst.setString(2, itemId);
								pst.setString(3, bidPrice);
								pst.setString(4, dateFormat);
								rs = pst.executeQuery();
								pst.close();
							}
							return true;
						}
						return false;
				}
				return false;
				//Price is lower than the current one in the database
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
			return true;
		}
		return false;
	}
}
