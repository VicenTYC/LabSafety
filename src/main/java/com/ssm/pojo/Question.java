package com.ssm.pojo;

import org.springframework.stereotype.Component;

@Component
public class Question {
    int question_id;
    String question_content;
    String question_item;
    String question_answer;
    int question_type;
    int bank_id;
    String question_analysis;
    
	public String getQuestion_analysis() {
		return question_analysis;
	}
	public void setQuestion_analysis(String question_analysis) {
		this.question_analysis = question_analysis;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public String getQuestion_item() {
		return question_item;
	}
	public void setQuestion_item(String question_item) {
		this.question_item = question_item;
	}
	public String getQuestion_answer() {
		return question_answer;
	}
	public void setQuestion_answer(String question_answer) {
		this.question_answer = question_answer;
	}
	public int getQuestion_type() {
		return question_type;
	}
	public void setQuestion_type(int question_type) {
		this.question_type = question_type;
	}
	public int getBank_id() {
		return bank_id;
	}
	public void setBank_id(int bank_id) {
		this.bank_id = bank_id;
	}
    
}
