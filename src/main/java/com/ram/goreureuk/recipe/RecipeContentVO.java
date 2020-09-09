package com.ram.goreureuk.recipe;

public class RecipeContentVO {

	private String rcc_rccode;
	private String rcc_rcmmcode;
	private String rcc_rcmmid;
	private String rcc_code;
	private String rcc_source;
	private String rcc_stepinfo;
	private int rcc_step;
	
	public String getRcc_rccode() {
		return rcc_rccode;
	}
	public void setRcc_rccode(String rcc_rccode) {
		this.rcc_rccode = rcc_rccode;
	}
	public String getRcc_rcmmcode() {
		return rcc_rcmmcode;
	}
	public void setRcc_rcmmcode(String rcc_rcmmcode) {
		this.rcc_rcmmcode = rcc_rcmmcode;
	}
	public String getRcc_rcmmid() {
		return rcc_rcmmid;
	}
	public void setRcc_rcmmid(String rcc_rcmmid) {
		this.rcc_rcmmid = rcc_rcmmid;
	}
	public String getRcc_code() {
		return rcc_code;
	}
	public void setRcc_code(String rcc_code) {
		this.rcc_code = rcc_code;
	}
	public String getRcc_source() {
		return rcc_source;
	}
	public void setRcc_source(String rcc_source) {
		this.rcc_source = rcc_source;
	}
	public String getRcc_stepinfo() {
		return rcc_stepinfo;
	}
	public void setRcc_stepinfo(String rcc_stepinfo) {
		this.rcc_stepinfo = rcc_stepinfo;
	}
	public int getRcc_step() {
		return rcc_step;
	}
	public void setRcc_step(int rcc_step) {
		this.rcc_step = rcc_step;
	}
	
	@Override
	public String toString() {
		return "RecipeContentVO [rcc_rccode=" + rcc_rccode + ", rcc_rcmmcode=" + rcc_rcmmcode + ", rcc_rcmmid="
				+ rcc_rcmmid + ", rcc_code=" + rcc_code + ", rcc_source=" + rcc_source + ", rcc_stepinfo="
				+ rcc_stepinfo + ", rcc_step=" + rcc_step + "]";
	}
	
}
