package com.kh.shareOffice.reservation.service;

import java.util.List;

import com.kh.shareOffice.reservation.domain.Order;

public interface ReservationService {

	int insertOrder(Order order);

	List<String> selectReservationDateList(int ProductNo);

}
