package com.kh.shareOffice.comments.domain;

import java.sql.Timestamp;

public class Comment {
	private int commentNo;
	private String commentContent;
	private Timestamp commentDate;
	private int questionNo;
	private String userId;
	
	public Comment() {
		super();
	}
	
	public Comment(int commentNo, String commentContent, Timestamp commentDate, int questionNo, String userId) {
		super();
		this.commentNo = commentNo;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
		this.questionNo = questionNo;
		this.userId = userId;
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

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", commentContent=" + commentContent + ", commentDate=" + commentDate
				+ ", questionNo=" + questionNo + ", userId=" + userId + "]";
	}

	
	
}
