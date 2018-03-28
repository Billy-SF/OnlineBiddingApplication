package com.oa.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.oa.helpers.Auction;
import com.oa.helpers.ProductItem;

public class AuctionDao {

	@SuppressWarnings("resource")
	public static void createAction( String itemName, String description, String imageFileName, String bidStart, String bidEnd, BigDecimal initialPrice, String username, String password) 
	{
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		Integer  items_fk = null;
		Integer user_id = null;

		conn = Dao.getConnection();
		try{
			pst = conn.prepareStatement("SET GLOBAL max_allowed_packet=104857600;"); // 10 MB
			pst.executeUpdate();

			pst = conn.prepareStatement("INSERT into items (itemname, description, image) VALUES (?, ?, ?);");
			pst.setString(1, itemName);
			pst.setString(2, description);
			pst.setNString(3, imageFileName);
			pst.executeUpdate();

			pst = conn.prepareStatement("select id from items where itemname = '" + itemName + "'");
			rs = pst.executeQuery();
			if(rs.next()){
				items_fk = rs.getInt("id");
			}

			pst = conn.prepareStatement("SELECT id FROM users WHERE username='" + username + "' and password='" + password + "'");
			rs = pst.executeQuery();
			if(rs.next()){
				user_id = rs.getInt("id");
			}

			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

			pst = conn.prepareStatement("INSERT into auctions (bid_start_time, bid_end_time, bid_price_start, items_fk, user_id, date_created, bid_state) VALUES (?, ?, ?, ?, ?, ?, ?)");
			pst.setString(1, bidStart);
			pst.setString(2, bidEnd);
			pst.setBigDecimal(3, initialPrice);
			pst.setInt(4, items_fk);
			pst.setInt(5, user_id);
			pst.setTimestamp(6, date);
			pst.setBoolean(7, true);
			pst.executeUpdate();

		} catch (Exception e) {
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
		}// end finally
	}// end method

	public static String MatchUserFromAuctionId(int auctionId) {

		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		String seller = "default";

		conn = Dao.getConnection();
		try{
			pst = conn.prepareStatement("select username from users where id in (select user_id from auctions where id = " + auctionId + ");");
			rs = pst.executeQuery();

			if(rs.next()){
				seller = "" + rs.getString("username");
			}

		} catch (Exception e) {
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
		return seller;
	}

	public static List<Auction> getClosedAuctions() {

		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Auction> soldAuctions = new ArrayList<Auction>();

		conn = Dao.getConnection();

		try{

			pst = conn.prepareStatement("select * from auctions where bid_end_time < now();");
			rs = pst.executeQuery();

			while (rs.next()) {
				Auction auction = new Auction();
				auction.setBidstarttime(rs.getString("bid_start_time"));
				auction.setBidendtime(rs.getString("bid_end_time"));
				auction.setBidpricestart(rs.getString("bid_price_start"));
				auction.setDateCreated(rs.getString("date_created"));
				auction.setItemsfk(rs.getString("items_fk"));
				auction.setUserid(rs.getString("user_id")); // auction creator
				auction.setId(rs.getString("id")); // auction id
				soldAuctions.add(auction);
			}

		} catch (Exception e) {
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
		}// end finally
		return soldAuctions;
	}// end method

	public static Map<String, String> getHighestBiderForAuctions(List<Auction> auctions){

		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		// Map <auctionId, username of the person that placed the highest bid for that auction>
		Map <String, String> usernamesMap = new HashMap<String, String>();

		conn = Dao.getConnection();

		try{
			for (Auction auction : auctions) {
				pst = conn.prepareStatement("select username from users where id in (select users_fk from bids where auctions_fk = '" + auction.getId() + "')");
				rs = pst.executeQuery();
				while(rs.next()) {
					usernamesMap.put(auction.getId(), rs.getString("username"));
				}
			}
		} catch (Exception e) {
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
		}// end finally
		return usernamesMap;
	}// end method

	public static Map<String, String> getHighestBidPriceForAucions(List<Auction> auctions){

		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;

		// Map <auctionId, highest bid price>
		Map <String, String> highestBidMap = new HashMap<String, String>();
		conn = Dao.getConnection();

		try{
			for (Auction auction : auctions) {
				pst = conn.prepareStatement("select * from currenthighestBidder where item_id_fk in (select items_fk from auctions where id = '" + auction.getId() + "')");
				rs = pst.executeQuery();
				while(rs.next()) {
					highestBidMap.put(auction.getId(), rs.getString("highest_bid_price"));
				}
			}
		} catch (Exception e) {
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
		}// end finally
		return highestBidMap;
	}// end method

	public static Map<String, ProductItem> getItemsForAuctions(List<Auction> auctions){

		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;

		// Map <auctionId, highest bid price for the auction>
		Map <String, ProductItem> itemMap = new HashMap<String, ProductItem>();
		conn = Dao.getConnection();

		try{
			for (Auction auction : auctions) {
				pst = conn.prepareStatement("select * from items where id in (select items_fk from auctions where id = '" + auction.getId() + "');");
				rs = pst.executeQuery();
				while(rs.next()) {
					ProductItem item = new ProductItem();
					item.setItemName(rs.getString("itemname"));
					item.setImage(rs.getString("image"));
					item.setProductId(rs.getString("id"));
					item.setDesciption(rs.getString("description"));
					itemMap.put(auction.getId(), item);
				}
			}
		} catch (Exception e) {
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
		}// end finally
		return itemMap;
	}// end method

	public static List<Auction> getOpenAuctions() {

		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Auction> soldAuctions = new ArrayList<Auction>();

		conn = Dao.getConnection();

		try{

			pst = conn.prepareStatement("select * from auctions where bid_end_time > now();");
			rs = pst.executeQuery();

			while (rs.next()) {
				Auction auction = new Auction();
				auction.setBidstarttime(rs.getString("bid_start_time"));
				auction.setBidendtime(rs.getString("bid_end_time"));
				auction.setBidpricestart(rs.getString("bid_price_start"));
				auction.setDateCreated(rs.getString("date_created"));
				auction.setItemsfk(rs.getString("items_fk"));
				auction.setUserid(rs.getString("user_id")); // auction creator
				auction.setId(rs.getString("id")); // auction id
				soldAuctions.add(auction);
			}

		} catch (Exception e) {
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
		}// end finally
		return soldAuctions;
	}// end method

	public static Map<String, String> getSellersForAucions(List<Auction> auctions){

		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;

		// Map <auctionId, highest bid price>
		Map <String, String> sellersMap = new HashMap<String, String>();
		conn = Dao.getConnection();

		try{
			for (Auction auction : auctions) {
				pst = conn.prepareStatement("select * from users where id in (select user_id from auctions where id = '" + auction.getId() + "')");
				rs = pst.executeQuery();
				while(rs.next()) {
					sellersMap.put(auction.getId(), rs.getString("username"));
				}
			}
		} catch (Exception e) {
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
		}// end finally
		return sellersMap;
	}// end method
	
}// end class
