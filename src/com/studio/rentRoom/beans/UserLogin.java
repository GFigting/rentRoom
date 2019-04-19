package com.studio.rentRoom.beans;

public class UserLogin {

	private Integer id;
	private String phone;
	private String password;

	private UserInfo userInfo;
	private Owner owner;
	
	public Owner getOwner() {
		return owner;
	}

	public void setOwner(Owner owner) {
		this.owner = owner;
	}

	
	public UserLogin(Integer id, String phone, String password) {
		super();
		this.id = id;
		this.phone = phone;
		this.password = password;
	}

	public UserLogin(String phone, String password) {
		super();
		this.phone = phone;
		this.password = password;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserLogin(String password) {
		super();
		this.password = password;
	}

	public UserLogin() {
	}

	@Override
	public String toString() {
		return "UserLogin [phone=" + phone + ", password=" + password + "]";
	}

}
