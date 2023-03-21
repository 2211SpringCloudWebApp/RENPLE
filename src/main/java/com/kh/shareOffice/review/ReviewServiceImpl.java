package com.kh.shareOffice.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewStore rStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertReview(Review review){
		int result = rStore.insertReview(session, review);
		return result;
	}

	@Override
	public int updateReview(Review review) {
		int result = rStore.updateReview(session, review);
		return result;
	}

	@Override
	public int deleteReview(int reviewNo) {
		int result = rStore.deleteReview(session, reviewNo);
		return result;
	}

	@Override
	public Review selectOneByNo(int reviewNo) throws Exception {
		Review review = rStore.selectOneByNo(session, reviewNo);
		rStore.updateViewCount(session, reviewNo);
		return review;
	}

	@Override
	public List<Review> selectReviewList(ReviewPageInfo pi) {
		List<Review> rList = rStore.selectReviewList(session, pi);
		return rList;
	}

	@Override
	public List<Review> selectReviewListByold(ReviewPageInfo pi) {
		List<Review> rList = rStore.selectReviewListByold(session, pi);
		return rList;
	}

	@Override
	public List<Review> selectReviewListByLikeCount(ReviewPageInfo pi) {
		List<Review> rList = rStore.selectReviewListByLikeCount(session, pi);
		return rList;
	}

	@Override
	public List<Review> selectReviewListByViewCount(ReviewPageInfo pi) {
		List<Review> rList = rStore.selectReviewListByViewCount(session, pi);
		return rList;
	}

	@Override
	public int getListCount() {
		int result = rStore.getListCount(session);
		return result;
	}

	@Override
	public int getListCount(ReviewSearch search) {
		int totalCount = rStore.getListCount(session, search);
		return totalCount;
	}

	@Override
	public List<Review> selectListByKeyword(ReviewPageInfo pi, ReviewSearch search) {
		List<Review> searchList = rStore.selectListByKeyword(session, pi, search);
		return searchList;
	}

	@Override
	public void updateReviewLike(int reviewNo) throws Exception {
		rStore.updateLikeCount(session, reviewNo);
	}

 }
