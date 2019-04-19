package com.studio.rentRoom.dao.Impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.studio.rentRoom.beans.Agents;
import com.studio.rentRoom.beans.Images;
import com.studio.rentRoom.beans.RoomDetail;
import com.studio.rentRoom.beans.UserInfo;
import com.studio.rentRoom.beans.UserLogin;
import com.studio.rentRoom.dao.BaseDao;
import com.studio.rentRoom.dao.UploadDao;
import com.studio.rentRoom.dao.UserDao;

@Repository("UploadDao")
public class UploadDaoImpl extends BaseDao implements UploadDao {

	List<String> imgUrl = new ArrayList<>();

	@Override
	public boolean uploadImg(File file, String fileFileName, String uploadSort) {
		return uploadImg(file,fileFileName,uploadSort,null);
	}
	@Override
	public boolean uploadImg(File file, String fileFileName, String uploadSort, UserLogin userSession) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd/");
		Date date=new Date();
		String datePath=sdf.format(date);
		String dir = "C:/apache-tomcat-9.0.11/UploadFiles/"+ uploadSort +"/" + datePath;
		try {
			fileInput(dir, file, fileFileName);
			String uploadSqlPath = uploadSqlPath(fileFileName,uploadSort);
			if(uploadSort.equals("HeadImg")) {
				saveHeadImg(uploadSqlPath,userSession);
			}
			if(uploadSort.equals("RoomImg")) {
				imgUrl.add(uploadSqlPath);
			}
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public UserInfo changeName(String name, UserLogin userSession) {
		return saveName(name,userSession);
	}
	
	//保存昵称
	private UserInfo saveName(String name, UserLogin userSession) {
		return saveUserInfo(name,null,userSession);
	}
	//保存头像
	private void saveHeadImg(String uploadSqlPath, UserLogin userSession) {
		saveUserInfo(null,uploadSqlPath,userSession);
	}
	
	private UserInfo saveUserInfo(String name, String headImg, UserLogin userSession) {
		Integer userId = isExistUser(userSession);
		System.out.println("userId---"+userId);
		UserLogin uLogin = (UserLogin) getSession().get(UserLogin.class, userId);
		System.out.println("uLogin---"+uLogin);
		UserInfo userInfo = null;
		if (uLogin.getUserInfo() == null) {//还不存在个人信息
			userInfo = new UserInfo();
			userInfo.setHeadImg(headImg);
			userInfo.setName(name);
			userInfo.setUserLogin(uLogin);
			getSession().save(userInfo);
		}else {//已有个人信息
			String hql = "from UserInfo u where u.userLogin = :userLogin";
			Query query = getSession().createQuery(hql).setParameter("userLogin", uLogin);
			List<UserInfo> list = query.list();
			if(list.size() > 0) {
				userInfo = list.get(0);
				System.out.println("userInfo---"+userInfo);
				if(headImg != null || userInfo.getHeadImg().equals(""))
					userInfo.setHeadImg(headImg);
				if(name != null || userInfo.getName().equals(""))
					userInfo.setName(name);
				getSession().update(userInfo);
			}
		}
		return userInfo;
	}
	

	private String uploadSqlPath(String fileFileName,String uploadSort) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd/");
		Date date=new Date();
		String datePath=sdf.format(date);
		System.out.println(datePath);
		
		
		String sqlPath = "Images/"+ uploadSort +"/"+datePath + fileFileName;
		System.out.println(sqlPath);
		
		return sqlPath;
	}

	@Override
	public Integer saveRoom(RoomDetail roomDetail) {
		
		Agents agents = roomDetail.getAgents();
		if(!isExistBean(agents.getPhone()))
			getSession().save(agents);
		
		getSession().save(roomDetail);
		int roomId = roomDetail.getId();
		System.out.println("roomId---" + roomId);
		Images img = null;
		for (String sqlPath : imgUrl) {
			img = new Images();
			img.setImgUrl(sqlPath);
			img.setRoomDetail(roomDetail);
			getSession().save(img);
		}
		imgUrl.clear();
		return roomId;
	}

	private boolean isExistBean(String phone) {
		String hql = "from Agents a where a.phone = :phone";
		Query query = getSession().createQuery(hql);
		List list = query.setParameter("phone", phone).list();
		if(list.size() > 0) {
			return true;
		}
		return false;
	}
	@Override
	public List<Images> getImage(Integer roomId) {
		String hql = "from Images i where i.roomDetail = :roomDetail";
		Query query = getSession().createQuery(hql);
		RoomDetail roomDetail = new RoomDetail();
		roomDetail.setId(roomId);
		query.setParameter("roomDetail", roomDetail);
		
		return query.list();
	}

	/*
	 * 保存到硬盘方法
	 */
	private void fileInput(String dir, File file, String fileFileName) throws FileNotFoundException, IOException {
		File fileDir=new File(dir);
		if (!fileDir.isDirectory() && !fileDir.exists()) { //如果不存在 则创建
			fileDir.mkdirs();
		} 
		FileOutputStream out = new FileOutputStream(fileDir + "/" + fileFileName);
		FileInputStream in = new FileInputStream(file);
		
		byte [] buffer = new byte[1024];
		int len = 0;
		
		while((len = in.read(buffer)) != -1){
			out.write(buffer, 0, len);
		}
		
		out.close();
		in.close();
	}
	@Override
	public void saveReflection(String content, String email) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd/");
		Date date=new Date();
		String datePath=sdf.format(date);
		String dir = "C:/apache-tomcat-9.0.11/UploadFiles/reflection/" + datePath;
		String data = content + "-----" + email;//要保存的数据
		File fileDir = new File(dir);
		if (!fileDir.isDirectory() && !fileDir.exists()) { //如果不存在 则创建
			fileDir.mkdirs();
		}
		try {
			PrintWriter pw=new PrintWriter(fileDir+"/"+System.currentTimeMillis()+".txt");
			pw.write(data);
			pw.flush();
			pw.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
