package com.ssm.service;

import com.ssm.pojo.*;

import java.util.Date;
import java.util.List;


public interface IndexService {
	List<FileRule> getFileRule(int currentPage);

	List<Regulation> getRegulation(int currentPage, int pageSize);

	List<SystemNotice> getSystemNotice(int currentPage, int pageSize);

	List<FileType> getFileTypeList();

	List<BankType> getQuestionBankTypeList();

	List<LearningFile> getLearningFileByType(int fileType, int pageNum);

	int getFileAmount(int fileType);

	int getFileRuleAmount();

	List<Exam> findExam( String student_college, String student_major);

	Exam findExamById(int examId);

	List<Question> getQuestionOfPaper(int examId, int quesType);

	int addStudentScore(int examId, String student_id, int right, String wrongQuestion, String string, String string2, String student_name, Date exam_begin_time);

    List<Question> getPracticeQuestions(int bankId, int page, int limit);

    int getPracticeQuestionsAmount(int bankId);
}
