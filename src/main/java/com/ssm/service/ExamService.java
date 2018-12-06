package com.ssm.service;

import com.ssm.pojo.*;

import java.util.List;

public interface ExamService {

	List<BankType> getQuestionBankTypeList();

	List<Question> getQuestionList(int banktype, int qtype);

	int getAmount(int banktype, int qtype);

	List<Question> getQuestionByType(int page, int qtype, int qbank);

	boolean deleteQuestionById(int qid);

	boolean addQuestion(Question question,int ifPractice);

	int addExam(Exam exam);

	List<Exam> getExamList(int teacher_id);

	List<Question> getQuestionByBank(String[] strs, int questionType);

	int addExamQuestion(List<ExamQuestion> questions);

	int deleteExamById(int examId);

	List<StudentScore> getScoreList(int page, int limit, int examId);

	int getScoreTotal(int examId);

}
