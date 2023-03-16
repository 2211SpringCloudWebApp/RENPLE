package com.kh.shareOffice.question.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.shareOffice.question.domain.Question;
import com.kh.shareOffice.question.store.QuestionStore;

@Repository
public class QuestionStoreImpl implements QuestionStore{

	@Autowired
	private SqlSession session;

	@Override
	public int insertQuestion(Question question) {
		int result = session.insert("QuestionMapper.insertQuestion", question);
		return result;
	}

	@Override
	public List<Question> questionView(String userId) {
		List<Question> nList = session.selectList("QuestionMapper.questionView", userId);
		return nList;
	}

	@Override
	public Question selectOneById(int questionNo) {
		Question question = session.selectOne("QuestionMapper.selectOneById", questionNo);
		return question;
	}

	@Override
	public int deleteQuestion(int questionNo) {
		int result = session.delete("QuestionMapper.deleteQuestion", questionNo);
		return result;
	}

	@Override
	public List<Question> questionViewAdmin() {
		List<Question> qlist = session.selectList("QuestionMapper.questionViewAdmin");
 		return qlist;
	}

	@Override
	public Question selectQnaByNo(int questionNo) {
		Question qna = session.selectOne("QuestionMapper.selectQnaByNo", questionNo);
		return qna;
	}

	@Override
	public int update(Question qna) {
		int result = session.update("QuestionMapper.updateQuestion", qna);
		return result;
	}

	@Override
	public int updateFileStatus(int questionNo) {
		int result = session.update("QuestionMapper.updateFileStatus", questionNo);
		return result;
	}


}
