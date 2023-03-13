package com.kh.shareOffice.notice.service;

import java.util.List;

import com.kh.shareOffice.notice.domain.Notice;

public interface NoticeService {

	List<Notice> noticeView();

	Notice selectOneById(int noticeNo);

	int updateNotice(Notice notice);

	int deleteNotice(int noticeNo);

	int insertNotice(Notice notice);


}
