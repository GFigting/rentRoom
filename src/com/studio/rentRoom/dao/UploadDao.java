package com.studio.rentRoom.dao;

import java.io.File;
import java.util.List;

import com.studio.rentRoom.beans.Images;
import com.studio.rentRoom.beans.RoomDetail;
import com.studio.rentRoom.beans.UserInfo;
import com.studio.rentRoom.beans.UserLogin;

public interface UploadDao {

	public Integer saveRoom(RoomDetail roomDetail);

	public List<Images> getImage(Integer roomId);
	
	public boolean uploadImg(File file, String fileFileName, String uploadSort);

	public boolean uploadImg(File file, String fileFileName, String uploadSort, UserLogin userSession);
	
	public UserInfo changeName(String name, UserLogin userSession);

	public void saveReflection(String content, String email);
	
	
}
