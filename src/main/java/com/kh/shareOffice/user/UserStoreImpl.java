package com.kh.shareOffice.user;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.shareOffice.PageInfo;
import com.kh.shareOffice.Search;

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
	
	@Override
	public User findPw(User user) {
		User getUser = session.selectOne("UserMapper.findPw", user);
		return getUser;
	}

	@Override
	public int updatePw(User user) {
		int result = session.update("UserMapper.updatePw", user);
		return result;
	}

	@Override
	public int checkId(String userId) {
		int result = session.selectOne("UserMapper.checkId", userId);
		return result;
	}

	@Override
	public int checkEmail(String userEmail) {
		int result = session.selectOne("UserMapper.checkEmail", userEmail);
		return result;
	}

//	@Override
//	public int getListCnt() {
//		int result = session.selectOne("UserMapper.getListCnt");
//		return result;
//	}
	
	@Override
	public int getListCnt(Search search) {
		int result = session.selectOne("UserMapper.getListCntSearch", search);
		return result;
	}

//	@Override
//	public List<User> selectAll(PageInfo pi) {
//		int limit = pi.getBoardLimit();
//		int currentPage = pi.getCurrentPage();
//		int offset = (currentPage - 1) * limit;
//		RowBounds rowBounds = new RowBounds(offset, limit);
//		
//		List<User> list = session.selectList("UserMapper.selectAll", "admin", rowBounds);
//		return list;
//	}
	
	@Override
	public List<User> selectAll(PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<User> list = session.selectList("UserMapper.selectAllSearch", search , rowBounds);
		return list;
	}

	@Override
	public int modify(User user) {
		int result = session.update("UserMapper.modify", user);
		return result;
	}

	@Override
	public User findId(User user) {
		User getUser = session.selectOne("UserMapper.findId", user);
		return getUser;
	}

	@Override
	public int checkMyEmail(User user) {
		int result = session.selectOne("UserMapper.checkMyEmail", user);
		return result;
	}

	@Override
	public int bye(String userId) {
		int result = session.delete("UserMapper.bye", userId);
		return result;
	}
	
}
