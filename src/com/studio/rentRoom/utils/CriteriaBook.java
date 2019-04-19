package com.studio.rentRoom.utils;

/*
 * 封装查询条件
 */
public class CriteriaBook {

	private int minPrize;
	private int maxPrize = Integer.MAX_VALUE;
	
	private int pageNo;
	
	public CriteriaBook() {
	}

	public CriteriaBook(int minPrize, int maxPrize, int pageNo) {
		super();
		this.minPrize = minPrize;
		this.maxPrize = maxPrize;
		this.pageNo = pageNo;
	}

	public int getMinPrize() {
		return minPrize;
	}

	public void setMinPrize(int minPrize) {
		this.minPrize = minPrize;
	}

	public int getMaxPrize() {
		return maxPrize;
	}

	public void setMaxPrize(int maxPrize) {
		this.maxPrize = maxPrize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	
}
