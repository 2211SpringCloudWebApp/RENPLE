package com.kh.shareOffice.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.shareOffice.notice.Notice;
import com.kh.shareOffice.notice.store.NoticeStore;

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
	public Notice selectOneById(SqlSession session, int noticeNo) {
		Notice notice = session.selectOne("NoticeMapper.selectOneById", noticeNo);
		return notice;
	}

	@Override
	public int updateNotice(SqlSession session, Notice notice) {
		int result = session.update("NoticeMapper.updateNotice", notice);
		return result;
	}

	@Override
	public int deleteNotice(SqlSession session, int noticeNo) {
		int result = session.delete("NoticeMapper.deleteNotice", noticeNo);
		return result; 
	}

	@Override
	public int insertNotice(SqlSession session, Notice notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	@Override
	public int updateFileStatus(SqlSession session, int noticeNo) {
		int result = session.update("NoticeMapper.updateNoticeFile", noticeNo);
		return result;
	}

}
