package com.kh.shareOffice.reservation.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.shareOffice.reservation.Order;
import com.kh.shareOffice.reservation.ReservationList;
import com.kh.shareOffice.reservation.domain.PageInfo;
import com.kh.shareOffice.reservation.domain.SearchBoard;
import com.kh.shareOffice.reservation.store.ReservationStore;
import com.kh.shareOffice.user.User;

@Repository
public class ReservationStoreLogic implements ReservationStore{

	@Autowired
	private SqlSession session;

	/**
	 * 예약 성공시 주문 내역 등록
	 */
	@Override
	public int insertOrder(Order order) {
		int result = session.insert("ReservationMapper.insertOrder", order);
		return result;
	}
	
	/**
	 * 예약된 날짜 목록 조회 
	 *   - 유저가 예약하려고 할 때 이미 예약된 날짜는 선택 불가능하게 하기 위함.
	 */
	@Override
	public List<String> selectReservationDateList(int ProductNo) {
		List<String> rList = session.selectList("ReservationMapper.selectReservationDateList", ProductNo);
		return rList;
	}

	/**
	 * 예약 내역 목록 조회
	 */
	@Override
	public List<ReservationList> selectReservationList(String userId) {
		List<ReservationList> rList = session.selectList("ReservationMapper.selectReservationList", userId);
		return rList;
	}

	/**
	 * 예약 내역 상세 조회
	 */
	@Override
	public ReservationList selectOneByOrderNo(int orderNo) {
		ReservationList order = session.selectOne("ReservationMapper.selectOneByOrderNo", orderNo);
		return order;
	}

	@Override
	public int deleteReservation(int orderNo) {
		int result = session.delete("ReservationMapper.deleteReservation", orderNo);
		return result;
	}

	@Override
	public User selectOneById(String userId) {
		User user = session.selectOne("ReservationMapper.selectOneById", userId);
		return user;
	}

	@Override
	public List<Order> selectOrderNo(String userId) {
		List<Order> checkOrderNo = session.selectList("ReservationMapper.selectOrderNo",userId);
		return checkOrderNo;
	}

	@Override
	public List<ReservationList> selectAllReservationList() {
		List<ReservationList> rList = session.selectList("ReservationMapper.selectAllReservationList");
		return rList;
	}

	@Override
	public int modifyReservation(Order order) {
		int result = session.update("ReservationMapper.modifyReservation", order);
		return result;
	}

	@Override
	public int getOrderListCount(String userId) {
		int result = session.selectOne("ReservationMapper.getOrderListCount", userId);
		return result;
	}

	@Override
	public int getOrderSearchListCount(SearchBoard searchBoard) {
		int result = session.selectOne("ReservationMapper.getOrderSearchListCount", searchBoard);
		return result;
	}
	
	@Override
	public List<ReservationList> selectOrderBoard(PageInfo pi, String userId) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ReservationList> rList = session.selectList("ReservationMapper.selectOrderBoard", userId, rowBounds);
		return rList;
	}

	@Override
	public List<ReservationList> selectReservationListByKeyword(PageInfo pi, SearchBoard searchBoard) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ReservationList> rList = session.selectList("ReservationMapper.selectReservationListByKeyword",searchBoard, rowBounds);
		return rList;
	}

	@Override
	public int getAdminOrderListCount() {
		int result = session.selectOne("ReservationMapper.getAdminOrderListCount");
		return result;
	}

	@Override
	public List<ReservationList> selectAdminOrderBoard(PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ReservationList> rList = session.selectList("ReservationMapper.selectAdminOrderBoard", null, rowBounds);
		return rList;
	}

	@Override
	public int getAdminOrderSearchListCount(SearchBoard searchBoard) {
		int result = session.selectOne("ReservationMapper.getAdminOrderSearchListCount", searchBoard);
		return result;
	}

	@Override
	public List<ReservationList> selectAdminReservationListByKeyword(PageInfo pi, SearchBoard searchBoard) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ReservationList> rList = session.selectList("ReservationMapper.selectAdminReservationListByKeyword",searchBoard, rowBounds);
		return rList;
	}



	
}
