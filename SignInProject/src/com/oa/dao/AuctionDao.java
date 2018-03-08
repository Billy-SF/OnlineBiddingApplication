package com.oa.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
				
				pst = conn.prepareStatement("select id from items");
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
				
				pst = conn.prepareStatement("INSERT into auctions (bid_start_time, bid_end_time, bid_price_start, items_fk, user_id, date_created) VALUES (?, ?, ?, ?, ?, ?)");
				pst.setString(1, bidStart);
				pst.setString(2, bidEnd);
				pst.setBigDecimal(3, initialPrice);
				pst.setInt(4, items_fk);
				pst.setInt(5, user_id);
				pst.setTimestamp(6, date); 
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
		Integer  items_fk = null;
		Integer user_id = null;
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

}// end class
