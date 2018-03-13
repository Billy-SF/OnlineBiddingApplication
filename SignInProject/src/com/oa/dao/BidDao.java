package com.oa.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.concurrent.ThreadLocalRandom;

import com.oa.helpers.Address;
import com.oa.helpers.Auction;
import com.oa.helpers.Bid;
import com.oa.helpers.ProductItem;
import com.oa.helpers.User;
import com.oa.utilities.Encryption;
import com.oa.utilities.Mailer;

//toDo: need to add category table and categoryId
/**
 * @author Julie
 *
 */
public class BidDao {
	/**
	 * @param keyword
	 * @return productItem
	 */
	String username;
	String password;
	//String userId;
	String itemId;
	public BidDao(String username, String password) {
		User user = UserDao.getUser(username, password);
		this.username = user.getUsername();
		this.password = user.getPassword();
		//this.userId = user.getUserId();
	}
	public Boolean updateUserBid(String auctionId, String userId, String bidPrice, String itemId) {
System.out.println("LISSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
		//Validate user bid Price to only contain set of numbers and a decimal if applicable
		String pattern = "([0-9]*[.])?[0-9]+";
		//If the bid price is valid
		if(bidPrice.matches(pattern)) 
		{

			BigDecimal bidPrice2 = new BigDecimal(bidPrice);
			Connection conn = Dao.getConnection();
			PreparedStatement pst = null;
			ResultSet rs = null;
			System.out.print(rs);
			//Record the current date and time
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			System.out.print("Date" + date);

			try {

				//Make sure the bid is bigger than the initial price
				pst = conn.prepareStatement("select bid_price_start from auctions where items_fk = ?");
				pst.setString(1, itemId);
				rs = pst.executeQuery();
				if(rs.next())
				{
					//If The user entered bid price is bigger than the initial bidding price for the item continue
					if(bidPrice2.compareTo(rs.getBigDecimal(1)) >  0)
					{
						pst = conn.prepareStatement("select highest_bid_price from currenthighestbidder where item_id_fk = ?");
						pst.setString(1, itemId);
						rs = pst.executeQuery();
						//If no bids was made for the item, just insert it straight into the db, otherwise continue validating
						if(rs.next())
						{
							//if the bid the user entered is bigger then the current highest bid 
							if(bidPrice2.compareTo(rs.getBigDecimal(2)) >  0)
							{
								pst = conn.prepareStatement("select bidding_time from currenthighestbidder where item_id_fk = ?");
								pst.setString(1, itemId);
								rs = pst.executeQuery();

								if(rs.next() == false) {
									System.out.println("Query to get time failed");
									return false;
								}
								//If the bidding time the user bid at is later then the last one in the table
								if(date.compareTo(rs.getDate(3)) > 0) 
								{
									//Insert into bids the current bid
									pst = conn.prepareStatement("INSERT INTO bids (bid_price,auctions_fk,users_fk,date_created) VALUES (?,?,?,?)");
									pst.setString(1, bidPrice);
									pst.setString(2, auctionId);
									pst.setString(3, userId);
									pst.setTimestamp(4, date);
									pst.executeUpdate();

									//Update current highest bidder holder for item 
									pst = conn.prepareStatement("Update currenthighestbidder set user_id_fk = ?, highest_bid_price = ?, bidding_time = ?");
									pst.setString(1, userId);
									pst.setString(2, bidPrice);
									pst.setTimestamp(3, date);
									pst.executeUpdate();
									return true;
								}
							}
							else 
							{
								System.out.print("the price the bidder gave to the item is smaller then the one currently in the db");
								return false;
							}
						}
						else
						{
							//Insert into bids the current bid
							pst = conn.prepareStatement("INSERT INTO bids (bid_price,auctions_fk,users_fk,date_created) VALUES (?,?,?,?)");
							pst.setString(1, bidPrice);
							pst.setString(2, auctionId);
							pst.setString(3, userId);
							pst.setTimestamp(4, date);
							pst.executeUpdate();

							pst = conn.prepareStatement("INSERT INTO currenthighestbidder (user_id_fk,item_id_fk,highest_bid_price, bidding_time) VALUES (?,?,?,?)");
							pst.setString(1, userId);
							pst.setString(2, itemId);
							pst.setString(3, bidPrice);
							pst.setTimestamp(4, date);
							pst.executeUpdate();
							return true;
						}
						return false;
					}
					//Price user entered for is smaller than initial bid price
					System.out.print("the price the bidder gave to the item is smaller then the one currently in the db");
					return false;
				}
				//Item either not existent or db problem
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
		}
		return false;
	}

	// to remove
	public static ArrayList<Bid> getBids(String productitemid){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ArrayList<Bid> bids= null;

		//Todo: need to check auction table first
		try{
			pst = conn.prepareStatement("select b.* from bids b, auctions a, items i where "
					+ " b.auctions_fk = a.id and a.items_fk = i.id and i.id=?");
			pst.setString(1, productitemid);

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
			bids = new ArrayList<Bid>();
			while(rs.next() && i<size){

				Bid bid = new Bid();

				bid.setId(rs.getString("id"));
				bid.setBidprice(rs.getString("bid_price"));
				bid.setAuctionid(rs.getString("auctions_fk"));
				bid.setUserid(rs.getString("users_fk"));
				bid.setDateCreated(rs.getString("date_created"));

				// get auction by auction_id
				pst = conn.prepareStatement("select * from auctions where id=?");
				pst.setString(1, bid.getAuctionid());
				rs2 = pst.executeQuery();
				if(rs2.next()) {
					Auction auction = new Auction();
					auction.setId(rs.getString("id"));
					auction.setBidstarttime(rs.getString("bid_start_time"));
					auction.setBidendtime(rs.getString("bid_end_time"));
					auction.setBidpricestart(rs.getString("bid_price_start"));
					auction.setBidpricemax(rs.getString("bid_price_max"));
					auction.setDescription(rs.getString("description"));
					auction.setItemsfk(rs.getString("items_fk"));
					auction.setUserid(rs.getString("user_id"));
					auction.setDateCreated(rs.getString("dateCreated"));
					//auction.setDatemodified(rs.getString("date_modified"));
					auction.setBidstate(rs.getString("bid_state"));

					bid.setAuction(auction);
				}
				else {
					//		
				}
				// get user by user_id
				pst = conn.prepareStatement("select * from users where id=?");
				pst.setString(1, bid.getUserid());
				rs2 = pst.executeQuery();
				if(rs2.next()) {
					User user = new User();
					user.setUserId(rs.getString("id"));
					user.setFirstname(rs.getString("firstname"));
					user.setLastname(rs.getString("lastname"));
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setEmail(rs.getString("email"));
					user.setVerificationCode(rs.getString("verification_code"));
					user.setVerificationState(Integer.parseInt(rs.getString("verified_state")));
					// get address user_id
					pst = conn.prepareStatement("select * from users where id=?");
					pst.setString(1, bid.getUserid());
					rs2 = pst.executeQuery();
					if(rs2.next()) {
						Address address = new Address();
						address.setId(rs.getString("id"));
						address.setCity(rs.getString("city"));
						address.setPostalcode(rs.getString("postal_code"));
						address.setAddress(rs.getString("address"));
						address.setDatecreated(rs.getString("date_created"));
						address.setDatemodified(rs.getString("date_modified"));

						user.setAddress(address);

					}
					else {
						//		
					}

					bid.setUser(user);
				}
				else {
					//		
				}



				bids.add(bid);	
			}

			//System.out.println("Size of Arraylist bids is " + bids.size() );

		}catch (Exception e) {
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

			if (rs2 != null) {
				try {
					rs2.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}	

		return bids;
	}



}//End of BidDao

