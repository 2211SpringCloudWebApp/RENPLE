package com.kh.shareOffice.product.store;

import java.util.List;

import com.kh.shareOffice.product.domain.Product;

public interface ProductStore {

	List<Product> selectAllProduct();

	int insertProduct(Product product);

	Product selectOneByProductNo(int productNo);

	int deleteProduct(int productNo);

	int modifyProduct(Product product);
}
