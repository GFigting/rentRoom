package com.studio.rentRoom.service;

import java.util.List;

import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.RoomDetail;
import com.studio.rentRoom.beans.UserLogin;

public interface SearchService {

	public List<RoomDetail> getResult(String condition, String search);
	
	public long getCount(String condition, String search);
	
	public RoomDetail getRoomDetailById(Integer id);

	//���з�Դ
	public List<RoomDetail> getAllRoom();

	
	//�õ��ҷ����ķ�Դ
	public List<RoomDetail> getOwnerRoom(Owner owner);

	//ɸѡ���
	public List<RoomDetail> select(String data, String time);
	//ɸѡ����
	public int selectNum(String data, String time);
	
}
