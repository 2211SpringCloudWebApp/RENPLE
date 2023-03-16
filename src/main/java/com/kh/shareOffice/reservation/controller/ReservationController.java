package com.kh.shareOffice.reservation.controller;


import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.shareOffice.Alert;
import com.kh.shareOffice.reservation.domain.Order;
import com.kh.shareOffice.reservation.domain.ReservationList;
import com.kh.shareOffice.reservation.service.ReservationService;
import com.kh.shareOffice.reservation.store.ReservationStore;
import com.kh.shareOffice.user.domain.User;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;



@Controller
public class ReservationController {

	@Autowired
	private ReservationService rService;
	
	private IamportClient api;
	
	public ReservationController() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient("8641070272615548","bAWtOvYVOozerUxmMbPtotimMi7AKFn37PqHvEwTr0s6eEdz9sLPh6Ks0Ez1endwfva21AliZVeoWgmb");
	}
	
	// 결제 
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException 
	{		
			return api.paymentByImpUid(imp_uid);
	}
	
	// 결제 완료 후 결제 내역 DB등록
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String payment(Order order, Model model
			,@RequestParam("phone1") String phone1
			,@RequestParam("phone2") String phone2
			,@RequestParam("phone3") String phone3)
	{
		try {
			String orderPhone = phone1+phone2+phone3;
			order.setOrderPhone(orderPhone);			
			int result = rService.insertOrder(order);
			if (result > 0) {
				return "redirect:/reservation/detail/reservationList";
			} else {
				Alert alert = new Alert("/index", "예약에 실패했습니다");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
		// orderNo, orderDate, userId
	}
	
	// 예약 내역 목록 조회
	@RequestMapping(value = "/reservation/detail/reservationList", method = RequestMethod.GET)
	public String reservationList(HttpServletRequest request,  Model model) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		if(userId == null) {
			return "redirect:/user/login";
		} else {
			List<ReservationList> rList = rService.selectReservationList(userId);
			model.addAttribute("rList", rList);
			return "reservation/detail/reservationList";
		}
	}
	@RequestMapping(value = "/reservation/detail/reservationDetail", method = RequestMethod.GET)
	public String reservationDetail(HttpServletRequest request, Model model
			, @RequestParam(value = "orderNo", defaultValue = "0") int orderNo 
			) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		if(userId == null) {	// 로그인 안하고 URL에 직접 접근할 경우 로그인 페이지로 되돌림
			return "redirect:/user/login";
		} else if(orderNo == 0) {    // 예약 상세정보를 URL에 직접 접근할경우 리스트로 되돌림.
			List<ReservationList> rList = rService.selectReservationList(userId);
			model.addAttribute("rList", rList);
			return "reservation/detail/reservationList";
		} else {
			ReservationList order = rService.selectOneByOrderNo(orderNo);
			model.addAttribute("order", order);
			return "reservation/detail/reservationDetail";
		}		
	}
	
	@RequestMapping(value = "/reservation/delete", method = RequestMethod.GET)
	public String reservationDelete(int orderNo) {
		
		int result = rService.deleteReservation(orderNo);
		return "/reservation/detail/reservationList";
	}
}
