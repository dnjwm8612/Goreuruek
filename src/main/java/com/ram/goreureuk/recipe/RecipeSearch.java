package com.ram.goreureuk.recipe;

public class RecipeSearch {
	private String keyword;
	private String RC_KINDS;
	private String RC_SITUATION;
	private String RC_MATERIAL;
	private String RC_WAYS;
	private String releasedate;
	private String views;
	private String popular;
	private String comments;
	
	
	public String getReleasedate() {
		return releasedate;
	}

	public void setReleasedate(String releasedate) {
		this.releasedate = releasedate;
	}

	public String getViews() {
		return views;
	}

	public void setViews(String views) {
		this.views = views;
	}

	public String getPopular() {
		return popular;
	}

	public void setPopular(String popular) {
		this.popular = popular;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getRC_KINDS() {
		return RC_KINDS;
	}

	public void setRC_KINDS(String rC_KINDS) {
		RC_KINDS = rC_KINDS;
	}

	public String getRC_SITUATION() {
		return RC_SITUATION;
	}

	public void setRC_SITUATION(String rC_SITUATION) {
		RC_SITUATION = rC_SITUATION;
	}

	public String getRC_MATERIAL() {
		return RC_MATERIAL;
	}

	public void setRC_MATERIAL(String rC_MATERIAL) {
		RC_MATERIAL = rC_MATERIAL;
	}

	public String getRC_WAYS() {
		return RC_WAYS;
	}

	public void setRC_WAYS(String rC_WAYS) {
		RC_WAYS = rC_WAYS;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	//디폴트값
	public  RecipeSearch(){
	      this.keyword = "";
	      this.RC_KINDS = "";
	      this.RC_MATERIAL = "";
	      this.RC_SITUATION = "";
	      this.RC_WAYS = "";
	      this.releasedate = "";
	      this.views = "";
	      this.comments = "";
	      this.popular = "";
	     }
	
	
	@Override
	public String toString() {
		return "RecipeSearch [keyword=" + keyword + ", RC_KINDS=" + RC_KINDS + ", RC_SITUATION=" + RC_SITUATION
				+ ", RC_MATERIAL=" + RC_MATERIAL + ", RC_WAYS=" + RC_WAYS + ", releasedate=" + releasedate + ", views="
				+ views + ", popular=" + popular + ", comments=" + comments + "]";
	}



	
}
