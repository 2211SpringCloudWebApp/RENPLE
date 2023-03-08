package com.kh.shareOffice.review.domain;

import java.sql.Timestamp;

public class Review {
	private int reviewNo;
	private String userId;
	private int productNo;
	private String reviewTitle;
	private String reviewContent;
	private int reviewRating;
	private int viewCount;
	private Timestamp rCreateDate;
	private String reviewFilename;
	private String reviewFilepath;
	
	public Review() {
		super();
	}

	public Review(int reviewNo, String userId, int productNo, String reviewTitle, String reviewContent,
			int reviewRating, int viewCount, Timestamp rCreateDate, String reviewFilename, String reviewFilepath) {
		super();
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.productNo = productNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewRating = reviewRating;
		this.viewCount = viewCount;
		this.rCreateDate = rCreateDate;
		this.reviewFilename = reviewFilename;
		this.reviewFilepath = reviewFilepath;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getReviewRating() {
		return reviewRating;
	}

	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public Timestamp getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Timestamp rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public String getReviewFilename() {
		return reviewFilename;
	}

	public void setReviewFilename(String reviewFilename) {
		this.reviewFilename = reviewFilename;
	}

	public String getReviewFilepath() {
		return reviewFilepath;
	}

	public void setReviewFilepath(String reviewFilepath) {
		this.reviewFilepath = reviewFilepath;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", userId=" + userId + ", productNo=" + productNo + ", reviewTitle="
				+ reviewTitle + ", reviewContent=" + reviewContent + ", reviewRating=" + reviewRating + ", viewCount="
				+ viewCount + ", rCreateDate=" + rCreateDate + ", reviewFilename=" + reviewFilename
				+ ", reviewFilepath=" + reviewFilepath + "]";
	}
	
}
