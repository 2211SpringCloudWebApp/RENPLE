package com.kh.shareOffice.question;

import java.sql.Timestamp;

public class Question {
	private int questionNo;
	private String userId;
	private String questionTitle;
	private String questionContent;
	private Timestamp qCreateDate;
	private String questionFilename;
	private String questionFilepath;
	
	// Comment의 일부분
	private int commentNo;
	private String commentContent;
	private Timestamp commentDate;
	
	public Question() {
		super();
	}

	public Question(int questionNo, String userId, String questionTitle, String questionContent, Timestamp qCreateDate,
			String questionFilename, String questionFilepath, int commentNo, String commentContent,
			Timestamp commentDate) {
		super();
		this.questionNo = questionNo;
		this.userId = userId;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.qCreateDate = qCreateDate;
		this.questionFilename = questionFilename;
		this.questionFilepath = questionFilepath;
		this.commentNo = commentNo;
		this.commentContent = commentContent;
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

	@Override
	public String toString() {
		return "Question [questionNo=" + questionNo + ", userId=" + userId + ", questionTitle=" + questionTitle
				+ ", questionContent=" + questionContent + ", qCreateDate=" + qCreateDate + ", questionFilename="
				+ questionFilename + ", questionFilepath=" + questionFilepath + ", commentNo=" + commentNo
				+ ", commentContent=" + commentContent + ", commentDate=" + commentDate + "]";
	}
	
}
