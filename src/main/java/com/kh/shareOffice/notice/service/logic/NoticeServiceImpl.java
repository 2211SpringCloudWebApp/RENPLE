package com.kh.shareOffice.notice.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shareOffice.notice.domain.Notice;
import com.kh.shareOffice.notice.service.NoticeService;
import com.kh.shareOffice.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeStore nStore;
	@Autowired
	private SqlSession session;

	@Override
	public List<Notice> noticeView() {
		List<Notice> list = nStore.noticeView();
		return list;
	}

	@Override
	public Notice selectOneById(int noticeNo) {
		Notice notice = nStore.selectOneById(session, noticeNo);
		return notice;
	}

	@Override
	public int updateNotice(Notice notice) {
		return nStore.updateNotice(session, notice);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		int result = nStore.deleteNotice(session, noticeNo);
		return result;
	}

	@Override
	public int insertNotice(Notice notice) {
		return nStore.insertNotice(session, notice);
	}

}
