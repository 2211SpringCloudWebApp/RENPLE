package com.kh.shareOffice.reservation.store;

import java.util.List;

import com.kh.shareOffice.reservation.domain.Order;

public interface ReservationStore {

	int insertOrder(Order order);

	List<String> selectReservationDateList(int ProductNo);

}
