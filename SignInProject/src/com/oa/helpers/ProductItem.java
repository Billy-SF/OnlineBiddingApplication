package com.oa.helpers;

import java.util.ArrayList;

public class ProductItem {
	
	private String itemName;
	private String description;
	private String productId;
	//private String dateModified;
	//private String dateCreated;
	private String image;
	private String highestPrice;
	private String lowestPrice;
	private Bid currentbid;
	private Auction auction;
	private ArrayList<Bid> bids;

	public ProductItem() {
		
		
		
	}
	
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName; 
	}
	public String getDescription() {
		return description;
	}
	public void setDesciption(String description) {
		this.description = description;
	}
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	//public String getDateModified() {
		//return dateModified;
	//}
	//public void setDateModified(String dateModified) {
		//this.dateModified = dateModified.replaceAll("\\.\\d+", "");;
	//}
	
	//public String getDateCreated() {
		//return dateCreated;
	//}
	//public void setDateCreated(String dateCreated) {
		//this.dateCreated = dateCreated.replaceAll("\\.\\d+", "");;
	//}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getHighestPrice() {
		return highestPrice;
	}
	public void setHighestPrice(String highestPrice) {
		this.highestPrice = highestPrice;
	}
	
	public String getLowestPrice() {
		return lowestPrice;
	}
	
	public void setLowestPrice(String lowestPrice) {
		this.lowestPrice = lowestPrice;
	}
	
	public Bid getCurrentbid() {
		return currentbid;
	}

	public void setCurrentbid(Bid currentbid) {
		this.currentbid = currentbid;
	}
	
	public Auction getAuction() {
		return auction;
	}
		
	public void setAuction(Auction auction) {
		this.auction = auction;
	}
	public ArrayList<Bid> getBids() {
		return bids;
	}
	
	public void setBids(ArrayList<Bid> bids) {
		this.bids = bids;
	}
		
}
