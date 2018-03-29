package com.oa.helpers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class Chat {
	
	private String id;

	private String userName;
	private String auctionId;
	private String message;
    private String color;
	private String dateCreated;

	public Chat() {
		//this.color = "000000";
		//DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		//Date today = Calendar.getInstance().getTime(); 
		//this.dateCreated = df.format(today);
	}
	
	public String getId() {
		return this.id;
	}
	public void setId(String id) {
		this.id = id; 
	}
	

	public String getUserName() {
		return this.userName;
	}

	public String getAuctionId() {
		return this.auctionId;
	}
	public void setAuctionId(String auctionId) {
		this.auctionId = auctionId;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getMessage() {
		return this.message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
	public String getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getColor() {
		return color;
	}
	
	public void setColor(String color) {
		this.color = color;
		
	}
}
