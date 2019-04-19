package com.studio.rentRoom.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.UserLogin;
import com.studio.rentRoom.dao.BaseDao;
import com.studio.rentRoom.dao.UserDao;

@Repository("UserDao")
public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public List getUserLogin(UserLogin userLogin) {
		String hql = "from UserLogin u where u.phone = :phone";
		Query query = getSession().createQuery(hql);
		query.setParameter("phone", userLogin.getPhone());
		return query.list();
	}

	@Override
	public void saveUser(UserLogin userLogin) {
		if(isExistUser(userLogin) != null) {
			UserLogin uLogin = (UserLogin) getSession().get(UserLogin.class, isExistUser(userLogin));
			uLogin.setPassword(userLogin.getPassword());
			System.out.println("uLogin---" + uLogin);
			getSession().update(uLogin);
		}else {
			getSession().save(userLogin);
		}
	}

	@Override
	public void saveOwner(Owner owner) {
		getSession().save(owner);
	}

}
