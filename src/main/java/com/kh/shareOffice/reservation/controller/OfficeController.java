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

@Controller
public class OfficeController {

	@Autowired
	private ReservationService rService;
	
	@RequestMapping(value = "/officeMap", method = RequestMethod.GET)
	public String officeMap() {	
		return "reservation/office/officeMap";
	}
	
	@RequestMapping(value = "/gangnam1", method = RequestMethod.GET)
	public String gangnam1() {
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
		model.addAttribute("rList", rList);
		return "reservation/payment/gangnam1Payment";
	}
}
