package com.todayeat.season.vo;

public class SeasonVO {
	private String season;
	private String season_img1;
	private String season_img2;
	private String season_img3;
	
	public SeasonVO() {
	}

	public SeasonVO(String season, String season_img1, String season_img2, String season_img3) {
		this.season = season;
		this.season_img1 = season_img1;
		this.season_img2 = season_img2;
		this.season_img3 = season_img3;
	}

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public String getSeason_img1() {
		return season_img1;
	}

	public void setSeason_img1(String season_img1) {
		this.season_img1 = season_img1;
	}

	public String getSeason_img2() {
		return season_img2;
	}

	public void setSeason_img2(String season_img2) {
		this.season_img2 = season_img2;
	}

	public String getSeason_img3() {
		return season_img3;
	}

	public void setSeason_img3(String season_img3) {
		this.season_img3 = season_img3;
	}
	
}
