package com.ssm.pojo;

public class QuestionDao {
    private int quesBank ;
    private String itemA ;
    private String itemB ;
    private String itemC ;
    private String itemD ;
    private String question;
    private String answer ;
    private String analysis;
    private int ifPractice;

    public int getQuesBank() {
        return quesBank;
    }

    public void setQuesBank(int quesBank) {
        this.quesBank = quesBank;
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

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getAnalysis() {
        return analysis;
    }

    public void setAnalysis(String analysis) {
        this.analysis = analysis;
    }

    public int getIfPractice() {
        return ifPractice;
    }

    public void setIfPractice(int ifPractice) {
        this.ifPractice = ifPractice;
    }
}
