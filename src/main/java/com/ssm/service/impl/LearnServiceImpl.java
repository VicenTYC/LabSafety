package com.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.mapper.LearnMapper;
import com.ssm.pojo.LearningFile;
import com.ssm.pojo.Regulation;
import com.ssm.pojo.SystemNotice;
import com.ssm.service.LearnService;

@Service(value = "LearnService")
public class LearnServiceImpl implements LearnService{

	@Autowired
	private LearnMapper learnMapper;
	
	public String getRegContentById(int regulationId) {
	  return learnMapper.getRegContentById(regulationId);
	}

	public SystemNotice getSysNoticeById(int noticeId) {
		return learnMapper.getSysNoticeById(noticeId);
	}

	public int getNoticeAmount() {
		return learnMapper.getNoticeAmount();
	}

	public Regulation getRegulationById(int regulationId) {
		return learnMapper.getRegulationById(regulationId);
	}

	public int getRegulationAmount() {
		return learnMapper.getRegulationAmount();
	}

	public LearningFile getFileById(int fileId) {
		
		return learnMapper.getFileById(fileId);
	}


}
