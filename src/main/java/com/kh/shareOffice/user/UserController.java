package com.kh.shareOffice.user;

import java.sql.Timestamp;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
			// userAddress가 2개 들어오는데 이때 ','로 구분되어 ', '로 변경
			user.setUserAddress(userAddress.replace(",", ", "));
			int result = uService.insertUser(user);
			if (result > 0) {
				Alert alert = new Alert("/user/login", "회원가입에 성공했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				Alert alert = new Alert("/user/enroll", "회원가입에 실패했습니다");
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
				session.setAttribute("name", user.getUserName());
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

	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(@RequestParam("userId") String userId, Model model) {
		try {
			User user = uService.selectUserById(userId);
			if (user != null) {
				model.addAttribute("user", user);
				if (user.getUserId().equals("admin")) {
					return "user/manageUser";
				} else {
					return "user/mypage";
				}
			} else {
				Alert alert = new Alert("/user/login", "일치하는 정보가 존재하지 않습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 정보 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute User user, @RequestParam("userId") String userId,
			@RequestParam("userPw") String userPw, @RequestParam("userName") String userName,
			@RequestParam("userEmail") String userEmail, @RequestParam("userAddress") String userAddress, Model model) {
		try {
			int result = uService.modify(user);
			if (result > 0) {
				Alert alert = new Alert("/user/mypage?userId=" + userId, "정보 수정 성공했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";

			} else {
				Alert alert = new Alert("/", "정보 수정 실패했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 아이디 찾기
	@RequestMapping("findId")
	public String findId() {
		return "user/findId";
	}

	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String findId(@ModelAttribute User user, @RequestParam("userName") String userName,
			@RequestParam("userEmail") String userEmail, @RequestParam("userPhone") String userPhone, Model model) {
		try {
			User getUser = uService.findId(user);
			if (getUser != null) {
				model.addAttribute("user", getUser);
				return "user/showId";
			} else {
				Alert alert = new Alert("/user/login", "일치하는 정보가 존재하지 않습니다");
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

	// ========================================== 관리자 전용
	// ==========================================

	// 회원조회 + 페이징 + 조건부 검색
	@RequestMapping("/selectSearchAll")
	public String selectSearchAll(Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "searchCondition", required = false, defaultValue = "all") String searchCondition,
			@RequestParam(value = "searchValue", required = false, defaultValue = "") String searchValue) {
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
				Alert alert = new Alert("/", "이용자가 존재하지 않습니다");
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
				Alert alert = new Alert("/", "존재하지 않는 이용자입니다");
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
	// 바꾸는것 : 비번, 이메일, 휴대폰, 주소
	@RequestMapping(value = "/modifyUser", method = RequestMethod.POST)
	public String modifyUser(@ModelAttribute User user, String userId, String userPw, String userEmail,
			String userPhone, String userAddress, Model model) {
		try {
			int result = uService.updateUser(user);
			if (result > 0) {
				Alert alert = new Alert("/user/selectSearchAll", "회원정보 수정 성공했습니다");
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

	// 상은 - modalLogin 추가
	@RequestMapping(value = "/modalLogin", method = RequestMethod.POST)
	public String modalLogin(HttpServletRequest request, String userId, String userPw, @ModelAttribute User user,
			String modal, Model model) {
		try {
			int result = uService.login(user);
			if (result > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user.getUserId());
				user = uService.selectUserById(user.getUserId());
				model.addAttribute("name", user.getUserName());

				if (modal.equals("gangnam1")) {
					return "redirect:/gangnam1/payment";
				} else if (modal.equals("gyodae")) {
					return "redirect:/gyodae/payment";
				} else if (modal.equals("sadang")) {
					return "redirect:/sadang/payment";
				} else {
					return "redirect:/yeouido/payment";
				}

			} else {
				Alert alert = new Alert("/gangnam1", "아이디 또는 비밀번호를 다시 확인해주세요");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// ========================================== ajax
	// ==========================================
	// produces = "application/json; charset=UTF-8" 사용으로 jackson-databind 라이브러리 생략

	// 아이디 중복 체크
	@RequestMapping(value = "/idChk", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int idCheck(String userId) {
		int result = uService.checkId(userId);
		Pattern pattern = Pattern.compile("^[a-zA-Z0-9]{4,20}$");
		Matcher matcher = pattern.matcher(userId);

		if ((userId.length() < 4 || userId.length() > 20) || !matcher.matches()) {
			return -2;
		}

		return result;
	}

	// 이메일 중복 체크
	@RequestMapping(value = "/emailChk", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int emailCheck(String userEmail) {
		int result = uService.checkEmail(userEmail);
		Pattern pattern = Pattern
				.compile("^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$");
		Matcher matcher = pattern.matcher(userEmail);

		if (userEmail.length() > 50) {
			return -2;
		} else if (!matcher.matches()) {
			return -3;
		}

		return result;
	}

	// 관리자가 회원 정보 수정(이메일)
	@RequestMapping(value = "/emailChk2", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int emailCheck(String userEmail, String userId, @ModelAttribute User user) {
		int result = uService.checkEmail(userEmail);
		// 기존 이메일과 동일하게 변경 할 수 있도록
		int result2 = uService.checkMyEmail(user);
		Pattern pattern = Pattern
				.compile("^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$");
		Matcher matcher = pattern.matcher(userEmail);

		if (userEmail.length() > 50) {
			result = -2;
		} else if (!matcher.matches()) {
			result = -3;
		} else if (result2 > 0) {
			return 0;
		} else if(result2 <= 0) {
			return result;
		}

		return result;
	}

}
