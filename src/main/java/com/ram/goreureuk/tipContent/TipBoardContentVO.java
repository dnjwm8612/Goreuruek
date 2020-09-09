package com.ram.goreureuk.tipContent;

import java.util.List;
import java.util.Map;

public class TipBoardContentVO {
	
	public String tc_tcode;
	public String tc_tmmcode;
	public String tc_tmmid;
	public String tc_content;
	public String tc_image;
	
	
	public String getTc_tcode() {
		return tc_tcode;
	}
	public void setTc_tcode(String tc_tcode) {
		this.tc_tcode = tc_tcode;
	}
	public String getTc_tmmcode() {
		return tc_tmmcode;
	}
	public void setTc_tmmcode(String tc_tmmcode) {
		this.tc_tmmcode = tc_tmmcode;
	}
	public String getTc_tmmid() {
		return tc_tmmid;
	}
	public void setTc_tmmid(String tc_tmmid) {
		this.tc_tmmid = tc_tmmid;
	}
	public String getTc_content() {
		return tc_content;
	}
	public void setTc_content(String tc_content) {
		this.tc_content = tc_content;
	}
	public String getTc_image() {
		return tc_image;
	}
	public void setTc_image(String image) {
		this.tc_image = image;
	}
	
	@Override
	public String toString() {
		return "TipBoardContent [tc_tcode=" + tc_tcode + ", tc_tmmcode=" + tc_tmmcode + ", tc_tmmid=" + tc_tmmid
				+ ", tc_content=" + tc_content + ", tc_image=" + tc_image + "]";
	}

	
}
