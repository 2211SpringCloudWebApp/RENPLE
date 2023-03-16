package com.kh.shareOffice.reservation.store;

import java.util.List;

import com.kh.shareOffice.reservation.domain.Order;
import com.kh.shareOffice.reservation.domain.ReservationList;

public interface ReservationStore {

	int insertOrder(Order order);

	List<String> selectReservationDateList(int ProductNo);

	List<ReservationList> selectReservationList(String userId);

	ReservationList selectOneByOrderNo(int orderNo);

	int deleteReservation(int orderNo);


}