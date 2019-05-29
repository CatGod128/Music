package com.Music.Bean;


public class ArtShowCommentsBean extends ArtShowComments {
    // 评论用户头像
    private String img;
    // 评论用户昵称
    private String userName;
 
    public void setArtShowComments(ArtShowComments artShowComments) {
        this.setId(artShowComments.getId());
        this.setShowId(artShowComments.getShowId());
        this.setUserId(artShowComments.getUserId());
        this.setContent(artShowComments.getContent());
        this.setGiveLike(artShowComments.getGiveLike());
        this.setCreateTime(artShowComments.getCreateTime());
        this.setState(artShowComments.getState());
        this.setReplyId(artShowComments.getReplyId());
    }

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
    
}
