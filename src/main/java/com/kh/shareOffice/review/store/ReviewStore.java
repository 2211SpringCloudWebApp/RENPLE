package com.kh.shareOffice.review.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.shareOffice.review.domain.PageInfo;
import com.kh.shareOffice.review.domain.Review;
import com.kh.shareOffice.review.domain.Search;

public interface ReviewStore {

	/**
	 * 후기글 작성 Store
	 * @param session
	 * @param review
	 * @param mpRequest 
	 * @return int
	 */
	public int insertReview(SqlSession session, Review review);

	/**
	 * 후기글 수정 Store
	 * @param session
	 * @param review
	 * @return int
	 */
	public int updateReview(SqlSession session, Review review);

	/**
	 * 후기글 삭제 Store
	 * @param session
	 * @param reviewNo
	 * @return int
	 */
	public int deleteReview(SqlSession session, int reviewNo);

	/**
	 * 후기글 상세 Store
	 * @param session
	 * @param reviewNo
	 * @return Review
	 */
	public Review selectOneByNo(SqlSession session, int reviewNo);

	/**
	 * 후기글 목록 Store
	 * @param session
	 * @param pi
	 * @return List<Review>
	 */
	public List<Review> selectReviewList(SqlSession session, PageInfo pi);

	/**
	 * 목록 오래된순 정렬 Service
	 * @param session
	 * @param pi
	 * @return List<Review>
	 */
	public List<Review> selectReviewListByold(SqlSession session, PageInfo pi);

	/**
	 * 목록 좋아요순 정렬 Sevice
	 * @param session
	 * @param pi
	 * @return List<Review>
	 */
	public List<Review> selectReviewListByLikeCount(SqlSession session, PageInfo pi);

	/**
	 * 목록 조회수순 정렬 Sevice
	 * @param session
	 * @param pi
	 * @return List<Review>
	 */
	public List<Review> selectReviewListByViewCount(SqlSession session, PageInfo pi);

	/**
	 * 후기글 전체 개수 Store
	 * @param session
	 * @return int
	 */
	public int getListCount(SqlSession session);
	
	/**
	 * 후기글 조회수 Store
	 * @param session
	 * @param reviewNo
	 * @throws Exception
	 */
	void updateViewCount(SqlSession session, Integer reviewNo) throws Exception;

	/**
	 * 후기글 검색 게시물 전체 개수 Store
	 * @param session
	 * @param search
	 * @return int
	 */
	public int getListCount(SqlSession session, Search search);

	/**
	 * 후기글 검색 Store
	 * @param session
	 * @param pi
	 * @param search
	 * @return List<Review>
	 */
	public List<Review> selectListByKeyword(SqlSession session, PageInfo pi, Search search);

	/**
	 * 좋아요 카운트 Store
	 * @param session
	 * @param reviewNo
	 * @throws Exception
	 */
	public void updateLikeCount(SqlSession session, int reviewNo) throws Exception;

}
