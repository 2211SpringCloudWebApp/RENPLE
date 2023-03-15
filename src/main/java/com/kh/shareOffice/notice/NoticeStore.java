package com.kh.shareOffice.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public interface NoticeStore {

	List<Notice> noticeView();

	Notice selectOneById(SqlSession session, int noticeNo);

	int updateNotice(SqlSession session, Notice notice);

	int deleteNotice(SqlSession session, int noticeNo);

	int insertNotice(SqlSession session, Notice notice);
	
}