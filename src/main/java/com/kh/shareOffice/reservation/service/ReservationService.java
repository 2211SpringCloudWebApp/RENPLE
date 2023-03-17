package com.kh.shareOffice.reservation.service;

import java.util.List;

import com.kh.shareOffice.reservation.domain.Order;
import com.kh.shareOffice.reservation.domain.ReservationList;
import com.kh.shareOffice.user.domain.User;

public interface ReservationService {

	int insertOrder(Order order);

	List<String> selectReservationDateList(int ProductNo);

	List<ReservationList> selectReservationList(String userId);

	ReservationList selectOneByOrderNo(int orderNo);

	int deleteReservation(int orderNo);

	User selectOneById(String userId);

	List<Order> selectOrderNo(String userId);

	List<ReservationList> selectAllReservationList();

}
