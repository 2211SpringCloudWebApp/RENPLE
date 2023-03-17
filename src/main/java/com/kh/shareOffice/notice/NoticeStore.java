package com.kh.shareOffice.notice;

import java.util.List;

public interface NoticeStore {

	List<Notice> noticeView();

	Notice selectOneById(int noticeNo);

	int updateNotice(Notice notice);

	int deleteNotice(int noticeNo);

	int insertNotice(Notice notice);

	int updateFileStatus(int noticeNo);
	
}
