package com.oa.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.tomcat.util.http.fileupload.IOUtils;

public class AuctionDao {
	
	@SuppressWarnings("resource")
	public static void createAction( String itemName, String description, String imageFileName, String bidStart, String bidEnd, String initialPrice) 
		{
			Connection conn = Dao.getConnection();
			PreparedStatement pst = null;
	
			conn = Dao.getConnection();
			try{
				pst = conn.prepareStatement("SET GLOBAL max_allowed_packet=104857600;"); // 10 MB
				pst.executeUpdate();
				
				pst = conn.prepareStatement("INSERT into items (itemname, description, image) VALUES (?, ?, ?);");
				pst.setString(1, itemName);
				pst.setString(2, description);
				pst.setNString(3, imageFileName);
				pst.executeUpdate();
		
				pst = conn.prepareStatement("INSERT into auctions (bid_start_time, bid_end_time, bid_price_start) VALUES (?, ?, ?)");
				pst.setString(1, bidStart);
				pst.setString(2, bidEnd);
				pst.setString(3, initialPrice);
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
		}// end finally
	}// end method
}// end class
