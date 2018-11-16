package com.ssm.mapper;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.LearningFile;
import com.ssm.pojo.Regulation;
import com.ssm.pojo.SystemNotice;

public interface LearnMapper {

	String getRegContentById(@Param("regulationId")int regulationId);

	SystemNotice getSysNoticeById(@Param("noticeId")int noticeId);

	int getNoticeAmount();

	Regulation getRegulationById(@Param("regulationId")int regulationId);

	int getRegulationAmount();

	LearningFile getFileById(@Param("fileId")int fileId);

}
