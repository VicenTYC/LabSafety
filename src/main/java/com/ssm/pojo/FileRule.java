package com.ssm.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FileRule {
	private int file_id;
	private String file_name;
	@JsonFormat(pattern = "yy年MM月dd日")
	private Date file_date;
	private String file_path; // 存放路径，不包括文件名
	private String show_name;

	public int getFile_id() {
		return file_id;
	}

	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public Date getFile_date() {
		return file_date;
	}

	public void setFile_date(Date file_date) {
		this.file_date = file_date;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getShow_name() {
		return show_name;
	}

	public void setShow_name(String show_name) {
		this.show_name = show_name;
	}
}
