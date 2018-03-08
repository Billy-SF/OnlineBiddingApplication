package com.oa.helpers;

public class Bid {
	
	private String id;
	private String bidprice;
	private String auctionid;
		private Auction auction;

	private String userid;
		private User user;
	private String dateCreated;
	
	public Bid() {
		
		
		
	}
	
	public String getId() {
		return this.id;
	}
	public void setId(String id) {
		this.id = id; 
	}
	public String getBidprice() {
		return this.bidprice;
	}
	public void setBidprice(String bidprice) {
		this.bidprice = bidprice;
	}
	
	public String getAuctionid() {
		return this.auctionid;
	}
	public void setAuctionid(String auctionid) {
		this.auctionid = auctionid;
	}
	
	public Auction getAuction() {
		return this.auction;
	}
	public void setAuction(Auction auction) {
		this.auction = auction;
	}

	
	
	public String getUserid() {
		return this.userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public User getUser() {
		return this.user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	
	public String getDateCreated() {
		return this.dateCreated;
	}
	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}
	
	
}
