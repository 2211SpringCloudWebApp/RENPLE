package com.kh.shareOffice.reservation.service;

import java.util.List;

import com.kh.shareOffice.product.domain.Product;
import com.kh.shareOffice.reservation.domain.Order;
import com.kh.shareOffice.reservation.domain.PageInfo;
import com.kh.shareOffice.reservation.domain.ReservationList;
import com.kh.shareOffice.reservation.domain.SearchBoard;
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

	int modifyReservation(Order order);

	int getOrderListCount(String userId);

	List<ReservationList> selectOrderBoard(PageInfo pi, String userId);

	int getOrderSearchListCount(SearchBoard searchBoard);

	List<ReservationList> selectReservationListByKeyword(PageInfo pi, SearchBoard searchBoard);

	int getAdminOrderListCount();

	List<ReservationList> selectAdminOrderBoard(PageInfo pi);

	int getAdminOrderSearchListCount(SearchBoard searchBoard);

	List<ReservationList> selectAdminReservationListByKeyword(PageInfo pi, SearchBoard searchBoard);



}
