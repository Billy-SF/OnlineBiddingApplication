package com.oa.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao {
	
	public static void deleteAuction(String auctionId) {
			Connection conn = Dao.getConnection();
			PreparedStatement pst = null;
			ResultSet rs = null;

			conn = Dao.getConnection();
			try{

				pst = conn.prepareStatement("delete from auctions where id = \'" + auctionId + "\';");
				pst.execute();
				pst = conn.prepareStatement("delete from items where id = \'" + auctionId + "\';");
				pst.execute();

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
		}
	}
}
