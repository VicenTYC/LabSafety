package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.mapper.IndexMapper;
import com.ssm.pojo.*;
import com.ssm.service.IndexService;

@Service(value = "indexService")
public class IndexServiceImpl implements IndexService {
    @Autowired
    private IndexMapper indexMapper;
    
	public List<FileRule> getFileRule(int page) {
		//分页，每页显示5条
	    int sta = (page-1)*15;
		return indexMapper.getFileRule(sta, 15);
	}

	public List<Regulation> getRegulation(int currentPage, int pageSize) {
		return indexMapper.getRegulation(currentPage,pageSize);
	}

	public List<SystemNotice> getSystemNotice(int currentPage, int pageSize) {
		return indexMapper.getSystemNotice(currentPage,pageSize);
	}

	public List<FileType> getFileTypeList() {
		return indexMapper.getFileTypeList();
	}

	public List<String> getQuestionBankTypeList() {		
		return indexMapper.getQuestionBankTypeList();
	}

	public List<LearningFile> getLearningFileByType(int fileType,int pageNum) {
		//分页，每页显示5条
	    int sta = (pageNum-1)*5;
		return indexMapper.getLearningFileByType(fileType,sta);
	}

	public int getFileAmount(int fileType) {
		
		return indexMapper.getFileAmount(fileType);
	}

	public int getFileRuleAmount() {
		return indexMapper.getFileRuleAmount();
	}

	public Exam findExam(String date, String student_college, String student_major) {
		return indexMapper.findExam(date,student_college,student_major);
	}

	public Exam findExamById(int examId) {
		return indexMapper.findExamById(examId);
	}


}
