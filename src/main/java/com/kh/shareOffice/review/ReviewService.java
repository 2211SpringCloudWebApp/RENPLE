package com.kh.shareOffice.review;

import java.util.List;

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
	public List<Review> selectReviewList(ReviewPageInfo pi);

	/**
	 * 목록 오래된순 정렬 Service
	 * @param pi
	 * @return List<Review>
	 */
	public List<Review> selectReviewListByold(ReviewPageInfo pi);

	/**
	 * 목록 좋아요순 정렬 Sevice
	 * @param pi
	 * @return List<Review>
	 */
	public List<Review> selectReviewListByLikeCount(ReviewPageInfo pi);

	/**
	 * 목록 조회수순 정렬 Sevice
	 * @param pi
	 * @return List<Review>
	 */
	public List<Review> selectReviewListByViewCount(ReviewPageInfo pi);

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
	public int getListCount(ReviewSearch search);

	/**
	 * 후기글 검색 Service
	 * @param pi
	 * @param search
	 * @return List<Review>
	 */
	public List<Review> selectListByKeyword(ReviewPageInfo pi, ReviewSearch search);

	/**
	 * 후기글 좋아요 Service
	 * @param review
	 */
	public void updateReviewLike(int reviewNo) throws Exception;

}
