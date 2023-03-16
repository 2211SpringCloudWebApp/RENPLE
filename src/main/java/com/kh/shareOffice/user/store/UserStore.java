package com.kh.shareOffice.user.store;

import com.kh.shareOffice.user.domain.User;

public interface UserStore {

	int insertUser(User user);

	int login(User user);

	User selectUserById(String userId);
	
	int modify(User user);

	User findId(User user);

	int checkId(String userId);

	int checkEmail(String userEmail);

}
