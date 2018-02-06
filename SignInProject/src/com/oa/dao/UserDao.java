package com.oa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;

import com.oa.helpers.User;
import com.oa.utilities.Encryption;


public class UserDao {
	public static User login(String username, String password){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		User user = null;
		//password = Encryption.decrypt(password);
		
		try{
			pst = conn.prepareStatement("select * from users where username=? and password=? OR email=? and password=?");
			pst.setString(1, username);
			pst.setString(2, password);
			pst.setString(3, username);
			pst.setString(4, password);
			rs = pst.executeQuery();
			if(rs.next()){
				user= new User();
				// ? Do we need it ? user.setUserId(rs.getString("userId"));
				user.setUsername(rs.getString("userName"));
				user.setFirstname(rs.getString("firstName"));
				user.setLastname(rs.getString("lastName"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
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
		return user;
	}
	
	public static User register(String username, String password, String firstname, String lastname, String email){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		User user = null;
		password = Encryption.decrypt(password); //NOT REQUIRED
		
		try{
			pst = conn.prepareStatement("SELECT id FROM users WHERE username=? OR email=?");
			pst.setString(1, username);
			pst.setString(2, email);
			rs = pst.executeQuery();
			if(!rs.next()){
				if (rs != null) {
	                try {
	                    rs.close();
	                    rs = null;
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
				if (pst != null) { 
	                try {
	                    pst.close();
	                    pst = null;
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
				pst = conn.prepareStatement("INSERT into users (firstname, lastname, username, password, email) VALUES (?, ?, ?, ?, ?)");
				pst.setString(1, firstname);
				pst.setString(2, lastname);
				pst.setString(3, username);
				pst.setString(4, password);
				pst.setString(5, email);
				pst.executeUpdate();
				
				if (pst != null) { 
	                try {
	                    pst.close();
	                    pst = null;
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
				// for what purpose do we need userName
				pst = conn.prepareStatement("SELECT id FROM users WHERE username=?");
				pst.setString(1, username);
				rs = pst.executeQuery();
				rs.next();
				user = new User();
				//user.setUserId(rs.getString("id"));
				user.setUsername(username);
				user.setFirstname(firstname);
				user.setLastname(lastname);
				user.setPassword(password);
				user.setEmail(email);
			}
		}catch (Exception e) {
            System.out.println(e);
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
		return user;
	}
	
	public static User getUser(String userID)
	{
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		User user = new User();
		// not sure if userId is needed
		try {
        	pst = conn.prepareStatement("SELECT * FROM users WHERE userId='" + userID + "'");
        	rs = pst.executeQuery();
        	
        	//Stores the results
        	while(rs.next())
        	{
        		user.setUserId(rs.getString("userId"));
        		user.setUsername(rs.getString("username"));
        		user.setPassword(null);
        		user.setFirstname(rs.getString("firstname"));
        		user.setLastname(rs.getString("lastname"));
        		user.setEmail(rs.getString("email"));
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
		return user;
	}//End of getUser
	
	public static void editProfile(String userId, String username, String firstname, String lastname, String email, String password)
	{
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		
		
		try {
        	pst = conn.prepareStatement("UPDATE users SET firstname='" + firstname + "', lastname='" + lastname
        								+ "', username='" + username + "', email='" + email + "', password='" + password + 
        								"' WHERE userId='" + userId + "';"); // userId?
			
     	
        	pst.executeUpdate();
        	
        }catch (SQLTimeoutException SQLte){
        	SQLte.printStackTrace();
    	}catch (SQLException SQLe){
    		SQLe.printStackTrace();
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
            
        }	
	}//End of editProfile
	
}//End of UserDao
