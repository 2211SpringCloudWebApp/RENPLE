package com.kh.shareOffice.product.store;

import java.util.List;

import com.kh.shareOffice.product.domain.Product;
import com.kh.shareOffice.reservation.domain.PageInfo;
import com.kh.shareOffice.reservation.domain.SearchBoard;

public interface ProductStore {

	List<Product> selectAllProduct();

	int insertProduct(Product product);

	Product selectOneByProductNo(int productNo);

	int deleteProduct(int productNo);

	int modifyProduct(Product product);

	int getAdminProductListCount();

	List<Product> selectAdminProductBoard(PageInfo pi);

	int getAdminProductSearchListCount(SearchBoard searchBoard);

	List<Product> selectAdminProductListByKeyword(PageInfo pi, SearchBoard searchBoard);
}
