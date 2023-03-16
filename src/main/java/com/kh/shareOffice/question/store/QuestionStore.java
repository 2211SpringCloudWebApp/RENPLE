package com.kh.shareOffice.question.store;

import java.util.List;

import com.kh.shareOffice.question.Question;

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
