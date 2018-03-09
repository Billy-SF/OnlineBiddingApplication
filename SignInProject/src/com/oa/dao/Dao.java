package com.oa.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dao {
	
	private Boolean isConnected = Boolean.FALSE;
	private Connection con;
	private static Dao dao = new Dao();
	
	public static Connection getConnection() {
		
		if(dao.isConnected) return dao.con;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "ottawauction";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "yA625113";
        try {
            Class.forName(driver).newInstance();
            dao.con = DriverManager.getConnection(url + dbName + 
            	"?verifyServerCertificate=false&useSSL=false"
            		, userName, password);
            dao.isConnected = Boolean.TRUE;
        } catch (Exception e) {
            e.printStackTrace();
        } 
        
        return dao.con;
    }
	
	public static void closeConnection() {
		
        if (dao.con != null) {
            try {
                dao.con.close();
                dao.isConnected = Boolean.FALSE;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
		
	}
}