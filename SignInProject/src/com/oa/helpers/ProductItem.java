package com.oa.helpers;

public class ProductItem {
	
	private String itemName;
	private String description;
	private String productId;
	private String dateModified;
	private String dateCreated;
	private String image;
	private String highestPrice;
	
	public ProductItem() {
		
		
		
	}
	
	public String getName() {
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
	
	public String getDateModified() {
		return dateModified;
	}
	public void setDateModified(String dateModified) {
		this.dateModified = dateModified;
	}
	
	public String getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}
	
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
		return highestPrice;
	}
	
	public void setLowestPrice(String highestPrice) {
		this.highestPrice = highestPrice;
	}
	
}
