package com.kh.shareOffice.product.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shareOffice.product.domain.Product;
import com.kh.shareOffice.product.service.ProductService;
import com.kh.shareOffice.product.store.ProductStore;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductStore pStore;
	
	@Override
	public List<Product> selectAllProduct() {
		List<Product> pList = pStore.selectAllProduct();
		return pList;
	}

	@Override
	public int insertProduct(Product product) {
		int result = pStore.insertProduct(product);
		return result;
	}

	@Override
	public Product selectOneByProductNo(int productNo) {
		Product product = pStore.selectOneByProductNo(productNo);
		return product;
	}

	@Override
	public int deleteProduct(int productNo) {
		int result = pStore.deleteProduct(productNo);
		return result;
	}

	@Override
	public int modifyProduct(Product product) {
		int result = pStore.modifyProduct(product);
		return result;
	}
}
