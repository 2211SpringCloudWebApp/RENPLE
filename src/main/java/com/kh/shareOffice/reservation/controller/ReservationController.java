package com.kh.shareOffice.reservation.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReservationController {

	@RequestMapping(value = "/gangnam1", method = RequestMethod.GET)
	public String gangnam1() {
		
		return "reservation/office/gangnam1";
	}
	
	@RequestMapping(value = "/officeMap", method = RequestMethod.GET)
	public String officeMap() {
		
		return "reservation/office/officeMap";
	}
}
