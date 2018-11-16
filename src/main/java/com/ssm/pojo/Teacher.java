package com.ssm.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Teacher {
     private int teacher_id;
     private String teacher_name;
     private String teacher_college;
     @JsonFormat(pattern = "yy年MM月dd日 HH:mm:ss")
     private Date last_date;
     private String teacher_password;
	public int getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(int teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getTeacher_college() {
		return teacher_college;
	}
	public void setTeacher_college(String teacher_college) {
		this.teacher_college = teacher_college;
	}
	public Date getLast_date() {
		return last_date;
	}
	public void setLast_date(Date last_date) {
		this.last_date = last_date;
	}
	public String getTeacher_password() {
		return teacher_password;
	}
	public void setTeacher_password(String teacher_password) {
		this.teacher_password = teacher_password;
	}
     
}
