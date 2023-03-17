package com.kh.shareOffice.reviewcomment.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.shareOffice.review.domain.Review;
import com.kh.shareOffice.reviewcomment.domain.ReviewComment;
import com.kh.shareOffice.reviewcomment.service.ReviewCommentService;

@Controller
public class ReviewCommentController {

	@Autowired
	private ReviewCommentService cService;
	
//	//댓글 작성
//	@RequestMapping(value = "/reviewcomment/write.do", method = RequestMethod.POST)
//	public String commentWrite(
//			
//			@ModelAttribute Comment comment
//			, Model model
//			
//			) {
//			try {
//				Review review = new Review();
//				int result = cService.insertComment(comment);
//				if(result > 0) {
//					return "redirect:/review/detail.do?reviewNo=" + review.getReviewNo();
//				}
//				else {
//					model.addAttribute("msg", "댓글이 정상적으로 작성되지 않았습니다.");
//					return "common/error";
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//				model.addAttribute("msg", e.getMessage());
//				return "common/error";
//			}
//	}
	
	// 댓글 삭제
	@RequestMapping(value = "/reviewcomment/remove.do", method = RequestMethod.GET)
	public String commentRemove(
			
			@RequestParam("commentNo") int commentNo
			,Model model
			
			) {
		
		try {
			Review review = new Review();
			int result = cService.deleteComment(commentNo);
			if(result > 0) {
				return "redirect:/review/detail.do?reviewNo=" + review.getReviewNo();
			}
			else {
				model.addAttribute("msg", "댓글이 정상적으로 작성되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
//	@RequestMapping(value = "/comment/modify.do", method = RequestMethod.POST)
//	public String commentModify(
//			
//			@ModelAttribute Comment comment
//			, Model model
//			
//			) {
//		
//		try {
//			Review review = new Review();
//			int result = cService.updateComment(comment);
//			if(result > 0) {
//				return "redirect:/review/detail.do?reviewNo=" + review.getReviewNo();
//			}
//			else {
//				model.addAttribute("msg", "댓글이 정상적으로 작성되지 않았습니다.");
//				return "common/error";
//			}
//		} catch (Exception e) {
//			model.addAttribute("msg", e.getMessage());
//			return "common/error";
//		}
//	}
	
	
}
