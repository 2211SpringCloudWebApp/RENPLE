package com.kh.shareOffice.comment.domain;

import java.sql.Timestamp;

public class Comment {
	private int commentNo;
	private String userId;
	private int questionNo;
	private int reviewNo;
	private int noticeNo;
	private String commnetContent;
	private Timestamp cCreateDate;
	
	public Comment() {
		super();
	}

	public Comment(int commentNo, String userId, int questionNo, int reviewNo, int noticeNo, String commnetContent,
			Timestamp cCreateDate) {
		super();
		this.commentNo = commentNo;
		this.userId = userId;
		this.questionNo = questionNo;
		this.reviewNo = reviewNo;
		this.noticeNo = noticeNo;
		this.commnetContent = commnetContent;
		this.cCreateDate = cCreateDate;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getCommnetContent() {
		return commnetContent;
	}

	public void setCommnetContent(String commnetContent) {
		this.commnetContent = commnetContent;
	}

	public Timestamp getcCreateDate() {
		return cCreateDate;
	}

	public void setcCreateDate(Timestamp cCreateDate) {
		this.cCreateDate = cCreateDate;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", userId=" + userId + ", questionNo=" + questionNo + ", reviewNo="
				+ reviewNo + ", noticeNo=" + noticeNo + ", commnetContent=" + commnetContent + ", cCreateDate="
				+ cCreateDate + "]";
	}
	
}
