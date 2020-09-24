package com.jachi.DTO;

public class TipReplyDTO {
    String rep_nickname;
    String rep_img;
    int tip_num;
    int rep_num;
    String rep_post;
    String rep_date;
    
	public String getRep_nickname() {
		return rep_nickname;
	}
	public void setRep_nickname(String rep_nickname) {
		this.rep_nickname = rep_nickname;
	}
	public String getRep_img() {
		return rep_img;
	}
	public void setRep_img(String rep_img) {
		this.rep_img = rep_img;
	}
	public int getTip_num() {
		return tip_num;
	}
	public void setTip_num(int post_num) {
		this.tip_num = post_num;
	}
	public int getRep_num() {
		return rep_num;
	}
	public void setRep_num(int rep_num) {
		this.rep_num = rep_num;
	}
	public String getRep_post() {
		return rep_post;
	}
	public void setRep_post(String rep_post) {
		this.rep_post = rep_post;
	}
	public String getRep_date() {
		return rep_date;
	}
	public void setRep_date(String rep_time) {
		this.rep_date = rep_time;
	}
    
}
