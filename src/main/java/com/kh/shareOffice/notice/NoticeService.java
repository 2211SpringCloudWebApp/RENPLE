package com.kh.shareOffice.notice;

import java.util.List;

public interface NoticeService {

	List<Notice> noticeView();

	Notice selectOneById(int noticeNo);

	int updateNotice(Notice notice);

	int deleteNotice(int noticeNo);

	int insertNotice(Notice notice);


}