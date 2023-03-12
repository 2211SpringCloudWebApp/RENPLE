package com.kh.shareOffice.user.controller;

import java.sql.Timestamp;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.shareOffice.Alert;
import com.kh.shareOffice.PageInfo;
import com.kh.shareOffice.Search;
import com.kh.shareOffice.user.domain.User;
import com.kh.shareOffice.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService uService;

	// 회원가입
	@RequestMapping("/enroll")
	public String enroll() {
		return "user/enroll";
	}

	@RequestMapping(value = "/enroll", method = RequestMethod.POST)
	public String enroll(Model model, @ModelAttribute User user, String userId, String userPw, String userName,
			String userEmail, String userPhone, String userAddress, Timestamp uCreateDate) {
		try {
			int result = uService.insertUser(user);
			if (result > 0) {
				Alert alert = new Alert("/user/login", "회원가입에 성공했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				Alert alert = new Alert("/home", "회원가입에 실패했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 로그인
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, String userId, String userPw, @ModelAttribute User user,
			Model model) {
		try {
			int result = uService.login(user);
			if (result > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user.getUserId());
				user = uService.selectUserById(userId);
				model.addAttribute("name", user.getUserName());
				return "home";
			} else {
				Alert alert = new Alert("/user/login", "아이디 또는 비밀번호를 다시 확인해주세요");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		try {
			HttpSession session = request.getSession();
			if (session != null) {
				session.invalidate();
				return "home";
			} else {
				return "home";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 회원조회
	/*
	@RequestMapping("/selectAll")
	public String selectAll(Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		try {
			int totalCnt = uService.getListCnt();
			// 페이징 처리 메서드
			PageInfo pi = this.getPageInfo(page, totalCnt);
			List<User> userList = uService.selectAll(pi);
			if (userList.size() == 0) {
				Alert alert = new Alert("/home", "이용자가 존재하지 않습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				model.addAttribute("pi", pi);
				model.addAttribute("list", userList);
				return "user/userList";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	*/

	// 회원조회 조건부 검색
	@RequestMapping("/selectSearchAll")
	public String selectSearchAll(Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "searchCondition", required = false, defaultValue = "all") String searchCondition,
			@RequestParam(value = "searchValue", required = false, defaultValue = "") String searchValue
			/* @ModelAttribute Search search */) {
		try {
			// search에는 키워드와 키워드값이 포함되어있는 상태
			Search search = new Search(searchValue, searchCondition);
			int totalCnt = uService.getListCnt(search);
			// System.out.println(totalCnt);
			// 페이징 처리 메서드
			PageInfo pi = this.getPageInfo(page, totalCnt);
			List<User> userList = uService.selectAll(pi, search);
			/*
			 * for(User user : userList) { System.out.println(user); }
			 */
			if (userList.size() == 0) {
				Alert alert = new Alert("/home", "이용자가 존재하지 않습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				model.addAttribute("pi", pi);
				model.addAttribute("search", search);
				model.addAttribute("list", userList);
				return "user/userList";
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

	// 회원 상세보기
	@RequestMapping("/select")
	public String selectUser(Model model, String userId) {
		try {
			User user = uService.selectUserById(userId);
			if (user != null) {
				model.addAttribute("user", user);
				return "/user/manageUser";
			} else {
				Alert alert = new Alert("/home", "존재하지 않는 이용자입니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 관리자가 회원 정보 수정
	@RequestMapping(value = "/select", method = RequestMethod.POST)
	public String modifyUser(@ModelAttribute User user, String userId, String userPw, String userName, String userEmail,
			String userPhone, String userAddress, Model model) {
		try {
			int result = uService.updateUser(user);
			if (result > 0) {
				Alert alert = new Alert("/user/selectAll", "회원정보 수정 성공했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				Alert alert = new Alert("/user/selectAll", "회원정보 수정 실패했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 비밀번호 조회
	@RequestMapping("/findPw")
	public String findPw() {
		return "user/findPw";
	}

	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public String findPw(Model model, @ModelAttribute User user, String userId, String userName, String userEmail,
			String userPhone) {
		try {
			User getUser = uService.findPw(user);
			if (getUser != null) {
				model.addAttribute("user", getUser);
				return "user/newPw";
			} else {
				Alert alert = new Alert("/user/login", "비밀번호 찾기 실패했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 비밀번호 변경
	@RequestMapping("/newPw")
	public String newPw() {
		return "user/newPw";
	}

	@RequestMapping(value = "/userPw", method = RequestMethod.POST)
	public String newPw(Model model, String userPw, String userId) {
		try {
			User user = uService.selectUserById(userId);
			user.setUserPw(userPw);
			int result = uService.updatePw(user);
			if (result > 0) {
				Alert alert = new Alert("/user/login", "비밀번호 수정 성공했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				Alert alert = new Alert("/user/findPw", "비밀번호 수정 실패했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}

	}

	// 아이디 중복 체크
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(String userId) {
		int result = uService.checkId(userId);
		return result;
	}

	// 이메일 중복 체크
	@RequestMapping(value = "/emailChk", method = RequestMethod.POST)
	@ResponseBody
	public int emailCheck(String userEmail) {
		int result = uService.checkEmail(userEmail);
		return result;
	}

	// 회원가입시 비밀번호 확인 체크
	@RequestMapping(value = "/pwChk", method = RequestMethod.POST)
	@ResponseBody
	public int pwCheck(String userPw, @RequestParam("reUserPw") String reUserPw) {
		int result = -1;
		if (userPw.equals(reUserPw)) {
			result = 0;
		}
		return result;
	}
}
