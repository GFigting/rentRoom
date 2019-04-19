package com.studio.rentRoom.beans;

public class UserInfo {

	private Integer id;
	
	private String headImg;
	private String name;

	private UserLogin userLogin;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public UserLogin getUserLogin() {
		return userLogin;
	}

	public void setUserLogin(UserLogin userLogin) {
		this.userLogin = userLogin;
	}
	

	public UserInfo(String headImg, String name) {
		super();
		this.headImg = headImg;
		this.name = name;
	}

	public UserInfo() {}
}
