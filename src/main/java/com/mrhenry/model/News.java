package com.mrhenry.model;

public class News extends Abstract<News> {
	private String title;
	private String thumbnail;
	private String shortdescription;
	private String content;
	private Long categoryId;
	private String categoryCode;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getShortdescription() {
		return shortdescription;
	}
	public void setShortdescription(String shortdescription) {
		this.shortdescription = shortdescription;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	
	public News() {}
	
	public News(String title, String thumbnail, String shortdescription, String content, Long categoryid) {
		super();
		this.title = title;
		this.thumbnail = thumbnail;
		this.shortdescription = shortdescription;
		this.content = content;
		this.categoryId = categoryid;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	
	
}
