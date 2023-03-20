package com.kh.shareOffice.reviewcomment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewCommentController {

	@Autowired
	private ReviewCommentService cService;
	
	// 댓글 삭제
		@RequestMapping(value = "/reviewcomment/remove", method = RequestMethod.GET)
		public String commentRemove(
				
				@ModelAttribute ReviewComment comment
				,Model model
				
				) {
			
			try {
				int result = cService.deleteComment(comment);
				if(result > 0) {
					return "redirect:/review/detail?reviewNo=" + comment.getReviewNo();
				}
				else {
					model.addAttribute("msg", "댓글이 정상적으로 삭제되지 않았습니다.");
					return "common/error";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
		}

	// 댓글 수정
	@RequestMapping(value = "/reviewcomment/modify", method = RequestMethod.POST)
	public String commentModify(
			
			@ModelAttribute ReviewComment comment
			, Model model
			
			) {
		
		try {
			int result = cService.updateComment(comment);
			if(result > 0) {
				return "redirect:/review/detail?reviewNo=" + comment.getReviewNo();
			}
			else {
				model.addAttribute("msg", "댓글이 정상적으로 작성되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	
}
