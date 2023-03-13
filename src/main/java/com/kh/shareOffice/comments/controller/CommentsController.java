package com.kh.shareOffice.comments.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.shareOffice.comments.domain.Comment;
import com.kh.shareOffice.comments.service.CommentsService;
import com.kh.shareOffice.question.service.QuestionService;

@Controller
 public class CommentsController {

	@Autowired
	private CommentsService cService;
	
	@Autowired
	private QuestionService qService;
	
	public String commentWrite(@RequestParam int questionNo, @RequestParam String commentContent, Model model) {
		try {
			Comment comment = new Comment();
			comment.setQuestionNo(questionNo);
			comment.setCommentContent(commentContent);
			cService.writeComment(comment);
			return "redirect:/question/detail?questionNo=" + questionNo;
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
