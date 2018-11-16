package com.ssm.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;


public class Regulation {
    private int file_id;
    private String file_name;
    @JsonFormat(pattern = "yy年MM月dd日")
    private Date file_date;
    private String file_content;
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
	public String getFile_content() {
		return file_content;
	}
	public void setFile_content(String file_content) {
		this.file_content = file_content;
	}

}
