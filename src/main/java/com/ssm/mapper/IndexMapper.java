package com.ssm.mapper;

import java.util.List;

import javax.faces.flow.builder.FlowBuilderParameter;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.Exam;
import com.ssm.pojo.FileRule;
import com.ssm.pojo.FileType;
import com.ssm.pojo.LearningFile;
import com.ssm.pojo.Regulation;
import com.ssm.pojo.SystemNotice;

public interface IndexMapper {

	List<FileRule> getFileRule(@Param("start")int start, @Param("pageSize")int pageSize);

	List<Regulation> getRegulation(@Param("currentPage")int currentPage, @Param("pageSize")int pageSize);
	
	//获取无内容系统公告
	List<SystemNotice> getSystemNotice(@Param("currentPage")int currentPage, @Param("pageSize")int pageSize);

	List<FileType> getFileTypeList();

	List<String> getQuestionBankTypeList();

	List<LearningFile> getLearningFileByType(@Param("fileType")int fileType,@Param("start") int sta);

	int getFileAmount(@Param("fileType")int fileType);

	int getFileRuleAmount();

	Exam findExam(@Param("date")String date, @Param("college")String student_college, @Param("major")String student_major);

	Exam findExamById(@Param("exam")int examId);
   
}
