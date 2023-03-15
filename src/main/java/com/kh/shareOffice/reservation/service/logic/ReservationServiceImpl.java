package com.kh.shareOffice.reservation.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shareOffice.reservation.domain.Order;
import com.kh.shareOffice.reservation.service.ReservationService;
import com.kh.shareOffice.reservation.store.ReservationStore;
import com.kh.shareOffice.reservation.store.logic.ReservationStoreLogic;

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
	
}
