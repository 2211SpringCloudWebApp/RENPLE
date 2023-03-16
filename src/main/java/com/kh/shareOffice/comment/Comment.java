package com.kh.shareOffice.comment;

import java.sql.Timestamp;

public class Comment {
	private int commentNo;
	private String commentContent;
	private Timestamp commentDate;
	private int questionNo;
	private String userId;
	
	// question의 일부분
	private String questionTitle;
	private String questionContent;
	private int viewCount;
	private Timestamp qCreateDate;
	private String questionFilename;
	private String questionFilepath;
	
	public Comment() {
		super();
	}

	public Comment(int commentNo, String commentContent, Timestamp commentDate, int questionNo, String userId,
			String questionTitle, String questionContent, int viewCount, Timestamp qCreateDate, String questionFilename,
			String questionFilepath) {
		super();
		this.commentNo = commentNo;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
		this.questionNo = questionNo;
		this.userId = userId;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.viewCount = viewCount;
		this.qCreateDate = qCreateDate;
		this.questionFilename = questionFilename;
		this.questionFilepath = questionFilepath;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Timestamp getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public Timestamp getqCreateDate() {
		return qCreateDate;
	}

	public void setqCreateDate(Timestamp qCreateDate) {
		this.qCreateDate = qCreateDate;
	}

	public String getQuestionFilename() {
		return questionFilename;
	}

	public void setQuestionFilename(String questionFilename) {
		this.questionFilename = questionFilename;
	}

	public String getQuestionFilepath() {
		return questionFilepath;
	}

	public void setQuestionFilepath(String questionFilepath) {
		this.questionFilepath = questionFilepath;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", commentContent=" + commentContent + ", commentDate=" + commentDate
				+ ", questionNo=" + questionNo + ", userId=" + userId + ", questionTitle=" + questionTitle
				+ ", questionContent=" + questionContent + ", viewCount=" + viewCount + ", qCreateDate=" + qCreateDate
				+ ", questionFilename=" + questionFilename + ", questionFilepath=" + questionFilepath + "]";
	}
	
}