package com.kh.shareOffice.payment.domain;

public class Payment {
	private int paymentNo;
	private String userId;
	private int productNo;
	
	public Payment() {
		super();
	}

	public Payment(int paymentNo, String userId, int productNo) {
		super();
		this.paymentNo = paymentNo;
		this.userId = userId;
		this.productNo = productNo;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", userId=" + userId + ", productNo=" + productNo + "]";
	}

}
