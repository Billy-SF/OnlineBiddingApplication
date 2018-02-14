package com.oa.utilities;

import java.io.File;
import java.util.Scanner;

import com.oa.dao.Dao;
import com.oa.helpers.User;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.net.HttpURLConnection;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Mailer {

	private String recipient;
	private String code;

	public Mailer(String recipient, String code) {
		this.recipient = recipient;
		this.code = code;
	}

	public void send() {

		boolean haveKey = true;
		String apiKeyPath = null;
		String apiKey = null;

		/* get api key from file */
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;

		try{
			pst = conn.prepareStatement("select * from api_key");
			rs = pst.executeQuery();
			if(rs.next()) {
				apiKeyPath = rs.getString("code");
				File f = new File(apiKeyPath);
				Scanner s = null;
				try {
					s = new Scanner(f);
					if(s.hasNextLine()) {
						apiKey = s.nextLine();
					} else {
						haveKey = false;
					}
				} catch (java.io.FileNotFoundException e) {
					System.err.println("Unable to open file containing api key. Does it exist?");
				}
			} else {
				haveKey = false;
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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

		if (haveKey) {
			try {
				StringBuilder result = new StringBuilder();
				result.append("https://api.elasticemail.com/v2/email/send?apikey=");
				result.append(apiKey);
				result.append("&from=verify@aro.science");
				result.append("&subject=Verify+With+Ottawauction");
				result.append("&bodyText=Your+verification+code+is:+");
				result.append(code);
				result.append("&to=");
				result.append(recipient);

				URL url = new URL(result.toString());
				HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
				httpConn.setRequestMethod("GET");
				BufferedReader rd = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));
				String line;
				while ((line = rd.readLine()) != null) {
					result.append(line);
				}
				rd.close();
				System.out.println(result.toString());
			} catch (java.net.MalformedURLException e) {
			} catch (java.io.IOException e) {
			}
		}
	}
}
