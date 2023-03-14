package com.kh.shareOffice.comments.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.shareOffice.Alert;
import com.kh.shareOffice.comments.domain.Comment;
import com.kh.shareOffice.comments.service.CommentsService;

@Controller
@RequestMapping("/comment")
 public class CommentsController {

	@Autowired
	private CommentsService cService;
	
	// 관리자 댓글 작성
	@RequestMapping(value="/insert", method= {RequestMethod.GET, RequestMethod.POST})
	public String insertComment(@ModelAttribute Comment comment, HttpServletRequest request, Model model) {
		try {
	        HttpSession session = request.getSession();
	        String userId = (String) session.getAttribute("user");
	        comment.setUserId(userId);
	        int result = cService.insertComment(comment);
	        if (result > 0) {
	        	Alert alert = new Alert("redirect:/question/detailAdmin?questionNo=\"+comment.getQuestionNo()","답글이 등록되었습니다.");
				model.addAttribute("alert", alert);
	        	return "common/alert";
	        } else {
	            model.addAttribute("msg", "댓글 작성에 실패했습니다.");
	            return "common/error";
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("msg", e.getMessage());
	        return "common/error";
	    }
	}		
	
}
