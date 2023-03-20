package com.kh.shareOffice.reservation;

import java.sql.Timestamp;

public class ReservationList {
	
	private int orderNo;
	private String orderName;
	private String orderPhone;
	private String orderEmail;
	private String postCode;        // 우편번호
	private String roadAddress;     // 도로명
	private String detailAddress;   // 상세주소
	private String orderRequest;    // 요청사항
	private int orderUserCount;  // 예약인원
	private String reservationDate; // 예약날짜
	private Timestamp orderDate;	// 결제시간
	
	private int productNo;
	private String productName;
	private int productPrice;
	private String productDescription;
	private String productSize;
	private int productUserMax;
	private int productUserMin;
	private Timestamp productCreateDate;
	
	// 예약번호, 예약자, 예약인원, 예약날짜, 상품이름, 상품가격, 결제날짜
	
	public ReservationList() {}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderEmail() {
		return orderEmail;
	}

	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getOrderRequest() {
		return orderRequest;
	}

	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}

	public int getOrderUserCount() {
		return orderUserCount;
	}

	public void setOrderUserCount(int orderUserCount) {
		this.orderUserCount = orderUserCount;
	}

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductSize() {
		return productSize;
	}

	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}

	public int getProductUserMax() {
		return productUserMax;
	}

	public void setProductUserMax(int productUserMax) {
		this.productUserMax = productUserMax;
	}

	public int getProductUserMin() {
		return productUserMin;
	}

	public void setProductUserMin(int productUserMin) {
		this.productUserMin = productUserMin;
	}

	public Timestamp getProductCreateDate() {
		return productCreateDate;
	}

	public void setProductCreateDate(Timestamp productCreateDate) {
		this.productCreateDate = productCreateDate;
	}

	@Override
	public String toString() {
		return "ReservationList [orderNo=" + orderNo + ", orderName=" + orderName + ", orderPhone=" + orderPhone
				+ ", orderEmail=" + orderEmail + ", postCode=" + postCode + ", roadAddress=" + roadAddress
				+ ", detailAddress=" + detailAddress + ", orderRequest=" + orderRequest + ", orderUserCount="
				+ orderUserCount + ", reservationDate=" + reservationDate + ", orderDate=" + orderDate + ", productNo="
				+ productNo + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productDescription=" + productDescription + ", productSize=" + productSize + ", productUserMax="
				+ productUserMax + ", productUserMin=" + productUserMin + ", productCreateDate=" + productCreateDate
				+ "]";
	}
	
	
	
}
