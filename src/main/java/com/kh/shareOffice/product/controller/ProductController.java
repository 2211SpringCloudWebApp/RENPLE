package com.kh.shareOffice.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.shareOffice.Alert;
import com.kh.shareOffice.product.domain.Product;
import com.kh.shareOffice.product.service.ProductService;
import com.kh.shareOffice.reservation.service.ReservationService;
import com.kh.shareOffice.user.User;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;
	@Autowired
	private ReservationService rService;
	
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
	
	// 관리자 - 상품 목록 조회
	@RequestMapping(value = "/reservation/admin/adminProductList", method = RequestMethod.GET)
	public String adminProductList(Model model, HttpServletRequest request) {
		String checkAdmin = checkAdmin(request);
		if(checkAdmin.equals("notLogin")) {  
			return "redirect:/user/login";
		} else if(checkAdmin.equals("notAdmin")) {  
			return "redirect:/";
		} else {
			List<Product> pList = pService.selectAllProduct();
			model.addAttribute("pList", pList);
			return "/reservation/admin/adminProductList";
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
}
