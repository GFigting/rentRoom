package com.studio.rentRoom.service;

import java.io.File;
import java.util.List;

import com.studio.rentRoom.beans.Images;
import com.studio.rentRoom.beans.RoomDetail;
import com.studio.rentRoom.beans.UserLogin;

public interface UploadService {

	public Integer saveRoom(RoomDetail roomDetail);

	public List<Images> getImage(Integer roomId);

	public boolean uploadImg(File file, String fileFileName, String uploadSort);

	public boolean uploadImg(File file, String fileFileName, String uploadSort, UserLogin userSession);

	public void uploadReflection(String content, String email);


}
