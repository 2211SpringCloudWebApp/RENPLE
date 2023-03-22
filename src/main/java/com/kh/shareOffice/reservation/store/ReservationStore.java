package com.kh.shareOffice.reservation.store;

import java.util.List;

import com.kh.shareOffice.reservation.Order;
import com.kh.shareOffice.reservation.ReservationList;
import com.kh.shareOffice.reservation.domain.PageInfo;
import com.kh.shareOffice.reservation.domain.SearchBoard;
import com.kh.shareOffice.user.User;

public interface ReservationStore {

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

	int getOrderSearchListCount(SearchBoard searchBoard);

	List<ReservationList> selectOrderBoard(PageInfo pi, String userId);

	List<ReservationList> selectReservationListByKeyword(PageInfo pi, SearchBoard searchBoard);

	int getAdminOrderListCount();

	List<ReservationList> selectAdminOrderBoard(PageInfo pi);

	int getAdminOrderSearchListCount(SearchBoard searchBoard);

	List<ReservationList> selectAdminReservationListByKeyword(PageInfo pi, SearchBoard searchBoard);



}
