package com.kh.shareOffice.user.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.shareOffice.Alert;
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
				Alert alert = new Alert("/user/home", "회원가입에 성공했습니다");
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

	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(@RequestParam("userId") String userId, Model model) {
		try {
			// 유저객체 가져와서 아이디 하나 꺼내기
			User user = uService.selectUserById(userId);
			// 유저아이디 값이 빈 값이 아니라면
			if (user != null) {
				// 유저객체에서가져와서 마이페이지표시해주기
				model.addAttribute("user", user);
				return "user/mypage";
			} else {
				// 에러 알림창 띄우기
				Alert alert = new Alert("/home", "일치하는 회원이 없습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			// 에러메세지 출력
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	 // 회원 정보 수정
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(@ModelAttribute User user, 
			@RequestParam("userId") String userId,
			@RequestParam("userPw") String userPw, 
			@RequestParam("userName") String userName, 
			@RequestParam("userEmail") String userEmail ,
			@RequestParam("userAddress") String userAddress,
			Model model) {
		try {
			int result = uService.modify(user);
			if(result > 0) {
				Alert alert = new Alert("/user/logout", "회원 정보 수정이 완료되었습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
				
			}else {
				Alert alert = new Alert("/", "회원 정보 수정이 완료되지 않았습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	
	
	@RequestMapping("findId")
	public String findId() {
		return "user/findId";
	}
	
	// 아이디 찾기 
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public String findId(@ModelAttribute User user,
			@RequestParam("userName") String userName,
			@RequestParam("userEmail") String userEmail,
			@RequestParam("userPhone") String userPhone, 
			Model model) {
		try {
			// 유저 객체 가져와서 이름 이메일 전화번호로 찾기 
			User getUser = uService.findId(user);
			// 해당되는 값들이 빈 값이 아니라면 
			if(getUser != null) {
				// 유저객체가져와서 아이디 띄워주기 
				model.addAttribute("user", getUser);
				return "user/showId";
			}else {
				// 에러 알림창 띄우기
				Alert alert = new Alert("/user/login", "일치하는 회원이 없습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
			// 에러메세지 띄우기 
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	
	
	
	
}
