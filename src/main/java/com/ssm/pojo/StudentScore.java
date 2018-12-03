package com.ssm.pojo;


public class StudentScore {
 private int id;
 private int exam_id;
 private String student_id;
 private int score;
 private String wrong_question;
 private String student_college;
 private String student_major;
 private String student_name;
 
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getExam_id() {
	return exam_id;
}
public void setExam_id(int exam_id) {
	this.exam_id = exam_id;
}
public int getScore() {
	return score;
}
public void setScore(int score) {
	this.score = score;
}
public String getWrong_question() {
	return wrong_question;
}
public void setWrong_question(String wrong_question) {
	this.wrong_question = wrong_question;
}
public String getStudent_id() {
	return student_id;
}
public void setStudent_id(String student_id) {
	this.student_id = student_id;
}
public String getStudent_college() {
	return student_college;
}
public void setStudent_college(String student_college) {
	this.student_college = student_college;
}
public String getStudent_major() {
	return student_major;
}
public void setStudent_major(String student_major) {
	this.student_major = student_major;
}
public String getStudent_name() {
	return student_name;
}
public void setStudent_name(String student_name) {
	this.student_name = student_name;
}
 
}
