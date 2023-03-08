package com.kh.shareOffice.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.shareOffice.user.domain.User;
import com.kh.shareOffice.user.store.UserStore;

@Repository
public class UserStoreImpl implements UserStore{

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertUser(User user) {
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}

	@Override
	public int login(User user) {
		int result = session.selectOne("UserMapper.login", user);
		return result;
	}

	@Override
	public User selectUserById(String userId) {
		User user = session.selectOne("UserMapper.selectUserById", userId);
		return user;
	}

}
