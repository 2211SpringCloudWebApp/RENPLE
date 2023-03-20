package com.kh.shareOffice.reservation;

import java.sql.Timestamp;

public class Product {
	private int productNo;
	private String productName;
	private int productPrice;
	private String productDescription;
	private String productSize;
	private int productUserMax;
	private int productUserMin;
	private Timestamp pCreateDate;
	
	public Product() {}
	
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
	public Timestamp getpCreateDate() {
		return pCreateDate;
	}
	public void setpCreateDate(Timestamp pCreateDate) {
		this.pCreateDate = pCreateDate;
	}
	
	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productDescription=" + productDescription + ", productSize=" + productSize + ", productUserMax="
				+ productUserMax + ", productUserMin=" + productUserMin + ", pCreateDate=" + pCreateDate + "]";
	}

	
}
