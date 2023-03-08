package com.kh.shareOffice.product.domain;

import java.sql.Timestamp;

public class Product {
	private int productNo;
	private String productName;
	private int productPrice;
	private String productDescription;
	private int productSize;	// String -> int
	private int productUserMax;
	private int productUserMin;
	private Timestamp pRentalDate;
	
	public Product() {
		super();
	}

	public Product(int productNo, String productName, int productPrice, String productDescription, int productSize,
			int productUserMax, int productUserMin, Timestamp pRentalDate) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productDescription = productDescription;
		this.productSize = productSize;
		this.productUserMax = productUserMax;
		this.productUserMin = productUserMin;
		this.pRentalDate = pRentalDate;
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

	public int getProductSize() {
		return productSize;
	}

	public void setProductSize(int productSize) {
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

	public Timestamp getpRentalDate() {
		return pRentalDate;
	}

	public void setpRentalDate(Timestamp pRentalDate) {
		this.pRentalDate = pRentalDate;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productDescription=" + productDescription + ", productSize=" + productSize + ", productUserMax="
				+ productUserMax + ", productUserMin=" + productUserMin + ", pRentalDate=" + pRentalDate + "]";
	}
	
}
