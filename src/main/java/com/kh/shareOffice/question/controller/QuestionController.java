package com.kh.shareOffice.question.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.shareOffice.Alert;
import com.kh.shareOffice.question.domain.Question;
import com.kh.shareOffice.question.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController {

	@Autowired
	private QuestionService qService;
	
	////////// 이용자 //////////
	// 문의글 작성 페이지 이동
	@RequestMapping("/insert")
	public String insertQuestion() {
		return "question/write";
	}
	
	// 문의글 작성
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insertQuestion(HttpServletRequest request, Model model, String questionTitle, String questionContent) {
		try {
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("user");
			Question question = new Question();
			question.setQuestionTitle(questionTitle);
			question.setQuestionContent(questionContent);
			question.setUserId(userId);
			int result = qService.insertQuestion(question);
		if(result > 0) {
			Alert alert = new Alert("/question/view", "작성 성공했습니다");
			model.addAttribute("alert", alert);
			return "common/alert";
		} else {
			Alert alert = new Alert("/home", "문의사항 작성에 실패했습니다");
			model.addAttribute("alert", alert);
			return "common/alert";
		}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 문의글 목록 조회
	@RequestMapping("/view")
	public String questionView(Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("user");
			List<Question> qList = qService.questionView(userId);
			if(qList != null) {
				model.addAttribute("qList", qList);
				return "question/list";
			} else {
				Alert alert = new Alert("/home", "문의사항 조회에 실패했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 문의글 상세 조회
	@RequestMapping("/detail")
	public String questionDetail(@RequestParam("questionNo") int questionNo, Model model) {
		try {
			Question question = qService.selectOneById(questionNo);
			model.addAttribute("question", question);
			return "question/detail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 문의글 삭제
	@RequestMapping("/remove")
	public String removeDetail(@RequestParam("questionNo") int questionNo, Model model) {
		try {
			int result = qService.deleteQuestion(questionNo);
			if(result > 0) {
				Alert alert = new Alert("/question/view", "삭제 성공했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				model.addAttribute("msg", "문의사항이 삭제되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	////////// 관리자 //////////
	// 관리자 문의글 조회
		@RequestMapping("/viewAdmin")
		public String questionViewAdmin(Model model) {
			try {
				List<Question> qList = qService.questionViewAdmin();
				model.addAttribute("qList", qList);
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "common/error";	
			}
			return "question/listAdmin";
		}
	
	// 관리자 문의글 상세 조회
		@RequestMapping("/detailAdmin")
		public String questionDetailAdmin(@RequestParam("questionNo") int questionNo, Model model) {
			try {
				Question question = qService.selectOneById(questionNo);
				model.addAttribute("question", question);
				return "question/detailAdmin";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
		}
}
