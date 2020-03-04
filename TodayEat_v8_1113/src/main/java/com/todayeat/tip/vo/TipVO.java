package com.todayeat.tip.vo;

public class TipVO {
	private String tname;
	private String timg;
	private String tkinds;
	private String torign;
	private String tproduction;
	private String tcol;
	private String tkeep;
	private String tdate;
	private String tsource;
	
	public TipVO() { }
	
	public TipVO(String tname, String timg, String tkinds, String torign, 
			String tproduction, String tcol, String tkeep,
			String tdate, String tsource) {
		this.tname = tname;
		this.timg = timg;
		this.tkinds = tkinds;
		this.torign = torign;
		this.tproduction = tproduction;
		this.tcol = tcol;
		this.tkeep = tkeep;
		this.tdate = tdate;
		this.tsource = tsource;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTimg() {
		return timg;
	}

	public void setTimg(String timg) {
		this.timg = timg;
	}

	public String getTkinds() {
		return tkinds;
	}

	public void setTkinds(String tkinds) {
		this.tkinds = tkinds;
	}

	public String getTorign() {
		return torign;
	}

	public void setTorign(String torign) {
		this.torign = torign;
	}

	public String getTproduction() {
		return tproduction;
	}

	public void setTproduction(String tproduction) {
		this.tproduction = tproduction;
	}

	public String getTcol() {
		return tcol;
	}

	public void setTcol(String tcol) {
		this.tcol = tcol;
	}

	public String getTkeep() {
		return tkeep;
	}

	public void setTkeep(String tkeep) {
		this.tkeep = tkeep;
	}

	public String getTdate() {
		return tdate;
	}

	public void setTdate(String tdate) {
		this.tdate = tdate;
	}

	public String getTsource() {
		return tsource;
	}

	public void setTsource(String tsource) {
		this.tsource = tsource;
	}
	
}
