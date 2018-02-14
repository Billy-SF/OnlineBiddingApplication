package com.oa.helpers;

public class User {
	
	private String userId;
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String email;
	private String verificationCode;
	private int verificationState;
	private Address address;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userNumber) {
		this.userId = userNumber;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getVerificationCode() {
		return verificationCode;
	}
	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}
	public int getVerificationState() {
		return verificationState;
	}
	public void setVerificationState(int verificationState) {
		this.verificationState = verificationState;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
}
