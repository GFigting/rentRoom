package com.studio.rentRoom.dao;

import java.util.List;

import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.RoomDetail;
import com.studio.rentRoom.beans.UserLogin;

public interface MainDao {
	//��roomId����
	public RoomDetail getBean(Integer roomId);
	
	//����������
	public List<RoomDetail> getBeans();

	//�ҷ����ķ�Դ
	public List<RoomDetail> getOwnerRoom(Owner owner);
}
