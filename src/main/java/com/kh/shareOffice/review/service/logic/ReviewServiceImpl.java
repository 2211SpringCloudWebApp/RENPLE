package com.kh.shareOffice.review.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shareOffice.review.domain.PageInfo;
import com.kh.shareOffice.review.domain.Review;
import com.kh.shareOffice.review.domain.Search;
import com.kh.shareOffice.review.service.ReviewService;
import com.kh.shareOffice.review.store.ReviewStore;

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
		rStore.updateLikeCount(session, reviewNo);
		return review;
	}

	@Override
	public List<Review> selectReviewList(PageInfo pi) {
		List<Review> rList = rStore.selectReviewList(session, pi);
		return rList;
	}

	@Override
	public List<Review> selectReviewListByold(PageInfo pi) {
		List<Review> rList = rStore.selectReviewListByold(session, pi);
		return rList;
	}

	@Override
	public List<Review> selectReviewListByLikeCount(PageInfo pi) {
		List<Review> rList = rStore.selectReviewListByLikeCount(session, pi);
		return rList;
	}

	@Override
	public List<Review> selectReviewListByViewCount(PageInfo pi) {
		List<Review> rList = rStore.selectReviewListByViewCount(session, pi);
		return rList;
	}

	@Override
	public int getListCount() {
		int result = rStore.getListCount(session);
		return result;
	}

	@Override
	public int getListCount(Search search) {
		int totalCount = rStore.getListCount(session, search);
		return totalCount;
	}

	@Override
	public List<Review> selectListByKeyword(PageInfo pi, Search search) {
		List<Review> searchList = rStore.selectListByKeyword(session, pi, search);
		return searchList;
	}

 }
