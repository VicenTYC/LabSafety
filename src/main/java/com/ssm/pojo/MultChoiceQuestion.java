package com.ssm.pojo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class MultChoiceQuestion {
    private int quesBank;
    private String question;
    private String itemA;
    private String itemB;
    private String itemC;
    private String itemD;
    private List<String> answer;
    public int getQuesBank() {
		return quesBank;
	}
	public void setQuesBank(int quesBank) {
		this.quesBank = quesBank;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getItemA() {
		return itemA;
	}
	public void setItemA(String itemA) {
		this.itemA = itemA;
	}
	public String getItemB() {
		return itemB;
	}
	public void setItemB(String itemB) {
		this.itemB = itemB;
	}
	public String getItemC() {
		return itemC;
	}
	public void setItemC(String itemC) {
		this.itemC = itemC;
	}
	public String getItemD() {
		return itemD;
	}
	public void setItemD(String itemD) {
		this.itemD = itemD;
	}
	public List<String> getAnswer() {
		return answer;
	}
	public void setAnswer(List<String> answer) {
		this.answer = answer;
	}
	public String getAnalysis() {
		return analysis;
	}
	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}
	private String analysis;
    
}
