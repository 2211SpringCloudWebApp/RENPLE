package com.kh.shareOffice.question;

import java.util.List;

public interface QuestionStore {

	int insertQuestion(Question question);

	List<Question> questionView(String userId);

	Question selectOneByNo(int questionNo);

	int deleteQuestion(int questionNo);

	List<Question> questionViewAdmin();

	Question selectQnaByNo(int questionNo);

	int update(Question qna);

	int updateFileStatus(int questionNo);

}