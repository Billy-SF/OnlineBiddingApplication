package com.oa.helpers;

public class Address {
	private String id;
	private String city;
	private String postalcode;
	private String address;
	private String datecreated;
	private String datemodified;
	private String street;
	private String streetNo;

	public Address() {

	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPostalcode() {
		return this.postalcode;
	}

	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDatecreated() {
		return this.datecreated;
	}

	public void setDatecreated(String datecreated) {
		this.datecreated = datecreated.replaceAll("\\.\\d+", "");
	}

	public String getDatemodified() {
		return this.datemodified;
	}

	public void setDatemodified(String datemodified) {
		this.datemodified = datemodified.replaceAll("\\.\\d+", "");
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getStreetNo() {
		return streetNo;
	}

	public void setStreetNo(String streetNo) {
		this.streetNo = streetNo;
	}

}
