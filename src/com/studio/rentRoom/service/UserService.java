package com.studio.rentRoom.service;

import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.UserInfo;
import com.studio.rentRoom.beans.UserLogin;

public interface UserService {

	/*
	 * ��¼��֤
	 */
	public UserLogin check(UserLogin userLogin);
	
	public boolean isExistPhone(String phone);

	/*
	 * ����
	 */
	public void saveOwner(Owner owner);

	/*
	 * ע���û�
	 */
	public void saveUser(UserLogin userLogin);

	/*
	 * ��������
	 */
	public void changePasswd(UserLogin userLogin);

	/*
	 * �޸��ǳ�
	 */
	public UserInfo changeName(String name, UserLogin userSession);
}
