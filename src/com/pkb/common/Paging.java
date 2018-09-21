package com.pkb.common;

public class Paging {
	int currentPage; 	// 현재 페이지를
	int limit;			// 한 페이지에 게시글이 몇개 표시할지
	int maxPage;		// 전체 페이지에서 가장 마지막 페이지
	int startPage;		// 표시될 페이지 중 시작할 페이지
	int endPage;		// 표시될 페이지 중 마지막 페이지
	int listCount;		// 전체 게시글 수 
	
	public Paging() {
		
	}

	public Paging(int currentPage, int limit) {
		super();
		this.currentPage = currentPage;
		this.limit = limit;
	}

	public Paging(int currentPage, int limit, int maxPage, int startPage, int endPage, int listCount) {
		super();
		this.currentPage = currentPage;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getLimit() {
		return limit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	@Override
	public String toString() {
		return "Paging [currentPage=" + currentPage + ", limit=" + limit + ", maxPage=" + maxPage + ", startPage="
				+ startPage + ", endPage=" + endPage + ", listCount=" + listCount + "]";
	}
	
	
	
}
