package com.studio.rentRoom.utils;

import java.util.List;

/*
 * ��װ��ҳ��Ϣ
 */
public class Page<T> {

	private int pageNo;// ��ǰ�ǵڼ�ҳ
	private int pageSize = 3;// ÿҳ��ʾ�Ķ�������¼��
	private long totalItemNumber;// ���ж�������¼��
	private List<T> list; // ��ǰҳ��list


	public Page(int pageNo) {
		super();
		this.pageNo = pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public int getPageNo() {
		if(pageNo < 0) {
			pageNo = 1;
		}
		
		if (pageNo > getTotalPageNumber()) {
			pageNo = getTotalPageNumber();
		}
		return pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setList(List<T> list) {
		this.list = list;
	}
	
	public List<T> getList() {
		return list;
	}

	public void setTotalItemNumber(long totalItemNumber) {
		this.totalItemNumber = totalItemNumber;
	}
	
	public long getTotalItemNumber() {
		return totalItemNumber;
	}
	
	//��ҳ��
	public int getTotalPageNumber() {
		int totalPageNumber = (int) (totalItemNumber / pageSize);
		if ((totalItemNumber % pageSize) !=0) {
			totalPageNumber++;
		}
		return totalPageNumber;
	}
	
	public boolean isHasNext() {
		if(getPageNo() < getTotalPageNumber()) {
			return true;
		}
		return false;
	}
	
	public boolean isHasPrev() {
		if(getPageNo() > 1) {
			return true;
		}
		return false;
	}
	
	public int getNextPage() {
		if (getPageNo() < getTotalPageNumber()) {
			return getPageNo() + 1;
		}
		return getPageNo();
	}
	
	public int getPrevPage() {
		if (getPageNo() > 1) {
			return getPageNo() - 1;
		}
		return getPageNo();
	}
}
