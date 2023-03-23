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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.shareOffice.Alert;
import com.kh.shareOffice.product.domain.Product;
import com.kh.shareOffice.reservation.domain.Order;
import com.kh.shareOffice.reservation.domain.PageInfo;
import com.kh.shareOffice.reservation.domain.ReservationList;
import com.kh.shareOffice.reservation.domain.SearchBoard;
import com.kh.shareOffice.reservation.service.ReservationService;
import com.kh.shareOffice.reservation.store.ReservationStore;
import com.kh.shareOffice.user.domain.User;
import com.kh.shareOffice.user.service.UserService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService rService;
	
	@Autowired 
	private UserService uService;
	PageInfo pi = null;
	
	
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
	public String payment(Order order, Model model, HttpServletRequest request
			,@RequestParam("phone1") String phone1
			,@RequestParam("phone2") String phone2
			,@RequestParam("phone3") String phone3
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page )
	{
			String orderPhone = phone1+phone2+phone3;
			order.setOrderPhone(orderPhone);			
			rService.insertOrder(order);
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("user");
			
			int totalCount = rService.getOrderListCount(userId);
			pi = this.getPageInfo(page, totalCount);
			List<ReservationList> rList = rService.selectOrderBoard(pi, userId);
			if(!rList.isEmpty()) {
				model.addAttribute("pi", pi);
				model.addAttribute("rList", rList);
				model.addAttribute("userId", userId);
			}
			getUserName(model, request);
			return "reservation/detail/reservationList";
			
	}
	// 예약 내역 목록 조회 (페이징)
	@RequestMapping(value = "/reservation/detail/reservationList", method = RequestMethod.GET)
	public String reservationList(
			HttpServletRequest request
		 ,  Model model
		 , @RequestParam(value="page", required=false, defaultValue="1") Integer page
			) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		if(userId == null || userId == "") {
			return "redirect:/user/login";
		} else {
			int totalCount = rService.getOrderListCount(userId);
			pi = this.getPageInfo(page, totalCount);
			List<ReservationList> rList = rService.selectOrderBoard(pi, userId);
			if(!rList.isEmpty()) {
				model.addAttribute("pi", pi);
				model.addAttribute("rList", rList);
				model.addAttribute("userId", userId);
			}
			getUserName(model, request);
			return "reservation/detail/reservationList";
			
		}
	}
	
	// 검색 
	@RequestMapping(value = "/reservation/detail/searchReservation", method=RequestMethod.GET)
	public String getOrderSearchListCount( 	// searchLesson.jsp 에서 select로 검색하게 해주는 메소드
			@ModelAttribute SearchBoard searchBoard
			, HttpServletRequest request
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page
			,Model model) {
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		if(userId == null || userId == "") {
			return "redirect:/user/login";
		} else {
			int totalCount = rService.getOrderSearchListCount(searchBoard);
			pi = this.getPageInfo(page, totalCount);
			try {
				List<ReservationList> rList = rService.selectReservationListByKeyword(pi, searchBoard);
				if(!rList.isEmpty()) {
					model.addAttribute("pi", pi);
					model.addAttribute("searchBoard", searchBoard);
					model.addAttribute("rList", rList);
					model.addAttribute("userId", userId);
					getUserName(model, request);
					return "reservation/detail/searchReservationList";
				} else {
					getUserName(model, request);
					return "reservation/detail/searchReservationList";
				}
			} catch (Exception e) {
				getUserName(model, request);
				return "reservation/detail/searchReservationList";
			}
		}
	}
	
	// 예약 내역 상세 조회
	@RequestMapping(value = "/reservation/detail/reservationDetail", method = RequestMethod.GET)
	public String reservationDetail(HttpServletRequest request, Model model
			, @RequestParam(value = "orderNo", defaultValue = "0") int orderNo 
			) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		List<Order> checkOrderNo = rService.selectOrderNo(userId);
		
		if(userId == null) {	// 로그인 안하고 URL에 직접 접근할 경우 로그인 페이지로 되돌림
			return "redirect:/user/login";
		} else if(orderNo == 0) {    // 주문 상세 정보 페이지를 URL에 직접 접근할경우 리스트로 되돌림.
			List<ReservationList> rList = rService.selectReservationList(userId);
			model.addAttribute("rList", rList);
			getUserName(model, request);
			return "reservation/detail/reservationList";
		} else {    
			ReservationList order = rService.selectOneByOrderNo(orderNo);
			model.addAttribute("order", order);
			getUserName(model, request);
			return "reservation/detail/reservationDetail";
		}		
	}
	
	// 예약 정보 수정
	@RequestMapping(value = "/reservation/detail/reservationModify", method = RequestMethod.POST)
	public String reservationModify(Order order, Model model, HttpServletRequest request) {
		int result = rService.modifyReservation(order); 
		ReservationList order2 = rService.selectOneByOrderNo(order.getOrderNo());
		model.addAttribute("order", order2);
		getUserName(model, request);
		return "reservation/detail/reservationDetail";
		
	}
	// 예약 취소
	@RequestMapping(value = "/reservation/delete", method = RequestMethod.GET)
	public String reservationDelete(Model model, HttpServletRequest request
			, @RequestParam(value = "orderNo", defaultValue = "0") int orderNo
			) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		
		if(userId == null) {
			return "redirect:/user/login";
		} else if(orderNo == 0) {    // URL에 직접 접근할경우 리스트로 되돌림.
			List<ReservationList> rList = rService.selectReservationList(userId);
			model.addAttribute("rList", rList);
			getUserName(model, request);
			return "reservation/detail/reservationList";
		} else {
			rService.deleteReservation(orderNo);	// 예약취소
			List<ReservationList> rList = rService.selectReservationList(userId);
			model.addAttribute("rList", rList);
			getUserName(model, request);
			return "/reservation/detail/reservationList";
		}
	}
	
	
	/* ============== 관리자 ============= */
	
	// 관리자 - 예약 내역 목록 조회 (페이징)
	@RequestMapping(value = "/reservation/admin/adminReservationList", method = RequestMethod.GET)
	public String adminReservationList(
			   HttpServletRequest request
			,  Model model
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page
			) {
		String checkAdmin = checkAdmin(request);
	
		if(checkAdmin.equals("notLogin")) {  
			return "redirect:/user/login";
		} else if(checkAdmin.equals("notAdmin")) {  
			return "redirect:/";
		} else {
			int totalCount = rService.getAdminOrderListCount();
			pi = this.getPageInfo(page, totalCount);
			List<ReservationList> rList = rService.selectAdminOrderBoard(pi);
			if(!rList.isEmpty()) {
				model.addAttribute("pi", pi);
				model.addAttribute("rList", rList);
			}
			getUserName(model, request);
			return "reservation/admin/adminReservationList";
			
		}
	}	
	// 관리자 - 예약 내역 검색 
	@RequestMapping(value = "/reservation/admin/adminSearchReservation", method=RequestMethod.GET)
	public String getAdminOrderSearchListCount( 	// searchLesson.jsp 에서 select로 검색하게 해주는 메소드
			@ModelAttribute SearchBoard searchBoard
			, HttpServletRequest request
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page
			,Model model) {
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		if(userId == null || userId == "") {
			return "redirect:/user/login";
		} else {
			int totalCount = rService.getAdminOrderSearchListCount(searchBoard);
			pi = this.getPageInfo(page, totalCount);
			try {
				List<ReservationList> rList = rService.selectAdminReservationListByKeyword(pi, searchBoard);
				if(!rList.isEmpty()) {
					model.addAttribute("pi", pi);
					model.addAttribute("searchBoard", searchBoard);
					model.addAttribute("rList", rList);
					model.addAttribute("userId", userId);
					getUserName(model, request);
					return "reservation/admin/searchAdminReservationList";
				} else {
					getUserName(model, request);
					return "reservation/admin/searchAdminReservationList";
				}
			} catch (Exception e) {
				getUserName(model, request);
				return "reservation/admin/searchAdminReservationList";
			}
		}
	}
	
	
	
	
	// 관리자 - 예약 내역 상세 조회
	@RequestMapping(value = "/reservation/admin/adminReservationDetail", method = RequestMethod.GET)
	public String adminReservationDetail(HttpServletRequest request, Model model
			, @RequestParam(value = "orderNo", defaultValue = "0") int orderNo 
			) {
		String checkAdmin = checkAdmin(request);
		
		if(checkAdmin.equals("notLogin")) {  
			return "redirect:/user/login";
		} else if(checkAdmin.equals("notAdmin")) {  
			return "redirect:/";
		} else if(orderNo == 0) {            // 예약 상세정보를 URL에 직접 접근할경우 리스트로 되돌림.
			List<ReservationList> rList = rService.selectAllReservationList();
			model.addAttribute("rList", rList);
			getUserName(model, request);
			return "reservation/admin/adminReservationList";
		} else {
			ReservationList order = rService.selectOneByOrderNo(orderNo);
			model.addAttribute("order", order);
			getUserName(model, request);
			return "reservation/admin/adminReservationDetail";
		}		
	}	
	
	// 관리자 - 예약 취소
	@RequestMapping(value = "/reservation/adminDelete", method = RequestMethod.GET)
	public String adminReservationDelete(int orderNo, Model model, HttpServletRequest request) {
		String checkAdmin = checkAdmin(request);
		
		if(checkAdmin.equals("notLogin")) {  
			return "redirect:/user/login";
		} else if(checkAdmin.equals("notAdmin")) {  
			return "redirect:/";
		} else {
			rService.deleteReservation(orderNo);	// 예약취소
			List<ReservationList> rList = rService.selectAllReservationList();
			model.addAttribute("rList", rList);
			getUserName(model, request);
			return "/reservation/admin/adminReservationList";
		}
	}	
	
	// =============== 메소드 =================
	// 헤더의 name 값 연결 메소드
	public void getUserName(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		if(userId != null) {
			User user = uService.selectUserById(userId);
			model.addAttribute("name", user.getUserName());
		}
	}
	
	// 관리자 - URL 접근 유효성 검사
	public String checkAdmin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		User user = rService.selectOneById(userId);
		if(userId == null) {  			      // 로그인 안하고 접근시 로그인페이지 이동
			return "notLogin";
		} else if(user.getUserType() == 1) {  // 관리자가 아니고 접근시 홈페이지로 이동
			return "notAdmin";
		} else {
			return "";
		}
	}
	
	// 페이징 처리
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10; 	// 한 페이지 당 게시글 갯수
		int naviLimit = 5;		// 한 페이지 당 pageNavi 수
		int maxPage;			// 페이지의 마지막 번호
		int startNavi;			// pageNavi 시작값
		int endNavi;			// pageNavi 끝값
		
		maxPage = (int)((double)totalCount/boardLimit+0.9);
		startNavi = (((int)((double)currentPage/naviLimit+0.9))-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
	
	
	
}
