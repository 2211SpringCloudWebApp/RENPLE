package com.kh.shareOffice.question.service;

import java.util.List;

import com.kh.shareOffice.question.Question;

public interface QuestionService {

	int insertQuestion(Question question);

	List<Question> questionView(String userId);

	Question selectOneById(int questionNo);

	int deleteQuestion(int questionNo);

	List<Question> questionViewAdmin();

	Question selectQnaByNo(int questionNo);

	int updateQuestion(Question qna);

	int updateFileStatus(int questionNo);
	
}
