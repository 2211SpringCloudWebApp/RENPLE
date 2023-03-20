package com.kh.shareOffice.product.service;

import java.util.List;

import com.kh.shareOffice.product.domain.Product;

public interface ProductService {
	
	List<Product> selectAllProduct();

	int insertProduct(Product product);

	Product selectOneByProductNo(int productNo);

	int deleteProduct(int productNo);

	int modifyProduct(Product product);
}
