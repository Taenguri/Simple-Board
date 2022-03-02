package com.board.vo;

import java.util.Date;

public class ReplyVO {
	private int bno;
	private int rno;
	private String replyContent;
	private Date replyRegdate;
	private String memberId;
	
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyRegdate() {
		return replyRegdate;
	}
	public void setReplyRegdate(Date replyRegdate) {
		this.replyRegdate = replyRegdate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "ReplyVO [bno=" + bno + ", rno=" + rno + ", replyContent=" + replyContent + ", replyRegdate="
				+ replyRegdate + ", memberId=" + memberId + "]";
	}
	
	
	
	
}
