package com.kh.shareOffice.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeStoreImpl implements NoticeStore{

	@Autowired
	private SqlSession session;

	@Override
	public List<Notice> noticeView() {
		List<Notice> nList = session.selectList("NoticeMapper.noticeView");
		return nList;
	}

	@Override
	public Notice selectOneById(int noticeNo) {
		Notice notice = session.selectOne("NoticeMapper.selectOneById", noticeNo);
		return notice;
	}

	@Override
	public int updateNotice(Notice notice) {
		int result = session.update("NoticeMapper.updateNotice", notice);
		return result;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		int result = session.delete("NoticeMapper.deleteNotice", noticeNo);
		return result; 
	}

	@Override
	public int insertNotice(Notice notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	@Override
	public int updateFileStatus(int noticeNo) {
		int result = session.update("NoticeMapper.updateNoticeFile", noticeNo);
		return result;
	}

}