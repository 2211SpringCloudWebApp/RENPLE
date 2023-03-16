package com.kh.shareOffice.question.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.shareOffice.Alert;
import com.kh.shareOffice.question.Question;
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
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertQuestion(@ModelAttribute Question qna, HttpServletRequest request, Model model,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile) {
		try {
			if (!uploadFile.getOriginalFilename().equals("")) {
				String filePath = saveFile(uploadFile, request);
				if (filePath != null) {
					qna.setQuestionFilename(uploadFile.getOriginalFilename());
					qna.setQuestionFilepath(filePath);
				}
			}
			int result = qService.insertQuestion(qna);
			if (result > 0) {
				Alert alert = new Alert("/question/view", "문의글 작성에 성공했습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				model.addAttribute("msg", "문의글 작성에 실패했습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 첨부파일
	// 이름, 경로 표시하기
	private String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir();
		}
		String filePath = savePath + "/" + uploadFile.getOriginalFilename();
		File file = new File(filePath);
		try {
			uploadFile.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 문의글 목록 조회
	@RequestMapping("/view")
	public String questionView(Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("user");
			List<Question> qList = qService.questionView(userId);
			if (qList != null) {
				model.addAttribute("qList", qList);
				return "question/list";
			} else {
				Alert alert = new Alert("/home", "문의글 조회에 실패했습니다");
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
			Question question = qService.selectOneByNo(questionNo);
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
			if (result > 0) {
				Alert alert = new Alert("/question/view", "문의글 삭제에 성공하였습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				model.addAttribute("msg", "문의글이 삭제되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 문의글 수정화면 띄우기
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String questionModify(@RequestParam("questionNo") int questionNo, Model model) {
		try {
			// question 객체 가져와서 questionNo 하나꺼내기
			Question qna = qService.selectQnaByNo(questionNo);
			// question 값이 빈 값이 아니라면
			if (qna != null) {
				// qna 객체에서 가져와서 qna 목록표시해주기
				model.addAttribute("qna", qna);
				return "question/modify";
			} else {
				// 에러알림창띄우기
				Alert alert = new Alert("/home", "문의글 조회에 실패하였습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 문의글 수정하기
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(
			@ModelAttribute Question qna
			, @RequestParam("questionNo") int questionNo
			,@RequestParam("questionTitle") String questionTitle
			,@RequestParam("questionContent") String questionContent
			,@RequestParam("userId") String userId
			,Model model
			,@RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile
			, HttpServletRequest request) {
		try {
			if (reloadFile != null && !reloadFile.isEmpty()) {
				// 기존 업로드된 파일 체크 후
				if (qna.getQuestionFilename() != null) {
					// 기존 파일 삭제
					this.deleteFile(qna.getQuestionFilename(), request);
				}
				// 새로 업로드된 파일 복사(지정된 경로 업로드)
				String modifyPath = this.saveFile(reloadFile, request);
				if (modifyPath != null) {
					// notice에 새로운 파일 이름, 파일 경로 set
					qna.setQuestionFilename(reloadFile.getOriginalFilename());
					qna.setQuestionFilepath(modifyPath);
				}
			}
			int result = qService.updateQuestion(qna);
			if (result > 0) {
				Alert alert = new Alert("/question/view", "문의글 수정이 완료되었습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				Alert alert = new Alert("/question/view", "문의글 수정이 완료되지 않았습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 파일 삭제하기
	private void deleteFile(String filename, HttpServletRequest request) throws Exception {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delPath = root + "nuploadFiles";
		String delFilepath = delPath + "/" + filename;
		File delFile = new File(delFilepath);
		if (delFile.exists()) {
			delFile.delete();
		}
	}

	// 업로드된 파일만 삭제
	@RequestMapping("/deleteFile")
	private String deleteUploadFile(
			@RequestParam String questionFilename
			, @RequestParam int questionNo
			, HttpServletRequest request
			, Model model) throws Exception{
		this.deleteFile(questionFilename, request);
		int result = qService.updateFileStatus(questionNo);
		if(result > 0) {
			Alert alert = new Alert("/question/detail?questionNo="+questionNo, "삭제 성공했습니다");
			model.addAttribute("alert", alert);
			return "common/alert";
		} else {
			model.addAttribute("msg", "파일이 삭제되지 않았습니다.");
			return "common/error";
		}
	}

	////////// 관리자 //////////// 
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
			Question question = qService.selectOneByNo(questionNo);
			model.addAttribute("question", question);
			return "question/detailAdmin";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
}
