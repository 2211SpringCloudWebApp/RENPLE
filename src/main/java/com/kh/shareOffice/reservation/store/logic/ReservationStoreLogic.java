package com.kh.shareOffice.reservation.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.shareOffice.reservation.domain.Order;
import com.kh.shareOffice.reservation.store.ReservationStore;
import com.kh.shareOffice.user.domain.User;

@Repository
public class ReservationStoreLogic implements ReservationStore{

	@Autowired
	private SqlSession session;

	@Override
	public int insertOrder(Order order) {
		int result = session.insert("ReservationMapper.insertOrder", order);
		return result;
	}

	@Override
	public List<String> selectReservationDateList(int ProductNo) {
		List<String> rList = session.selectList("ReservationMapper.selectReservationDateList", ProductNo);
		return rList;
	}
	
	
//	@Override
//	public int insertUser(User user) {
//		int result = session.insert("UserMapper.insertUser", user);
//		return result;
//	}
}
