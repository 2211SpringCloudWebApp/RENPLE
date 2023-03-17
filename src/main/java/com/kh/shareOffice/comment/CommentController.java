package com.kh.shareOffice.comment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.shareOffice.Alert;
import com.kh.shareOffice.PageInfo;
import com.kh.shareOffice.Search;
import com.kh.shareOffice.question.Question;
import com.kh.shareOffice.question.QuestionService;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService cService;

	@Autowired
	private QuestionService qService;

	// 문의 목록 확인
	// 조인이 들어감
	@RequestMapping("/list")
	public String list(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "searchCondition", required = false, defaultValue = "all") String searchCondition,
			@RequestParam(value = "searchValue", required = false, defaultValue = "") String searchValue) {
		try {
			// search에는 키워드와 키워드값이 포함되어있는 상태
			Search search = new Search(searchValue, searchCondition);
			int totalCnt = cService.getListCnt(search);
			PageInfo pi = this.getPageInfo(page, totalCnt);
			List<Comment> commentList = cService.selectCnQAll(search);
			if (commentList.size() == 0) {
				Alert alert = new Alert("/", "문의내역이 존재하지 않습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				model.addAttribute("pi", pi);
				model.addAttribute("search", search);
				model.addAttribute("commentList", commentList);
				return "comment/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}

	}

	// 페이징처리 관련 메서드
	private PageInfo getPageInfo(int currPage, int totalCnt) {
		int boardLimit = 10; // 현재 페이지
		int naviLimit = 5; // 전체 게시글 갯수

		int lastPage = (int) Math.ceil((double) totalCnt / boardLimit);
		int startNavi = ((currPage - 1) / naviLimit) * naviLimit + 1;
		int endNavi = startNavi + naviLimit - 1;
		if (endNavi > lastPage) {
			endNavi = lastPage;
		}
		PageInfo pi = new PageInfo(currPage, boardLimit, naviLimit, startNavi, endNavi, totalCnt, lastPage);
		return pi;
	}

	// 문의 상세 보기
	@RequestMapping("/select")
	public String select(HttpServletRequest request, Model model, int questionNo) {
		try {
			Question question = qService.selectOneByNo(questionNo);
			Comment comment = cService.selectOneByNo(questionNo);
			if (question != null) {
				model.addAttribute("question", question);
				model.addAttribute("comment", comment);
				return "comment/detail";
			} else {
				Alert alert = new Alert("/comment/list", "해당 문의가 존재하지 않습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 댓글 작성
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute Comment comment, String userId, String commentContent, Model model) {
		try {
			int result = cService.insertComment(comment);
			if (result > 0) {
				return "redirect:/comment/list";
			} else {
				Alert alert = new Alert("/comment/list", "댓글 작성 실패했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 댓글 수정
	@RequestMapping("/update")
	public String update(@ModelAttribute Comment comment, int commentNo, String commentContent, Model model) {
		try {
			System.out.println(comment);
			int result = cService.updateComment(comment);
			if (result > 0) {
				Alert alert = new Alert("/comment/list", "댓글 수정 성공했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				Alert alert = new Alert("/comment/list", "댓글 수정 실패했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}

	}

	// 댓글 삭제
	@RequestMapping("/delete")
	public String delete(int commentNo, Model model) {
		try {
			int result = cService.deleteComment(commentNo);
			if (result > 0) {
				Alert alert = new Alert("/comment/list", "댓글 삭제 성공했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				Alert alert = new Alert("/comment/list", "댓글 삭제 실패했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

}
