package com.blood.coding.controller.common;

public class MemberCriteria {
	private int page;			//페이지 번호
	private int perPageNum;		//한페이지 당 보여주는 리스트 개수
	private String searchType; //검색 구분
	private String keyword; //검색어
	private int alignment; //가입순정렬
	private int sort; //활성 비활성 정렬
	private String mem_id;
	private String mem_name;
	
	
	public String getMem_id() {
		return mem_id;
	}




	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}




	public String getMem_name() {
		return mem_name;
	}




	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}




	public MemberCriteria() {
		this(1, 10, "", "",0,0,"","");
	}
	



	public int getSort() {
		return sort;
	}


	public void setSort(int sort) {
		this.sort = sort;
	}


	public int getAlignment() {
		return alignment;
	}


	public void setAlignment(int alignment) {
		this.alignment = alignment;
	}


	public MemberCriteria(int page, int perPageNum, String searchType, String keyword,int alignment,int sort,String mem_id, String mem_name) {
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
		return "MemberCriteria [page=" + page + ", perPageNum=" + perPageNum + ", searchType=" + searchType
				+ ", keyword=" + keyword + ", alignment=" + alignment + ", sort=" + sort + ", mem_id=" + mem_id
				+ ", mem_name=" + mem_name + "]";
	}

	

	
	
}
