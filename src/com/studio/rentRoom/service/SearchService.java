package com.studio.rentRoom.service;

import java.util.List;

import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.RoomDetail;
import com.studio.rentRoom.beans.UserLogin;

public interface SearchService {

	public List<RoomDetail> getResult(String condition, String search);
	
	public long getCount(String condition, String search);
	
	public RoomDetail getRoomDetailById(Integer id);

	//所有房源
	public List<RoomDetail> getAllRoom();

	
	//得到我发布的房源
	public List<RoomDetail> getOwnerRoom(Owner owner);

	//筛选结果
	public List<RoomDetail> select(String data, String time);
	//筛选条数
	public int selectNum(String data, String time);
	
}
