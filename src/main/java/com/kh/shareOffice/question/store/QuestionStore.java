package com.kh.shareOffice.question.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.shareOffice.question.domain.Question;

public interface QuestionStore {

	int insertQuestion(Question question);

	List<Question> questionView(String userId);

	Question selectOneById(SqlSession session, int questionNo);

	int deleteQuestion(SqlSession session, int questionNo);

	int updateQuestion(SqlSession session, Question question);

	List<Question> questionViewAdmin();

}
