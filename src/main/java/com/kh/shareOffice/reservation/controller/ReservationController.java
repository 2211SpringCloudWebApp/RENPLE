package com.kh.shareOffice.reservation.controller;


import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String payment(Order order, Model model
			,@RequestParam("phone1") String phone1
			,@RequestParam("phone2") String phone2
			,@RequestParam("phone3") String phone3)
	{
		try {
			String orderPhone = phone1+phone2+phone3;
			order.setOrderPhone(orderPhone);
			System.out.println(order);
			
			int result = rService.insertOrder(order);
			if (result > 0) {
				Alert alert = new Alert("/home", "예약 성공");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				Alert alert = new Alert("/home", "예약에 실패했습니다");
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
	
	
	
	
}
