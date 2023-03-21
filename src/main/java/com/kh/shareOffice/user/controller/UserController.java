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
				Alert alert = new Alert("/home", "회원가입에 성공했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				Alert alert = new Alert("/home", "과목추가에 실패했습니다");
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
	public String login(HttpServletRequest request, String userId, String userPw, @ModelAttribute User user, Model model) 
	{
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
	public String modal(String returnModal) {
		if(returnModal.equals("gangnam1")) {
			return "/gangnam1/payment";
		} else if(returnModal.equals("gyodae")) {
			return "/gyodae/payment";
		} else if(returnModal.equals("sadang")) {
			return "/sadang/payment";
		} else {
			return "/yeouido/payment";
		}
	}
	
	// 상은 - modalLogin 추가
	@RequestMapping(value = "/modalLogin", method = RequestMethod.POST)
	public String modalLogin(HttpServletRequest request, String userId, String userPw, 
			@ModelAttribute User user, String modal, Model model) {
		try {
			int result = uService.login(user);
			if (result > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user.getUserId());
				user = uService.selectUserById(user.getUserId());
				model.addAttribute("name", user.getUserName());
				
				if(modal.equals("gangnam1")) {
					return "redirect:/gangnam1/payment";
				} else if(modal.equals("gyodae")) {
					return "redirect:/gyodae/payment";
				} else if(modal.equals("sadang")) {
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
}
