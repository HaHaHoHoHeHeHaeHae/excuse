package com.blood.coding.controller.common;

//나중에 뷰단에서 category+keyword+local 한꺼번에 받아올거에요(컨트롤러한테)
//컨트롤러는 cri만 받으면됨.

public class Criteria {
	private int page;			//페이지 번호
	private int perPageNum;		//한페이지 당 리스트 개수
	private String category; 
	private String keyword;     //검색어
	private String local;
	private int alignment;
	private int sort;
	
	
	public Criteria() {
		this(1, 10, "", "", "", 0,0);
	} 


	public int getSort() {
		return sort;
	}


	public void setSort(int sort) {
		this.sort = sort;
	}


	public Criteria(int page, int perPageNum, String category, String keyword, String local, int alignment,int sort) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		this.category = category;
		this.keyword = keyword;
		this.local = local;
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
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}


	public int getAlignment() {
		return alignment;
	}

	public void setAlignment(int alignment) {
		this.alignment = alignment;
	}


	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", category=" + category + ", keyword="
				+ keyword + ", local=" + local + ", alignment=" + alignment + ", sort=" + sort + "]";
	}
	
	
	
}
