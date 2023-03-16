package com.kh.shareOffice.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.shareOffice.notice.domain.Notice;

public interface NoticeStore {

	List<Notice> noticeView();

	Notice selectOneById(SqlSession session, int noticeNo);

	int updateNotice(SqlSession session, Notice notice);

	int deleteNotice(SqlSession session, int noticeNo);

	int insertNotice(SqlSession session, Notice notice);

	int updateFileStatus(SqlSession session, int noticeNo);
	
}
