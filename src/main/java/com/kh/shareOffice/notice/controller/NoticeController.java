package com.kh.shareOffice.notice.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.shareOffice.Alert;
import com.kh.shareOffice.notice.domain.Notice;
import com.kh.shareOffice.notice.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService nService;

	// ---------- 이용자 화면 -----------
	// 이용자 공지사항 목록 조회
	@RequestMapping("/view")
	public String noticeView(Model model) {
		try {
			List<Notice> nList = nService.noticeView();
			model.addAttribute("nList", nList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "notice/list";
	}

	// 이용자 공지사항 상세 조회
	@RequestMapping("/detail")
	public String noticeDetail(@RequestParam("noticeNo") int noticeNo, Model model) {
		try {
			Notice notice = nService.selectOneById(noticeNo);
			model.addAttribute("notice", notice);
			return "notice/detail";
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// ---------- 관리자 -----------
	// 관리자 공지사항 목록 조회
	@RequestMapping("/listAdmin")
	public String noticeViewAdmin(Model model) {
		try {
			List<Notice> nList = nService.noticeView();
			model.addAttribute("nList", nList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "notice/listAdmin";
	}

	// 관리자 공지사항 상세 조회
	@RequestMapping("/detailAdmin")
	public String noticeDetailAdmin(@RequestParam("noticeNo") int noticeNo, Model model) {
		try {
			Notice notice = nService.selectOneById(noticeNo);
			model.addAttribute("notice", notice);
			return "notice/detailAdmin";
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 공지사항 작성페이지 이동
	@RequestMapping("/writeView")
	public String wirteView() {
		return "notice/write";
	}

	// 공지사항 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String noticeRegister(
			@ModelAttribute Notice notice
			,@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile
			, HttpServletRequest request
			,Model model) {
		try {
			if (!uploadFile.getOriginalFilename().equals("")) {
				String filePath = saveFile(uploadFile, request);
				if (filePath != null) {
					notice.setNoticeFilename(uploadFile.getOriginalFilename());
					notice.setNoticeFilepath(filePath);
				}
			}
			int result = nService.insertNotice(notice);
			if (result > 0) {
				return "redirect:/notice/listAdmin";
			} else {
				model.addAttribute("msg", "공지사항 작성에 실패했습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 관리자 공지사항 수정페이지 이동
	@RequestMapping(value = "/modifyView", method = RequestMethod.GET)
	public String noticeModifyView(@RequestParam("noticeNo") Integer noticeNo, Model model) {
		try {
			Notice notice = nService.selectOneById(noticeNo);
			if (notice != null) {
				model.addAttribute("notice", notice);
				return "notice/modify";
			} else {
				model.addAttribute("msg", "데이터 조회에 실패했습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 관리자 공지사항 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String noticeModify(
			@ModelAttribute Notice notice
			, @RequestParam("noticeNo") int noticeNo
			, @RequestParam("noticeTitle") String noticeTitle
			, @RequestParam("noticeContent") String questionContent
			, @RequestParam(value="noticeFilename", required=false) MultipartFile reloadFile
			, Model model
			, HttpServletRequest request) {
		try {
			if(!reloadFile.isEmpty()) {
				if(notice.getNoticeFilename() != null) {
					this.deleteFile(notice.getNoticeFilename(), request);
				}
				String modifyPath = this.saveFile(reloadFile, request);
				if(modifyPath != null) {
					notice.setNoticeFilename(reloadFile.getOriginalFilename());
					notice.setNoticeFilepath(modifyPath);
				}
			}
			int result = nService.updateNotice(notice);
			if (result > 0) {
				Alert alert = new Alert("/notice/detailAdmin?noticeNo=" + notice.getNoticeNo(), "공지글 수정이 완료되었습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				Alert alert = new Alert("/notice/listAdmin", "공지글 수정이 완료되지 않았습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 관리자 공지사항 삭제
	@RequestMapping("/remove")
	public String noticeRemove(@RequestParam("noticeNo") int noticeNo, Model model) {
		try {
			int result = nService.deleteNotice(noticeNo);
			if (result > 0) {
				Alert alert = new Alert("/notice/listAdmin", "삭제 성공했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				model.addAttribute("msg", "공지사항이 삭제되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 파일 저장
	private String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		try {
			String root = request.getSession().getServletContext().getRealPath("resources"); // resources의 경로
			String savePath = root + "/noticeUploadFiles"; // 맥의 경우 /
			File folder = new File(savePath);
			if (!folder.exists()) {
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
	
	// 파일 삭제
	private void deleteFile(String noticeFilename, HttpServletRequest request) throws Exception{
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delPath = root + "/noticeUploadFiles";
		String delFilepath = delPath + "/" + noticeFilename;
		File delFile = new File(delFilepath);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
	
	// 업로드된 파일만 삭제
	@RequestMapping("/removeFile")
	private String deleteUploadFile(
			@RequestParam String noticeFilename
			, @RequestParam int noticeNo
			, HttpServletRequest request
			, Model model) throws Exception{
		this.deleteFile(noticeFilename, request);
		int result = nService.updateFileStatus(noticeNo);
		if(result > 0) {
			Alert alert = new Alert("/notice/detailAdmin?noticeNo="+noticeNo, "삭제 성공했습니다");
			model.addAttribute("alert", alert);
			return "common/alert";
		}else {
			model.addAttribute("msg", "파일이 삭제되지 않았습니다.");
			return "common/error";
		}
	}
}