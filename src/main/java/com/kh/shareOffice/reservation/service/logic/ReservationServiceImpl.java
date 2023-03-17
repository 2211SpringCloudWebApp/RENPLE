package com.kh.shareOffice.reservation.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shareOffice.reservation.domain.Order;
import com.kh.shareOffice.reservation.domain.ReservationList;
import com.kh.shareOffice.reservation.service.ReservationService;
import com.kh.shareOffice.reservation.store.ReservationStore;
import com.kh.shareOffice.reservation.store.logic.ReservationStoreLogic;
import com.kh.shareOffice.user.domain.User;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationStore rStore;

	@Override
	public int insertOrder(Order order) {
		int result = rStore.insertOrder(order);
		return result;
	}

	@Override
	public List<String> selectReservationDateList(int ProductNo) {
		List<String> rList = rStore.selectReservationDateList(ProductNo);
		return rList;
	}

	@Override
	public List<ReservationList> selectReservationList(String userId) {
		List<ReservationList> rList = rStore.selectReservationList(userId);
		return rList;
	}

	@Override
	public ReservationList selectOneByOrderNo(int orderNo) {
		ReservationList order = rStore.selectOneByOrderNo(orderNo);
		return order;
	}

	@Override
	public int deleteReservation(int orderNo) {
		int result = rStore.deleteReservation(orderNo);
		return result;
	}

	@Override
	public User selectOneById(String userId) {
		User user = rStore.selectOneById(userId);
		return user;
	}

	@Override
	public List<Order> selectOrderNo(String userId) {
		List<Order> checkOrderNo = rStore.selectOrderNo(userId);
		return checkOrderNo;
	}

	@Override
	public List<ReservationList> selectAllReservationList() {
		List<ReservationList> rList = rStore.selectAllReservationList();
		return rList;
	}

	
}
