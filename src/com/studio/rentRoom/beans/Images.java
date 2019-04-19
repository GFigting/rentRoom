package com.studio.rentRoom.beans;

public class Images {

	private Integer id;
	private String imgUrl;
	
	private RoomDetail roomDetail;
	
	
	public RoomDetail getRoomDetail() {
		return roomDetail;
	}
	public void setRoomDetail(RoomDetail roomDetail) {
		this.roomDetail = roomDetail;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public Images(Integer id, String imgUrl) {
		super();
		this.id = id;
		this.imgUrl = imgUrl;
	}
	
	public Images() {}
}
