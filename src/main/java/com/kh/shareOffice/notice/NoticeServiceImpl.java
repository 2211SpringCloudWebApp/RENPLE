package com.kh.shareOffice.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeStore nStore;

	@Override
	public List<Notice> noticeView() {
		List<Notice> list = nStore.noticeView();
		return list;
	}

	@Override
	public Notice selectOneById(int noticeNo) {
		Notice notice = nStore.selectOneById(noticeNo);
		return notice;
	}

	@Override
	public int updateNotice(Notice notice) {
		return nStore.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		int result = nStore.deleteNotice(noticeNo);
		return result;
	}

	@Override
	public int insertNotice(Notice notice) {
		return nStore.insertNotice(notice);
	}

	@Override
	public int updateFileStatus(int noticeNo) {
		return nStore.updateFileStatus(noticeNo);
	}

}