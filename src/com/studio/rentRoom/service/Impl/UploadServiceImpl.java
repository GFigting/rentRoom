package com.studio.rentRoom.service.Impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studio.rentRoom.beans.Images;
import com.studio.rentRoom.beans.RoomDetail;
import com.studio.rentRoom.beans.UserLogin;
import com.studio.rentRoom.dao.UploadDao;
import com.studio.rentRoom.dao.Impl.UploadDaoImpl;
import com.studio.rentRoom.service.UploadService;
@Service("UploadService")
public class UploadServiceImpl implements UploadService {

	@Autowired
	UploadDao uploadDao = new UploadDaoImpl();
	
	
	//上传图片--身份证 头像 房屋
	@Override
	public boolean uploadImg(File file, String fileFileName, String uploadSort) {
		if(uploadImg(file,fileFileName,uploadSort,null)) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean uploadImg(File file, String fileFileName, String uploadSort, UserLogin userSession) {
		if(uploadDao.uploadImg(file,fileFileName,uploadSort,userSession)) {
			return true;
		}
		return false;
	}
	
	@Override
	public Integer saveRoom(RoomDetail roomDetail) {
		return uploadDao.saveRoom(roomDetail);
	}
	@Override
	public List<Images> getImage(Integer roomId) {
		return uploadDao.getImage(roomId);
	}

	/*
	 * 保存反馈
	 */
	@Override
	public void uploadReflection(String content, String email) {
		uploadDao.saveReflection(content,email);
	}
	

}
