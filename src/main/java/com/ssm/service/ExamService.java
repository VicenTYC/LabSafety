package com.ssm.service;

import java.util.List;

import com.ssm.pojo.BankType;
import com.ssm.pojo.Exam;
import com.ssm.pojo.ExamQuestion;
import com.ssm.pojo.Question;

public interface ExamService {

	List<BankType> getQuestionBankTypeList();

	List<Question> getQuestionList(int banktype, int qtype);

	int getAmount(int banktype, int qtype);

	List<Question> getQuestionByType(int page, int qtype, int qbank);

	boolean deleteQuestionById(int qid);

	boolean addQuestion(Question question);

	int addExam(Exam exam);

	List<Exam> getExamList(int teacher_id);

	List<Question> getQuestionByBank(String[] strs, int questionType);

	int addExamQuestion(List<ExamQuestion> questions);

	int deleteExamById(int examId);

}
