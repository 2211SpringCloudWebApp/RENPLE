package com.kh.shareOffice.question.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.shareOffice.question.domain.Question;

public interface QuestionStore {

	int insertQuestion(Question question);

	List<Question> questionView(String userId);

	Question selectOneById(int questionNo);

	int deleteQuestion(int questionNo);

	List<Question> questionViewAdmin();

	Question selectQnaByNo(int questionNo);

	int update(Question qna);

}
