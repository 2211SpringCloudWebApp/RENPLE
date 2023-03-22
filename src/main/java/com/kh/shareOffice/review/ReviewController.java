package com.kh.shareOffice.review;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.shareOffice.Alert;
import com.kh.shareOffice.reviewcomment.ReviewComment;
import com.kh.shareOffice.reviewcomment.ReviewCommentService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	@Autowired
	private ReviewCommentService cService;
	
//	==========================================================================================
//	======================================= 첨부파일 관련 =======================================
//	==========================================================================================
	private String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		try {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "/img/review/uploadimg";
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdir();
			}
			String filePath = savePath + "/" + uploadFile.getOriginalFilename();
			File file = new File(filePath);
			uploadFile.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) throws Exception{
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delPath = root + "/img/review/uploadimg";
		String delFilepath = delPath + "/" + fileName;
		File delFile = new File(delFilepath);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
//	==========================================================================================
//	======================================= 첨부파일 삭제 =======================================
//	==========================================================================================
	// 업로드된 파일만 삭제
		@RequestMapping(value="/review/removeFile", method=RequestMethod.GET)
		private String deleteUploadFile(
				
				@RequestParam String reviewFilename
				, @RequestParam int reviewNo
				, HttpServletRequest request
				, Model model) throws Exception {
			
			this.deleteFile(reviewFilename, request);
			int result = rService.updateFileStatus(reviewNo);
			if(result > 0) {
				Alert alert = new Alert("/review/modifyView?reviewNo="+reviewNo , "삭제 성공했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			}else {
				model.addAttribute("msg", "파일이 삭제되지 않았습니다.");
				return "common/error";
			}
			
		}
	
	
	
//	==========================================================================================
//	======================================== 페이징 관련 ========================================
//	==========================================================================================
	private ReviewPageInfo getPageInfo(int currentPage, int totalCount) {
		ReviewPageInfo pi = null;
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		
		maxPage = (int)((double)totalCount / boardLimit + 0.9);
		startNavi = (((int)((double)currentPage / naviLimit + 0.9)) - 1) * naviLimit + 1;
		endNavi = startNavi + naviLimit - 1 ;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		pi = new ReviewPageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;	
	}
	
	
//	==========================================================================================
//	======================================== 후기글 작성 ========================================
//	==========================================================================================
	@RequestMapping(value = "/review/write", method = RequestMethod.POST)
    public String reviewWrite(
    		
    		@ModelAttribute Review review
    		, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile
    		, HttpServletRequest request
    		, Model model
    		
    		) {
		
		try {
			
			if(!uploadFile.getOriginalFilename().equals("")) {
				String filePath = saveFile(uploadFile, request);
				if(filePath != null) {
					review.setReviewFilename(uploadFile.getOriginalFilename());
					review.setReviewFilepath(filePath);
				}
			}
			int result = rService.insertReview(review);
			if(result > 0) {
				return "redirect:/review/list";
			}
			else {
				model.addAttribute("msg", "작성 실패");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 후기글 작성 화면
	@RequestMapping(value = "/review/writeView", method = RequestMethod.GET)
	public String reviewWriteView() {
		return "review/write2";
	}
//	==========================================================================================
//	======================================== 댓글 작성 =========================================
//	==========================================================================================
	@RequestMapping(value = "/reviewcomment/write", method = RequestMethod.POST)
	public String commentWrite(
			
			@ModelAttribute ReviewComment comment
			, Model model
			
			) {
		
		try {
			int result = cService.insertComment(comment);
			if(result > 0) {
				return "redirect:/review/detail?reviewNo=" + comment.getReviewNo();
			}
			else {
				model.addAttribute("msg", "댓글 작성 실패");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
		
	}
//	==========================================================================================
//	======================================== 대댓글 작성 =========================================
//	==========================================================================================
	@RequestMapping(value = "/reviewcomment/writewrite", method = RequestMethod.POST)
	public String commentCommentWrite(
			
			@ModelAttribute ReviewComment comment
			, Model model
			
			) {
		
		try {
			int result = cService.insertCommentComment(comment);
			if(result > 0) {
				return "redirect:/review/detail?reviewNo=" + comment.getReviewNo();
			}
			else {
				model.addAttribute("msg", "댓글 작성 실패");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
		
	}
//	==========================================================================================
//	======================================== 후기글 수정 ========================================
//	==========================================================================================	
	@RequestMapping(value = "/review/modify", method = RequestMethod.POST)
	public String reviewModify(
			
			@ModelAttribute Review review
			, @RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile
			, @RequestParam("reviewFilename") String reviewFilename
			, HttpServletRequest request
			, Model model
			
			) {
		
		try {
			// 수정할 때, 새로 업로드된 파일이 있는 경우
				if(reloadFile != null && !reloadFile.isEmpty()) {
					// 기존 업로드 된 파일 체크 후
					if(review.getReviewFilename() != null) {
						// 기존 파일 삭제
						this.deleteFile(review.getReviewFilename(), request);
					}
					// 새로 업로드된 파일 복사(지정된 경로 업로드)
					String modifyPath = this.saveFile(reloadFile, request);
					if(modifyPath != null) {
						// notice에 새로운 파일 이름, 파일 경로 set
						review.setReviewFilename(reloadFile.getOriginalFilename());
						review.setReviewFilepath(modifyPath);
					}
				}
			int result = rService.updateReview(review);
			if(result > 0) {
				return "redirect:/review/detail?reviewNo=" + review.getReviewNo();
			}
			else {
				model.addAttribute("msg", "수정이 정상적으로 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
		
	}
	// 공지사항 수정 화면
	@RequestMapping(value="/review/modifyView", method = RequestMethod.GET)
	public String reviewModifyView(
			
			@RequestParam("reviewNo") Integer reviewNo
			, Model model
			
			) {
		
		try {
			Review review = rService.selectOneByNo(reviewNo);
			if(review != null) {
				model.addAttribute("review", review);
				return "review/modify2";
			}
			else {
				model.addAttribute("msg", "데이터 조회에 실패했습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
//	==========================================================================================
//	======================================== 후기글 삭제 ========================================
//	==========================================================================================
	@RequestMapping(value="/review/remove", method = RequestMethod.GET)
	public String reviewRemove(
			
			@RequestParam("reviewNo") int reviewNo
			, Model model
			
			) {
		try {
			int result = rService.deleteReview(reviewNo);
			if(result > 0) {
				return "redirect:/review/list";
			}
			else {
				model.addAttribute("msg", "후기글이 정상적으로 삭제되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
//	==========================================================================================
//	=============================== 후기글 상세 조회 및 댓글 목록 조회 ===============================
//	==========================================================================================
	@RequestMapping(value = "/review/detail", method = RequestMethod.GET)
	public String reviewDetailView(
			
			@RequestParam("reviewNo") int reviewNo
			, Model model
			
			) {
		
		try {
			Review review = rService.selectOneByNo(reviewNo);
			List<ReviewComment> cList = cService.selectCommentList(reviewNo);
			model.addAttribute("review", review);
			model.addAttribute("cList", cList);
			return "review/detail2";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}	
//	==========================================================================================
//	======================================== 후기글 목록 ========================================
//	==========================================================================================
	@RequestMapping(value = "/review/list", method = RequestMethod.GET)
	public String reviewListView(
			
			@RequestParam(value="page", required = false, defaultValue = "1")Integer page
			 ,Model model
			
			) {
		
		int totalCount = rService.getListCount();
		ReviewPageInfo pi = this.getPageInfo(page, totalCount);
		List<Review> rList = rService.selectReviewList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("rList", rList);
		return "review/list2";
	}
//	==========================================================================================
//	================================== 후기글 목록(오래된순 정렬) ==================================
//	==========================================================================================
	@RequestMapping(value = "/review/listbyold", method = RequestMethod.GET)
	public String reviewListViewbyold(
			
			@RequestParam(value="page", required = false, defaultValue = "1")Integer page
			 ,Model model
			
			) {
		
		int totalCount = rService.getListCount();
		ReviewPageInfo pi = this.getPageInfo(page, totalCount);
		List<Review> rList = rService.selectReviewListByold(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("rList", rList);
		return "review/list2";
	}
//	==========================================================================================
//	================================== 후기글 목록(좋아요순 정렬) ==================================
//	==========================================================================================
	@RequestMapping(value = "/review/listbylike", method = RequestMethod.GET)
	public String reviewListViewByLikeCount(
			
			@RequestParam(value="page", required = false, defaultValue = "1")Integer page
			 ,Model model
			
			) {
		
		int totalCount = rService.getListCount();
		ReviewPageInfo pi = this.getPageInfo(page, totalCount);
		List<Review> rList = rService.selectReviewListByLikeCount(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("rList", rList);
		return "review/list2";
	}
//	==========================================================================================
//	================================== 후기글 목록(조회수순 정렬) ==================================
//	==========================================================================================
	@RequestMapping(value = "/review/listbyview", method = RequestMethod.GET)
	public String reviewListViewByViewCount(
			
			@RequestParam(value="page", required = false, defaultValue = "1")Integer page
			 ,Model model
			
			) {
		
		int totalCount = rService.getListCount();
		ReviewPageInfo pi = this.getPageInfo(page, totalCount);
		List<Review> rList = rService.selectReviewListByViewCount(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("rList", rList);
		return "review/list2";
	}
//	==========================================================================================
//	======================================== 후기글 검색 ========================================
//	==========================================================================================
	@RequestMapping(value = "/review/search", method = RequestMethod.GET)
	public String reviewSearchView(
			
			@ModelAttribute ReviewSearch search
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage
			, Model model
			
			) {
		
		try {
			//System.out.println(search);
			int totalCount = rService.getListCount(search);
			ReviewPageInfo pi = this.getPageInfo(currentPage, totalCount);
			List<Review> searchList = rService.selectListByKeyword(pi, search);
			if(!searchList.isEmpty()) {
				model.addAttribute("search", search);
				model.addAttribute("pi", pi);
				model.addAttribute("sList", searchList);
				return "review/search2";
			}
			else {
				model.addAttribute("msg", "조회 실패");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
		
	}
//	==========================================================================================
//	======================================= 게시글 좋아요 =======================================
//	==========================================================================================
//	@RequestMapping(value = "/review/likeUp", method = RequestMethod.POST)
//	public void likeUp(
//			
//			@RequestParam(value="reviewNo", required=false) Integer reviewNo
//			, Model model
//			
//			) throws Exception {
//		
//		rService.updateReviewLike(reviewNo);
//	}
	
	@RequestMapping("/review/likeUp")
	public String likeUp(
			
			@RequestParam(value = "reviewNo", required = false) int reviewNo
			, Model model
			
			) throws Exception {
		
		rService.updateReviewLike(reviewNo);
		return "redirect:/review/detail.do?reviewNo=" + reviewNo;
	}
	
}







