package com.studio.rentRoom.dao;

import java.util.List;

import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.UserLogin;

public interface UserDao {

	/*
	 * 获取login对象
	 */
	public List getUserLogin(UserLogin userLogin);
	
	/*
	 * 判断是否已存在用户
	 */
	public List checkPhone(String phone);

	/*
	 * 保存房主信息
	 */
	public void saveOwner(Owner owner);

	/*
	 * 注册用户
	 */
	public void saveUser(UserLogin userLogin);


}
