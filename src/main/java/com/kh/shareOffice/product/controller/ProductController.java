package com.kh.shareOffice.product.controller;

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

import com.kh.shareOffice.Alert;
import com.kh.shareOffice.product.domain.Product;
import com.kh.shareOffice.product.service.ProductService;
import com.kh.shareOffice.reservation.domain.PageInfo;
import com.kh.shareOffice.reservation.domain.SearchBoard;
import com.kh.shareOffice.reservation.service.ReservationService;
import com.kh.shareOffice.user.User;
import com.kh.shareOffice.user.UserService;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;
	@Autowired
	private ReservationService rService;
	@Autowired
	private UserService uService;
	
	PageInfo pi = null;
	
	
/* ============== 관리자 ============= */
	
	// 유효성 검사
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
	
	// 상품 내역 목록 조회 (페이징)
	@RequestMapping(value = "/reservation/admin/adminProductList", method = RequestMethod.GET)
	public String adminProductList(
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
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("user");
			int totalCount = pService.getAdminProductListCount();
			pi = this.getPageInfo(page, totalCount);
			List<Product> pList = pService.selectAdminProductBoard(pi);
			if(!pList.isEmpty()) {
				model.addAttribute("userId", userId);
				model.addAttribute("pi", pi);
				model.addAttribute("pList", pList);
			}
			getUserName(model, request);
			return "reservation/admin/adminProductList";
		}
	}	
	
	// 상품 내역 (검색) 
	@RequestMapping(value = "/reservation/admin/adminSearchProduct", method=RequestMethod.GET)
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
			int totalCount = pService.getAdminProductSearchListCount(searchBoard);
			pi = this.getPageInfo(page, totalCount);
			try {
				List<Product> pList = pService.selectAdminProductListByKeyword(pi, searchBoard);
				System.out.println(pList);
				if(!pList.isEmpty()) {
					model.addAttribute("pi", pi);
					model.addAttribute("searchBoard", searchBoard);
					model.addAttribute("pList", pList);
					model.addAttribute("userId", userId);
					getUserName(model, request);
					
					return "reservation/admin/searchAdminProductList";
				} else {
					getUserName(model, request);
					return "reservation/admin/searchAdminProductList";
				}
			} catch (Exception e) {
				getUserName(model, request);
				return "reservation/admin/searchAdminProductList";
			}
		}
	}
	
	// 관리자 - 상품 등록 뷰
	@RequestMapping(value = "/reservation/admin/adminProductRegisterView", method = RequestMethod.GET)
	public String adminProductRegisterView() {
		return "/reservation/admin/adminProductRegister";
	}
	
	// 관리자 - 상품 등록
	@RequestMapping(value = "/reservation/admin/adminProductRegister", method = RequestMethod.POST)
	public String adminProductRegister(Product product, Model model, HttpServletRequest request) {
		int result = pService.insertProduct(product);
		if(result > 0) {
			List<Product> pList = pService.selectAllProduct();
			model.addAttribute("pList", pList);
			return "/reservation/admin/adminProductList";
		} else {
			Alert alert = new Alert("/home", "상품등록에 실패했습니다");
			model.addAttribute("alert", alert);
			return "common/alert";
		}
	}
	
	@RequestMapping(value = "/reservation/admin/adminProductDetailView", method = RequestMethod.GET)
	public String adminProductDetailView(int productNo, HttpServletRequest request, Model model) {
		String checkAdmin = checkAdmin(request);
		if(checkAdmin.equals("notLogin")) {  
			return "redirect:/user/login";
		} else if(checkAdmin.equals("notAdmin")) {  
			return "redirect:/";
		} else {
			Product product = pService.selectOneByProductNo(productNo);
			model.addAttribute("product", product);
			return "/reservation/admin/adminProductDetail";
		}
	}

	@RequestMapping(value = "/reservation/admin/adminProductRemove", method = RequestMethod.GET)
	public String adminProductRemove(int productNo, HttpServletRequest request, Model model) {
		String checkAdmin = checkAdmin(request);
		if(checkAdmin.equals("notLogin")) {  
			return "redirect:/user/login";
		} else if(checkAdmin.equals("notAdmin")) {  
			return "redirect:/";
		} else {
			int result = pService.deleteProduct(productNo);
			List<Product> pList = pService.selectAllProduct();
			model.addAttribute("pList", pList);
			return "/reservation/admin/adminProductList";
		}
	}
	
	@RequestMapping(value = "/reservation/admin/adminProductModify", method = RequestMethod.POST)
	public String adminProductModify(Product product, Model model) {
		int result = pService.modifyProduct(product);
		Product product2 = pService.selectOneByProductNo(product.getProductNo());
		model.addAttribute("product", product2);
		return "/reservation/admin/adminProductDetail";
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
	// 헤더의 name 값 연결 메소드
	public void getUserName(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		if(userId != null) {
			User user = uService.selectUserById(userId);
			model.addAttribute("name", user.getUserName());
		}
	}
	
}
