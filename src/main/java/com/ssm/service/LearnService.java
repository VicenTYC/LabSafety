package com.ssm.service;

import com.ssm.pojo.LearningFile;
import com.ssm.pojo.Regulation;
import com.ssm.pojo.SystemNotice;

public interface LearnService {

	String getRegContentById(int regulationId);

	SystemNotice getSysNoticeById(int noticeId);

	int getNoticeAmount();

	Regulation getRegulationById(int regulationId);

	int getRegulationAmount();

	LearningFile getFileById(int fileId);

}
