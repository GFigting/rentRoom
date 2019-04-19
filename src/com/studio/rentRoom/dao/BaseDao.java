package com.studio.rentRoom.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.studio.rentRoom.beans.UserLogin;

public class BaseDao {
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.getCurrentSession();
	}
	
	public List checkPhone(String phone) {
		String hql = "from UserLogin u where u.phone = :phone";
		Query query = getSession().createQuery(hql);
		query.setParameter("phone", phone);
		List<UserLogin> list = query.list();
		return list;
	}

	/*
	 * 检查是否存在此用户
	 */
	public Integer isExistUser(UserLogin userLogin){
		List phone = checkPhone(userLogin.getPhone());
		System.out.println("isExistUser---"+phone);
		if(phone.size() > 0) {
			UserLogin UserLogin = (UserLogin) phone.get(0);
			return UserLogin.getId();
		}
		return null;
	}
}
