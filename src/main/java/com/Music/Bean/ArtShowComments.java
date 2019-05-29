package com.Music.Bean;

import java.util.Date;

public class ArtShowComments {
	
	    private int  id; 
	    private int  showId;
	    private int  userId;
	    private String content;
	    private int giveLike;
	    private Date createTime;
		private int state;
	    private int replyId;
	    public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getShowId() {
			return showId;
		}
		public void setShowId(int showId) {
			this.showId = showId;
		}
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getGiveLike() {
			return giveLike;
		}
		public void setGiveLike(int giveLike) {
			this.giveLike = giveLike;
		}
		public Date getCreateTime() {
			return createTime;
		}
		public void setCreateTime(Date createTime) {
			this.createTime = createTime;
		}
		public int getState() {
			return state;
		}
		public void setState(int state) {
			this.state = state;
		}
		public int getReplyId() {
			return replyId;
		}
		public void setReplyId(int replyId) {
			this.replyId = replyId;
		}
		@Override
		public String toString() {
			return "ArtShowComments [id=" + id + ", showId=" + showId + ", userId=" + userId + ", content=" + content
					+ ", giveLike=" + giveLike + ", createTime=" + createTime + ", state=" + state + ", replyId="
					+ replyId + "]";
		}
		
}
