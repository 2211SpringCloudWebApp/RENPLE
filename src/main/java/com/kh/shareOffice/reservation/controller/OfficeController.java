package com.kh.shareOffice.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.shareOffice.reservation.service.ReservationService;
import com.kh.shareOffice.user.domain.User;

@Controller
public class OfficeController {

	@Autowired
	private ReservationService rService;
	
	@RequestMapping(value = "/officeMap", method = RequestMethod.GET)
	public String officeMap() {	
		return "reservation/office/officeMap";
	}
	
	
	// 강남 1호점
	@RequestMapping(value = "/gangnam1", method = RequestMethod.GET)
	public String gangnam1(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		return "reservation/office/gangnam1";
	}
	
	@RequestMapping(value = "/gangnam1/payment", method = RequestMethod.GET)
	public String gangnam1Payment(Model model, HttpServletRequest request) {
		/* 비로그인시 로그인 페이지로 되돌림 */
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		if(userId == null) {
			return "redirect:/user/login";
		}
		
		/* 달력 - 예약된 날짜들 선택 불가 */
		/* rList의 item엔 예약된 날짜들이 있음*/
		int ProductNo = 1;
		List<String> rList = rService.selectReservationDateList(ProductNo);
		User user = rService.selectOneById(userId);
		String phone2 = user.getUserPhone().substring(3,7);
		String phone3 = user.getUserPhone().substring(7);
		model.addAttribute("rList", rList);
		model.addAttribute("user", user);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
		model.addAttribute("rList", rList);
		return "reservation/payment/gangnam1Payment";
	}
	
	
	// 교대점
	@RequestMapping(value = "/gyodae", method = RequestMethod.GET)
	public String gyodae(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		return "reservation/office/gyodae";
	}
	
	@RequestMapping(value = "/gyodae/payment", method = RequestMethod.GET)
	public String gyodaePayment(Model model, HttpServletRequest request) {
		/* 비로그인시 로그인 페이지로 되돌림 */
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		if(userId == null) {
			return "redirect:/user/login";
		}
		
		/* 달력 - 예약된 날짜들 선택 불가 */
		/* rList의 item엔 예약된 날짜들이 있음*/
		int ProductNo = 21;
		List<String> rList = rService.selectReservationDateList(ProductNo);
		User user = rService.selectOneById(userId);
		String phone2 = user.getUserPhone().substring(3,7);
		String phone3 = user.getUserPhone().substring(7);
		model.addAttribute("rList", rList);
		model.addAttribute("user", user);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
		return "reservation/payment/gyodaePayment";
	}

	// 여의도점
	@RequestMapping(value = "/yeouido", method = RequestMethod.GET)
	public String yeouido(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		return "reservation/office/yeouido";
	}
	
	@RequestMapping(value = "/yeouido/payment", method = RequestMethod.GET)
	public String yeouidoPayment(Model model, HttpServletRequest request) {
		/* 비로그인시 로그인 페이지로 되돌림 */
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		if(userId == null) {
			return "redirect:/user/login";
		}
		
		/* 달력 - 예약된 날짜들 선택 불가 */
		/* rList의 item엔 예약된 날짜들이 있음*/
		int ProductNo = 24;
		List<String> rList = rService.selectReservationDateList(ProductNo);
		User user = rService.selectOneById(userId);
		String phone2 = user.getUserPhone().substring(3,7);
		String phone3 = user.getUserPhone().substring(7);
		model.addAttribute("rList", rList);
		model.addAttribute("user", user);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
		return "reservation/payment/yeouidoPayment";
	}
	
	// 사당점
	@RequestMapping(value = "/sadang", method = RequestMethod.GET)
	public String sadang(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		return "reservation/office/sadang";
	}
	
	@RequestMapping(value = "/sadang/payment", method = RequestMethod.GET)
	public String sadangPayment(Model model, HttpServletRequest request) {
		/* 비로그인시 로그인 페이지로 되돌림 */
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		if(userId == null) {
			return "redirect:/user/login";
		}
		
		/* 달력 - 예약된 날짜들 선택 불가 */
		/* rList의 item엔 예약된 날짜들이 있음*/
		int ProductNo = 25;
		List<String> rList = rService.selectReservationDateList(ProductNo);
		User user = rService.selectOneById(userId);
		String phone2 = user.getUserPhone().substring(3,7);
		String phone3 = user.getUserPhone().substring(7);
		model.addAttribute("rList", rList);
		model.addAttribute("user", user);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
		return "reservation/payment/sadangPayment";
	}
	
}
