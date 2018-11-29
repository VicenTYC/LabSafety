package com.ssm.service;

import java.util.List;

import com.ssm.pojo.*;


public interface IndexService {
	List<FileRule> getFileRule(int currentPage);

	List<Regulation> getRegulation(int currentPage, int pageSize);

	List<SystemNotice> getSystemNotice(int currentPage, int pageSize);

	List<FileType> getFileTypeList();

	List<String> getQuestionBankTypeList();

	List<LearningFile> getLearningFileByType(int fileType, int pageNum);

	int getFileAmount(int fileType);

	int getFileRuleAmount();

	Exam findExam(String date, String student_college, String student_major);

	Exam findExamById(int examId);

}
