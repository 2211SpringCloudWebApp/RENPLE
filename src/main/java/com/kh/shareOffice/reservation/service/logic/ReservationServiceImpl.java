package com.kh.shareOffice.reservation.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shareOffice.reservation.Order;
import com.kh.shareOffice.reservation.ReservationList;
import com.kh.shareOffice.reservation.domain.PageInfo;
import com.kh.shareOffice.reservation.domain.SearchBoard;
import com.kh.shareOffice.reservation.service.ReservationService;
import com.kh.shareOffice.reservation.store.ReservationStore;
import com.kh.shareOffice.user.User;

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

	@Override
	public int modifyReservation(Order order) {
		int result = rStore.modifyReservation(order);
		return result;
	}

	// 페이징
	@Override
	public int getOrderListCount(String userId) {
		int result = rStore.getOrderListCount(userId);
		return result;
	}
	// 페이징
	@Override
	public List<ReservationList> selectOrderBoard(PageInfo pi, String userId) {
		List<ReservationList> rList = rStore.selectOrderBoard(pi, userId);
		return rList;
	}

	// 검색
	@Override
	public int getOrderSearchListCount(SearchBoard searchBoard) {
		int result = rStore.getOrderSearchListCount(searchBoard);
		return result;
	}

	@Override
	public List<ReservationList> selectReservationListByKeyword(PageInfo pi, SearchBoard searchBoard) {
		List<ReservationList> rList = rStore.selectReservationListByKeyword(pi, searchBoard);
		return rList;
	}

	// 관리자 - 예약 목록 페이징
	@Override
	public int getAdminOrderListCount() {
		int result = rStore.getAdminOrderListCount();
		return result;
	}

	@Override
	public List<ReservationList> selectAdminOrderBoard(PageInfo pi) {
		List<ReservationList> rList = rStore.selectAdminOrderBoard(pi);
		return rList;
	}

	@Override
	public int getAdminOrderSearchListCount(SearchBoard searchBoard) {
		int result = rStore.getAdminOrderSearchListCount(searchBoard);
		return result;
	}

	@Override
	public List<ReservationList> selectAdminReservationListByKeyword(PageInfo pi, SearchBoard searchBoard) {
		List<ReservationList> rList = rStore.selectAdminReservationListByKeyword(pi, searchBoard);
		return rList;
	}


	
}
