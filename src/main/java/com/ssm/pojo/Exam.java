package com.ssm.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Exam {
	private int exam_id;
	private String exam_name;
	private String bank_type;
	@JsonFormat(pattern = "yyyy年MM月dd日 HH:mm:ss")
	private Date exam_begin_time;
	@JsonFormat(pattern = "HH:mm:ss")
	private Date exam_duration;
	private int teacher_id;
	private int single_num;
	private int single_score;
	private int mulit_num;
	private int mulit_score;
	private int torf_num;
	private int torf_score;
	private int if_finish;

	public int getIf_finish() {
		return if_finish;
	}

	public void setIf_finish(int if_finish) {
		this.if_finish = if_finish;
	}

	public int getExam_id() {
		return exam_id;
	}

	public void setExam_id(int exam_id) {
		this.exam_id = exam_id;
	}

	public String getExam_name() {
		return exam_name;
	}

	public void setExam_name(String exam_name) {
		this.exam_name = exam_name;
	}

	public String getBank_type() {
		return bank_type;
	}

	public void setBank_type(String bank_type) {
		this.bank_type = bank_type;
	}

	public Date getExam_begin_time() {
		return exam_begin_time;
	}

	public void setExam_begin_time(String str) {
		str = str.replace(".0", "");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date exam_begin_time;
		try {
			exam_begin_time = sdf.parse(str);
			this.exam_begin_time = exam_begin_time;
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public Date getExam_duration() {
		return exam_duration;
	}

	public void setExam_duration(String str) {
		str = str.replace(".0", "");
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		Date exam_duration;
		try {
			exam_duration = sdf.parse(str);
			this.exam_duration = exam_duration;
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public int getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(int teacher_id) {
		this.teacher_id = teacher_id;
	}

	public int getSingle_num() {
		return single_num;
	}

	public void setSingle_num(int single_num) {
		this.single_num = single_num;
	}

	public int getSingle_score() {
		return single_score;
	}

	public void setSingle_score(int single_score) {
		this.single_score = single_score;
	}

	public int getMulit_num() {
		return mulit_num;
	}

	public void setMulit_num(int mulit_num) {
		this.mulit_num = mulit_num;
	}

	public int getMulit_score() {
		return mulit_score;
	}

	public void setMulit_score(int mulit_score) {
		this.mulit_score = mulit_score;
	}

	public int getTorf_num() {
		return torf_num;
	}

	public void setTorf_num(int torf_num) {
		this.torf_num = torf_num;
	}

	public int getTorf_score() {
		return torf_score;
	}

	public void setTorf_score(int torf_score) {
		this.torf_score = torf_score;
	}

}
