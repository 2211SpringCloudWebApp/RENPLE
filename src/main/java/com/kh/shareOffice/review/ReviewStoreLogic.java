package com.kh.shareOffice.review;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewStoreLogic implements ReviewStore{

	@Override
	public int insertReview(SqlSession session, Review review) {
		int result = session.insert("ReviewMapper.insertReview", review);
		return result;
	}

	@Override
	public int updateReview(SqlSession session, Review review) {
		int result = session.update("ReviewMapper.updateReview", review);
		return result;
	}

	@Override
	public int deleteReview(SqlSession session, int reviewNo) {
		int result = session.delete("ReviewMapper.deleteReview", reviewNo);
		return result;
	}

	@Override
	public Review selectOneByNo(SqlSession session, int reviewNo) {
		Review review = session.selectOne("ReviewMapper.selectOneByNo", reviewNo);
		return review;
	}

	@Override
	public List<Review> selectReviewList(SqlSession session, ReviewPageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> rList = session.selectList("ReviewMapper.selectReviewList", null, rowBounds);
		return rList;
	}
	
	@Override
	public List<Review> selectReviewListByold(SqlSession session, ReviewPageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> rList = session.selectList("ReviewMapper.selectReviewListByOld", null, rowBounds);
		return rList;
	}

	@Override
	public List<Review> selectReviewListByLikeCount(SqlSession session, ReviewPageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> rList = session.selectList("ReviewMapper.selectReviewListByLikeCount", null, rowBounds);
		return rList;
	}

	@Override
	public List<Review> selectReviewListByViewCount(SqlSession session, ReviewPageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> rList = session.selectList("ReviewMapper.selectReviewListByViewCount", null, rowBounds);
		return rList;
	}

	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("ReviewMapper.getListCount");
		return result;
	}
	
	@Override
	public void updateViewCount(SqlSession session, Integer reviewNo) throws Exception {
		session.update("ReviewMapper.viewCount", reviewNo);
	}

	@Override
	public int getListCount(SqlSession session, ReviewSearch search) {
		int result = session.selectOne("ReviewMapper.getSearchListCount", search);
		return result;
	}

	@Override
	public List<Review> selectListByKeyword(SqlSession session, ReviewPageInfo pi, ReviewSearch search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = ( currentPage - 1 ) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> searchList = session.selectList("ReviewMapper.selectListByKeyword", search, rowBounds);
		return searchList;
	}

	@Override
	public void updateLikeCount(SqlSession session, int reviewNo) throws Exception {
		session.update("ReviewMapper.updateLikeCount", reviewNo);
	}

}
