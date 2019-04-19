package com.studio.rentRoom.dao;

import java.util.List;

import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.RoomDetail;
import com.studio.rentRoom.beans.UserLogin;

public interface MainDao {
	//以roomId查找
	public RoomDetail getBean(Integer roomId);
	
	//无条件查找
	public List<RoomDetail> getBeans();

	//我发布的房源
	public List<RoomDetail> getOwnerRoom(Owner owner);
}
