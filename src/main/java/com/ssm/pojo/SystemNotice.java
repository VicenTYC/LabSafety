package com.ssm.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SystemNotice {
	private int notice_id;
	private String notice_name;
	private String notice_content;
	@JsonFormat(pattern = "yy年MM月dd日")
	private Date notice_date;
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_name() {
		return notice_name;
	}
	public void setNotice_name(String notice_name) {
		this.notice_name = notice_name;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	
	

}
