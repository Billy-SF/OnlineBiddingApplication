package com.oa.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SellerFeedbackDao {
	
	public static void updateRating( String seller, String description, String rating) {
			Connection conn = Dao.getConnection();
			PreparedStatement pst = null;
			ResultSet rs = null;

			int numRatings = 0;
			int currentRating = 0;
			int numRows = 0;
			int userId = 0;

			conn = Dao.getConnection();
			try{

				pst = conn.prepareStatement("select * from users where username = \'" + seller + "\';");
				rs = pst.executeQuery();
				if(rs.next()) {
					userId = Integer.parseInt(rs.getString("id"));
					pst = conn.prepareStatement("insert into ratings (rating, description, user_id_fk) values (?, ?, ?);");
					pst.setString(1, rating);
					pst.setString(2, description);
					pst.setString(3, ("" + userId));
					pst.executeUpdate();
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
		}
	}
}
