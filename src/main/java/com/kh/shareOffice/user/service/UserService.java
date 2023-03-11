package com.kh.shareOffice.user.service;

import java.util.List;

import com.kh.shareOffice.PageInfo;
import com.kh.shareOffice.user.domain.User;

public interface UserService {

	int insertUser(User user);

	int login(User user);

	User selectUserById(String userId);

	List<User> selectAll(PageInfo pi);
	
	int getListCnt();

	int updateUser(User user);

	User findPw(User user);

	int updatePw(User user);

	int checkId(String userId);

	int checkEmail(String userEmail);

}
