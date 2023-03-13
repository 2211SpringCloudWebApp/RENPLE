package com.kh.shareOffice.user.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shareOffice.PageInfo;
import com.kh.shareOffice.Search;
import com.kh.shareOffice.user.domain.User;
import com.kh.shareOffice.user.service.UserService;
import com.kh.shareOffice.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserStore uStore;
	
	@Override
	public int insertUser(User user) {
		int result = uStore.insertUser(user);
		return result;
	}

	@Override
	public int login(User user) {
		int result = uStore.login(user);
		return result;
	}

	@Override
	public User selectUserById(String userId) {
		User user = uStore.selectUserById(userId);
		return user;
	}

	@Override
	public int updateUser(User user) {
		int result = uStore.updateUser(user);
		return result;
	}

	@Override
	public User findPw(User user) {
		User getUser = uStore.findPw(user);
		return getUser;
	}

	@Override
	public int updatePw(User user) {
		int result = uStore.updatePw(user);
		return result;
	}

	@Override
	public int checkId(String userId) {
		int result = uStore.checkId(userId);
		return result;
	}

	@Override
	public int checkEmail(String userEmail) {
		int result = uStore.checkEmail(userEmail);
		return result;
	}

//	@Override
//	public int getListCnt() {
//		int result = uStore.getListCnt();
//		return result;
//	}
	
	@Override
	public int getListCnt(Search search) {
		int result = uStore.getListCnt(search);
		return result;
	}

//	@Override
//	public List<User> selectAll(PageInfo pi) {
//		List<User> list = uStore.selectAll(pi);
//		return list;
//	}
	
	@Override
	public List<User> selectAll(PageInfo pi, Search search) {
		List<User> list = uStore.selectAll(pi, search);
		return list;
	}

	@Override
	public int modify(User user) {
		int result = uStore.modify(user);
		return result;
	}

	@Override
	public User findId(User user) {
		User getUser = uStore.findId(user);
		return getUser;
	}
}
