package com.kh.shareOffice.product.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.shareOffice.product.domain.Product;
import com.kh.shareOffice.product.store.ProductStore;

@Repository
public class ProductStoreLogic implements ProductStore{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Product> selectAllProduct() {
		List<Product> pList = session.selectList("ProductMapper.selectAllProduct");
		return pList;
	}

	@Override
	public int insertProduct(Product product) {
		int result = session.insert("ProductMapper.insertProduct", product);
		return result;
	}  

	@Override
	public Product selectOneByProductNo(int productNo) {
		Product product = session.selectOne("ProductMapper.selectOneByProductNo", productNo);
		return product;
	}

	@Override
	public int deleteProduct(int productNo) {
		int result = session.delete("ProductMapper.deleteProduct", productNo);
		return result;
	}

	@Override
	public int modifyProduct(Product product) {
		int result = session.update("ProductMapper.modifyProduct", product);
		return result;
	}
	
	
}
