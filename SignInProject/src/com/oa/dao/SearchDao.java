package com.oa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;
import java.util.ArrayList;
import java.util.concurrent.ThreadLocalRandom;

import com.oa.helpers.ProductItem;
import com.oa.helpers.User;
import com.oa.utilities.Encryption;
import com.oa.utilities.Mailer;

//toDo: need to add category table and categoryId
/**
 * @author Julie
 *
 */
public class SearchDao {
	/**
	 * @param keyword
	 * @return productItem
	 */
	public static ArrayList<ProductItem> searchKeyword(String keyword){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<ProductItem> productItems= null;
		
		
		try{
			pst = conn.prepareStatement("select * from items WHERE itemname or itemname CONTAINS ?");
			pst.setString(1, keyword);
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
			if(rs.next() && i<size){
			
				ProductItem productItem = new ProductItem();
				
				productItem.setProductId(rs.getString("id"));
				productItem.setItemName(rs.getString("itemname"));
				productItem.setDesciption(rs.getString("description"));
				productItem.setDateCreated(rs.getString("date_created"));
				productItem.setDateModified(rs.getString("date_modified"));
				productItem.setImage(rs.getString("image"));
				productItems.add(productItem);
			
		}
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
        }	
		if(conn!=null) {
		try {
			
			conn.close();
		} catch (SQLException e) {}
		
		}
		return productItems;
	}
}//End of UserDao

