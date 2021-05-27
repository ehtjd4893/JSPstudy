package dto;

import java.sql.Date;

public class ReplyDTO {
	
	private long idx;
	private String author;
	private String content;
	private String ip;
	private long boardIdx;
	private Date postDate;
	public long getIdx() {
		return idx;
	}
	public void setIdx(long idx) {
		this.idx = idx;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public long getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(long boardIdx) {
		this.boardIdx = boardIdx;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	
	
}
