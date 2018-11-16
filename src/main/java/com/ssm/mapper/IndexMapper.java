package com.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
   
}
