package com.kh.shareOffice.question.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shareOffice.question.domain.Question;
import com.kh.shareOffice.question.domain.Search;
import com.kh.shareOffice.question.service.QuestionService;
import com.kh.shareOffice.question.store.QuestionStore;
import com.kh.shareOffice.user.domain.User;

@Service
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionStore qStore;

	 // 문의사항 작성 Service
	@Override
	public int insertQuestion(Question question) {
		int result = qStore.insertQuestion(question);
		return result;
	}

	// 문의사항 목록 조회
	@Override
	public List<Question> questionView(String userId) {
		List<Question> list = qStore.questionView(userId);
		return list;
	}

	// 문의사항 상세 조회
	@Override
	public Question selectOneById(int questionNo) {
		Question question = qStore.selectOneById(questionNo);
		return question;
	}

	// 문의사항 삭제
	@Override
	public int deleteQuestion(int questionNo) {
		int result = qStore.deleteQuestion(questionNo);
		return result;
	}

	// 관리자 문의사항 목록 조회 
	@Override
	public List<Question> questionViewAdmin() {
		List<Question> list = qStore.questionViewAdmin();
		return list;
	}

	// questionNo로 화면띄우기 
	@Override
	public Question selectQnaByNo(int questionNo) {
		Question qna = qStore.selectQnaByNo(questionNo);
		return qna;
	}

	// 문의사항 수정하기
	@Override
	public int updateQuestion(Question qna) {
		int result = qStore.update(qna);
		return result;
	}

	// 문의사항 검색하기
	@Override
	public int getListCount(Search search) {
		int totalCount = qStore.getListCount(search);
		return totalCount;
	}

	

}
