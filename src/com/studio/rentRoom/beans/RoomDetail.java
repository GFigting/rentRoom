package com.studio.rentRoom.beans;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class RoomDetail {

	private Integer id;
	private String roomName;
	private float price;
	private String roomType;
	private float roomArea;
	private String towards;
	private String rentWay;
	private String floor;//Â¥²ã
	private String decoration;//×°ÐÞ
	private String facility;//ÅäÌ×ÉèÊ©
	private Date pubDate;
	private String location;
	
	private Set<Images> images = new HashSet<>();
	private Agents agents;
	private Owner owner;
	
	public Owner getOwner() {
		return owner;
	}
	public void setOwner(Owner owner) {
		this.owner = owner;
	}


	public RoomDetail() {
	}
	
	
	public RoomDetail(Integer id, String roomName, float price, String roomType, float roomArea, String towards,
			String rentWay, String floor, String decoration, String facility, Date pubDate, String location,
			Set<Images> images, Agents agents,Owner owner) {
		super();
		this.id = id;
		this.roomName = roomName;
		this.price = price;
		this.roomType = roomType;
		this.roomArea = roomArea;
		this.towards = towards;
		this.rentWay = rentWay;
		this.floor = floor;
		this.decoration = decoration;
		this.facility = facility;
		this.pubDate = pubDate;
		this.location = location;
		this.images = images;
		this.agents = agents;
		this.owner = owner;
	}


	public Set<Images> getImages() {
		return images;
	}

	public void setImages(Set<Images> images) {
		this.images = images;
	}

	public Agents getAgents() {
		return agents;
	}
	public void setAgents(Agents agents) {
		this.agents = agents;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public float getRoomArea() {
		return roomArea;
	}
	public void setRoomArea(float roomArea) {
		this.roomArea = roomArea;
	}
	public String getTowards() {
		return towards;
	}
	public void setTowards(String towards) {
		this.towards = towards;
	}
	public String getRentWay() {
		return rentWay;
	}
	public void setRentWay(String rentWay) {
		this.rentWay = rentWay;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getDecoration() {
		return decoration;
	}
	public void setDecoration(String decoration) {
		this.decoration = decoration;
	}
	public String getFacility() {
		return facility;
	}
	public void setFacility(String facility) {
		this.facility = facility;
	}
	public Date getPubDate() {
		return pubDate;
	}
	public void setPubDate(Date pubDate) {
		this.pubDate = pubDate;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
}