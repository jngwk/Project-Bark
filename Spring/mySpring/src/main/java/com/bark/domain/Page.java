package com.bark.domain;

import lombok.Data;

@Data
public class Page {
	private Integer 	start;	// 시작 버튼  
	private Integer		end;	// 종료버튼
	private boolean		prev;
	private boolean		next;
	private Integer 	total;  // 총건
	private Criteria	cri;
	
	
	public Page(Criteria cri, Integer total) {
		this.cri 	= cri;
		this.total 	= total;
		
		this.end	= (int)(Math.ceil((cri.getPageNum())/10.0))*10;  
		this.start	= this.end-9;
		int	realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		if (realEnd<this.end) {
			this.end = realEnd;
		}
		this.prev 	= this.start > 1;
		this.next	= this.end   < realEnd;
		
		this.cri = cri;
		
		// 검수용 삭제 가능
		System.out.println("cri-[" + cri.getPageNum() + ":" + cri.getAmount() + "]");
		System.out.println("page-[" + this.start + ":" + this.end + ":" + total +  "]");
		System.out.println("page-[" + this.prev + ":" + this.next + "]");
		
		// ---------

	}
}
