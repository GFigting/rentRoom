package com.studio.rentRoom.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.RoomDetail;
import com.studio.rentRoom.beans.UserLogin;
import com.studio.rentRoom.dao.BaseDao;
import com.studio.rentRoom.dao.MainDao;

@Repository("MainDao")
public class MainDaoImpl extends BaseDao implements MainDao {

	@Override
	public RoomDetail getBean(Integer roomId) {
		String hql = "from RoomDetail r LEFT OUTER JOIN FETCH r.agents where r.id = :id";
		Query query = getSession().createQuery(hql);
		List<RoomDetail> list = query.setParameter("id", roomId).list();
		for (RoomDetail roomDetail : list) {
			return roomDetail;
		}
		return null;
	}

	@Override
	public List<RoomDetail> getBeans() {
		String hql = "from RoomDetail r LEFT OUTER JOIN FETCH r.agents";
		Query query = getSession().createQuery(hql);
		return query.list();
	}

	@Override
	public List<RoomDetail> getOwnerRoom(Owner owner) {
		String hql = "from RoomDetail r LEFT OUTER JOIN FETCH r.agents where r.owner = :owner";
		Query query = getSession().createQuery(hql);
		return query.setParameter("owner", owner).list(); 
	}

}
