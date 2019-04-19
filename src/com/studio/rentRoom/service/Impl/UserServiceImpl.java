package com.studio.rentRoom.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.UserInfo;
import com.studio.rentRoom.beans.UserLogin;
import com.studio.rentRoom.dao.UploadDao;
import com.studio.rentRoom.dao.UserDao;
import com.studio.rentRoom.service.UserService;

@Service("UserService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private UploadDao uploadDao;

	@Override
	public UserLogin check(UserLogin userLogin) {
		UserLogin uLogin = (UserLogin) userDao.getUserLogin(userLogin).get(0);
		System.out.println("uLogin---" + uLogin);
		System.out.println("boolean---"+uLogin.getPassword().equals(userLogin.getPassword()));
		if (uLogin.getPassword().equals(userLogin.getPassword())) {
			return uLogin;
		}
		return null;
	}

	@Override
	public boolean isExistPhone(String phone) {
//		System.out.println(phone);
		List checkPhone = userDao.checkPhone(phone);
//		System.out.println(checkPhone.size());
		if(checkPhone.size() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public void saveOwner(Owner owner) {
		userDao.saveOwner(owner);
	}

	@Override
	public void saveUser(UserLogin userLogin) {
		userDao.saveUser(userLogin);
	}

	@Override
	public void changePasswd(UserLogin userLogin) {
		userDao.saveUser(userLogin);
	}

	@Override
	public UserInfo changeName(String name, UserLogin userSession) {
		return uploadDao.changeName(name, userSession);
	}

}
