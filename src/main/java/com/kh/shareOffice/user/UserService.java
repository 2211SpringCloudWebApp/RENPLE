package com.kh.shareOffice.user;

import java.util.List;

import com.kh.shareOffice.PageInfo;
import com.kh.shareOffice.Search;

public interface UserService {

	int insertUser(User user);

	int login(User user);

	User selectUserById(String userId);

	User findPw(User user);

	int updatePw(User user);

	int checkId(String userId);

	int checkEmail(String userEmail);

//	int getListCnt();

	int getListCnt(Search search);
	
//	List<User> selectAll(PageInfo pi);
	
	List<User> selectAll(PageInfo pi, Search search);

	int modify(User user);

	User findId(User user);

	int checkMyEmail(User user);

	int bye(String userId);

}
