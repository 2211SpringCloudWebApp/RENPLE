package com.kh.shareOffice.question;

import java.util.List;

public interface QuestionService {

	int insertQuestion(Question question);

	List<Question> questionView(String userId);

	int deleteQuestion(int questionNo);

	List<Question> questionViewAdmin();

	Question selectQnaByNo(int questionNo);

	int updateQuestion(Question qna);

	int updateFileStatus(int questionNo);

	Question selectOneByNo(int questionNo);
	
}