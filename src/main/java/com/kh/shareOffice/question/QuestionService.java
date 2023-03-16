package com.kh.shareOffice.question;

import java.util.List;

import com.kh.shareOffice.Search;

public interface QuestionService {

	int insertQuestion(Question question);

	List<Question> questionView(String userId);

	Question selectOneByNo(int questionNo);

	int deleteQuestion(int questionNo);

	List<Question> questionViewAdmin();

	Question selectQnaByNo(int questionNo);

	int updateQuestion(Question qna);

	int getListCount(Search search);


	
}