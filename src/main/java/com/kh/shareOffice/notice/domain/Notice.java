package com.kh.shareOffice.notice.domain;

import java.sql.Timestamp;

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int viewCount;
	private Timestamp nCreateDate;
	private String noticeFilename;
	private String noticeFilepath;
	
	public Notice() {
		super();
	}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, int viewCount, Timestamp nCreateDate,
			String noticeFilename, String noticeFilepath) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.viewCount = viewCount;
		this.nCreateDate = nCreateDate;
		this.noticeFilename = noticeFilename;
		this.noticeFilepath = noticeFilepath;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public Timestamp getnCreateDate() {
		return nCreateDate;
	}

	public void setnCreateDate(Timestamp nCreateDate) {
		this.nCreateDate = nCreateDate;
	}

	public String getNoticeFilename() {
		return noticeFilename;
	}

	public void setNoticeFilename(String noticeFilename) {
		this.noticeFilename = noticeFilename;
	}

	public String getNoticeFilepath() {
		return noticeFilepath;
	}

	public void setNoticeFilepath(String noticeFilepath) {
		this.noticeFilepath = noticeFilepath;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", viewCount=" + viewCount + ", nCreateDate=" + nCreateDate + ", noticeFilename=" + noticeFilename
				+ ", noticeFilepath=" + noticeFilepath + "]";
	}

}
