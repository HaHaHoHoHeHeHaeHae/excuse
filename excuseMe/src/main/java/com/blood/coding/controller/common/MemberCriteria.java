package com.blood.coding.controller.common;

public class MemberCriteria {
	private int page;			//페이지 번호
	private int perPageNum;		//한페이지 당 보여주는 리스트 개수
	private String searchType; //검색 구분
	private String keyword; //검색어
	
	public MemberCriteria() {
		this(1, 10, "", "");
	}
	

	public MemberCriteria(int page, int perPageNum, String searchType, String keyword) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		this.searchType = searchType;
		this.keyword = keyword;
	}


	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page<1) {
			page=1;			
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum > 50) {
			perPageNum=50;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPageStartRowNum(){ //각 페이지마다 시작하는 행번호
		return (this.page-1)*perPageNum;
	}
	

	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}
