package com.studio.rentRoom.beans;

import java.util.HashSet;
import java.util.Set;

public class Owner {

	private Integer id;
	private String name;
	private String sex;
	private String identity;
	private String phone;
	private String images;
	
	private UserLogin userLogin;
	private Set<RoomDetail> roomDetails = new HashSet<>();
	
	
	public Set<RoomDetail> getRoomDetails() {
		return roomDetails;
	}

	public void setRoomDetails(Set<RoomDetail> roomDetails) {
		this.roomDetails = roomDetails;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public UserLogin getUserLogin() {
		return userLogin;
	}

	public void setUserLogin(UserLogin userLogin) {
		this.userLogin = userLogin;
	}

	public Owner(String name, String sex, String identity, String phone, String images, UserLogin userLogin) {
		super();
		this.name = name;
		this.sex = sex;
		this.identity = identity;
		this.phone = phone;
		this.images = images;
		this.userLogin = userLogin;
	}
	
	public Owner() {}
}
