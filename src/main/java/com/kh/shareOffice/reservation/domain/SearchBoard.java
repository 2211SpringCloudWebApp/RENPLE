package com.kh.shareOffice.reservation.domain;

public class SearchBoard {
	private String searchValue;
	private String searchCondition;
	private String userId;
	
	public SearchBoard() {}

	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}



	@Override
	public String toString() {
		return "SearchBoard [searchValue=" + searchValue + ", searchCondition=" + searchCondition + ", userId=" + userId
				+ "]";
	}


	
}
