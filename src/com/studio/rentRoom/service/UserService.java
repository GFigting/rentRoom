package com.studio.rentRoom.service;

import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.UserInfo;
import com.studio.rentRoom.beans.UserLogin;

public interface UserService {

	/*
	 * 登录验证
	 */
	public UserLogin check(UserLogin userLogin);
	
	public boolean isExistPhone(String phone);

	/*
	 * 房主
	 */
	public void saveOwner(Owner owner);

	/*
	 * 注册用户
	 */
	public void saveUser(UserLogin userLogin);

	/*
	 * 忘记密码
	 */
	public void changePasswd(UserLogin userLogin);

	/*
	 * 修改昵称
	 */
	public UserInfo changeName(String name, UserLogin userSession);
}
