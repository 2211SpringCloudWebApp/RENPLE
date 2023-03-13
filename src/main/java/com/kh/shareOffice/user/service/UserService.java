package com.kh.shareOffice.user.service;

import com.kh.shareOffice.user.domain.User;

public interface UserService {

	int insertUser(User user);

	int login(User user);

	User selectUserById(String userId);

	int modify(User user);

	User findId(User user);


}
