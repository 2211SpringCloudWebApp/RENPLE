package com.kh.shareOffice.review.service;

import java.util.List;

import com.kh.shareOffice.review.domain.PageInfo;
import com.kh.shareOffice.review.domain.Review;
import com.kh.shareOffice.review.domain.Search;

public interface ReviewService {

	/**
	 * 후기글 작성 Service
	 * @param review
	 * @param mpRequest 
	 * @return int
	 */
	public int insertReview(Review review);
	
	/**
	 * 후기글 수정 Service
	 * @param review
	 * @return int
	 */
	public int updateReview(Review review);

	/**
	 * 후기글 삭제 Service
	 * @param reviewNo
	 * @return int
	 */
	public int deleteReview(int reviewNo);

	/**
	 * 후기글 상세 Service
	 * @param reviewNo
	 * @return Review
	 * @throws Exception 
	 */
	public Review selectOneByNo(int reviewNo) throws Exception;
	
	/**
	 * 후기글 목록 Service
	 * @param pi
	 * @return List<Review>
	 */
	public List<Review> selectReviewList(PageInfo pi);

	/**
	 * 목록 오래된순 정렬 Service
	 * @param pi
	 * @return List<Review>
	 */
	public List<Review> selectReviewListByold(PageInfo pi);

	/**
	 * 목록 좋아요순 정렬 Sevice
	 * @param pi
	 * @return List<Review>
	 */
	public List<Review> selectReviewListByLikeCount(PageInfo pi);

	/**
	 * 목록 조회수순 정렬 Sevice
	 * @param pi
	 * @return List<Review>
	 */
	public List<Review> selectReviewListByViewCount(PageInfo pi);

	/**
	 * 후기글 전체 개수 Service
	 * @return int
	 */
	public int getListCount();

	/**
	 * 후기글 검색 게시물 전체 개수 Service
	 * @param search
	 * @return int
	 */
	public int getListCount(Search search);

	/**
	 * 후기글 검색 Service
	 * @param pi
	 * @param search
	 * @return List<Review>
	 */
	public List<Review> selectListByKeyword(PageInfo pi, Search search);

}
