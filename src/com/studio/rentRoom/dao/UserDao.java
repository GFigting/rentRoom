package com.studio.rentRoom.dao;

import java.util.List;

import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.UserLogin;

public interface UserDao {

	/*
	 * ��ȡlogin����
	 */
	public List getUserLogin(UserLogin userLogin);
	
	/*
	 * �ж��Ƿ��Ѵ����û�
	 */
	public List checkPhone(String phone);

	/*
	 * ���淿����Ϣ
	 */
	public void saveOwner(Owner owner);

	/*
	 * ע���û�
	 */
	public void saveUser(UserLogin userLogin);


}
