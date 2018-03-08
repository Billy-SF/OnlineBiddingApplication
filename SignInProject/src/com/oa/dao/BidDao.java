package com.oa.dao;

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
					auction.setDatemodified(rs.getString("date_modified"));
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

