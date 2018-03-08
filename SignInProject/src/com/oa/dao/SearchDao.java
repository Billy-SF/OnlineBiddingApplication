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
		ResultSet rs2 = null;
		ArrayList<ProductItem> productItems= null;
		
		//Todo: need to check auction table first
		try{
			pst = conn.prepareStatement("select * from items WHERE itemname REGEXP '[[:<:]]coin[[:>:]]' "
					+ "OR description REGEXP '[[:<:]]coin[[:>:]]' ORDER BY items.itemname ASC");
			//pst.setString(1, keyword);
			//pst.setString(2, keyword);
			
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
			 productItems = new ArrayList<ProductItem>();
			while(rs.next() && i<size){
			
				ProductItem productItem = new ProductItem();
			
				productItem.setProductId(rs.getString("id"));
				productItem.setItemName(rs.getString("itemname"));
				productItem.setDesciption(rs.getString("description"));
				productItem.setDateCreated(rs.getString("date_created"));
				productItem.setDateModified(rs.getString("date_modified"));
				productItem.setImage(rs.getString("image"));
				pst = conn.prepareStatement("select i.itemname, a.bid_end_time, b.bid_price "
						+ "from items i,auctions a, bids b where b.auctions_fk = a.id "
						+ "AND a.items_fk = i.id AND i.id = " + productItem.getProductId()+ "  order by  b.bid_price DESC Limit 1");
				rs2 = pst.executeQuery();
				if(rs2.next()) {
					productItem.setHighestPrice(rs2.getString("bid_price"));	
				}
				else {
					productItem.setHighestPrice("0.00");			
				}
	
				productItems.add(productItem);	
		}
			
			System.out.println("Arraylist is size" + productItems.size() );
			
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
		
		return productItems;
	}
	
	public static ArrayList<ProductItem> sortBy(String keyword, String sortMethod){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ArrayList<ProductItem> productItems= null;
		
		try{
			pst = conn.prepareStatement("select * from items WHERE itemname REGEXP '[[:<:]]coin[[:>:]]' "
					+ "OR description REGEXP '[[:<:]]coin[[:>:]]'");
			//pst.setString(1, keyword);
			//pst.setString(2, keyword);
			
			rs = pst.executeQuery();
			int size =0;
			if (rs != null) 
			{
			  rs.beforeFirst();
			  rs.last();
			  size = rs.getRow();
			}
			
			System.out.println("ssssssssssss size is" + size);
			rs.beforeFirst();
			 int i = 0;
			 productItems = new ArrayList<ProductItem>();
			while(rs.next() && i<size){
			
				ProductItem productItem = new ProductItem();
			
				productItem.setProductId(rs.getString("id"));
				productItem.setItemName(rs.getString("itemname"));
				productItem.setDesciption(rs.getString("description"));
				productItem.setDateCreated(rs.getString("date_created"));
				productItem.setDateModified(rs.getString("date_modified"));
				productItem.setImage(rs.getString("image"));
				pst = conn.prepareStatement("select i.itemname, a.bid_end_time, b.bid_price "
						+ "from items i,auctions a, bids b where b.auctions_fk = a.id "
						+ "AND a.items_fk = i.id AND i.id = " + productItem.getProductId()+ "  order by  b.bid_price DESC Limit 1");
				rs2 = pst.executeQuery();
				if(rs2.next()) {
					productItem.setHighestPrice(rs2.getString("bid_price"));	
				}
				else {
					productItem.setHighestPrice("0.00");			
				}
	
				productItems.add(productItem);	
		}
			
		//Collections.sort(productItems, new ProductItem().compareTo(a, sortMethod));
			 Collections.sort(productItems, COMPARATOR);
			 
			System.out.println("Arraylist is size" + productItems.size() );
			
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
		
		
		
		
		
		return productItems;
		
	}
	
	

	  private static Comparator<ProductItem> COMPARATOR = new Comparator<ProductItem>(){
	    // This is where the sorting happens.
	        public int compare(ProductItem o1, ProductItem o2)
	        {
	        	if(Float.parseFloat(o1.getHighestPrice()) - Float.parseFloat(o2.getHighestPrice())>0.0) {
	        		return 1;
	        			
	        	}
	        	return -1;
	        
	            //return o1.getHighestPrice() - o2.getHighestPrice();
	        }
	    };
	     
	
}//End of UserDao

