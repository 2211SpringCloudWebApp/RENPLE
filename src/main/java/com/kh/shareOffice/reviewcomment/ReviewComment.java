package com.kh.shareOffice.reviewcomment;

import java.sql.Timestamp;

public class ReviewComment {
    private int commentNo;
    private String userId;
    private int reviewNo;
    private String commentContent;
    private Timestamp commentCreateDate;
    private Timestamp commentUpdateDate;

    public ReviewComment() {}

	public ReviewComment(int commentNo, String userId, int reviewNo, String commentContent, int parentNo,
			Timestamp commentCreateDate, Timestamp commentUpdateDate) {
		super();
		this.commentNo = commentNo;
		this.userId = userId;
		this.reviewNo = reviewNo;
		this.commentContent = commentContent;
		this.commentCreateDate = commentCreateDate;
		this.commentUpdateDate = commentUpdateDate;
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

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Timestamp getCommentCreateDate() {
		return commentCreateDate;
	}

	public void setCommentCreateDate(Timestamp commentCreateDate) {
		this.commentCreateDate = commentCreateDate;
	}

	public Timestamp getCommentUpdateDate() {
		return commentUpdateDate;
	}

	public void setCommentUpdateDate(Timestamp commentUpdateDate) {
		this.commentUpdateDate = commentUpdateDate;
	}

	@Override
	public String toString() {
		return "ReviewComment [commentNo=" + commentNo + ", userId=" + userId + ", reviewNo=" + reviewNo
				+ ", commentContent=" + commentContent + ", commentCreateDate=" + commentCreateDate
				+ ", commentUpdateDate=" + commentUpdateDate + "]";
	}

}
