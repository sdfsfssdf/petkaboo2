package com.pkb.petsitterService.model.vo;

import java.io.Serializable;

public class PageInfo implements Serializable{
	private static final long serialVersionUID = 5452336373252150108L;
	private int currentPage;
	private int listCount;
	private int limit;			// 한 페이지에 보여질 게시물을 설정하는 변수
	private int maxPage;		// 전체 페이지에서 가장 마지막 페이지
	private int startPage;		// 한 번에 표시되는 페이지가 시작될 페이지
	private int endPage;
	
	public PageInfo(){}

	public PageInfo(int currentPage, int listCount, int limit, int maxPage, int startPage, int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getListCount() {
		return listCount;
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

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
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

	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit + ", maxPage="
				+ maxPage + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}

}
