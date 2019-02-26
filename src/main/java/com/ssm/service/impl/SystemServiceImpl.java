package com.ssm.service.impl;

import com.ssm.mapper.SystemMapper;
import com.ssm.pojo.FileRule;
import com.ssm.pojo.LearningFile;
import com.ssm.pojo.Regulation;
import com.ssm.pojo.SystemNotice;
import com.ssm.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author: create by TianYc
 * @version: v1.0
 * @description: com.ssm.service.impl
 * @date:2018/12/13
 **/
@Service(value = "SystemService")
public class SystemServiceImpl implements SystemService {
    @Autowired
    SystemMapper systemMapper;

   /* public int addSystemNotice(String title, String content, Date date) {
        return systemMapper.addSystemNotice(title,content,date);
    }*/

    public int addSystemRegulation(String title, String content, Date date) {
        return  systemMapper.addSystemRegulation(title,content,date);
    }

    public int addQuestionBank(String bankName) {
        if(systemMapper.findQBank(bankName)!=null)
            return 2;
        return systemMapper.addQuestionBank(bankName);
    }

    public int addFileBank(String bankName) {
        if(systemMapper.findFBank(bankName)!=null)
            return 2;
        return systemMapper.addFileBank(bankName);
    }

    public int addFileRule(String name, String realName, Date date, String path) {
        return systemMapper.addFileRule(name,realName,date,path);
    }

    public int addLearnFile(String content, String fileType, String title, Date date) {
        return systemMapper.addLearnFile(content,fileType,title,date);
    }

    public int addNotice(String title, String content, Date date) {
        return systemMapper.addNotice(title,content,date);
    }

    public List<SystemNotice> getNotice() {
        return systemMapper.getNotice();
    }
    public int deleteNotice(int noticeId){
        return systemMapper.deleteNotice(noticeId);
    }

    public List<FileRule> getFileRule() {
        return systemMapper.getFileRule();
    }

    public List<LearningFile> getLearningFile(int page, int clumn) {
        int startClumn = (page-1)*clumn;
        return systemMapper.getLearningFile(startClumn,clumn);
    }

    public int getLearingFileCount() {
        return systemMapper.getLearingFileCount();
    }

    public  int deleteFileRule(int fileId){
        return systemMapper.deleteFileRule(fileId);
    }

    public int deleteLearningFile(int fileId) {
        return systemMapper.deleteLearningFile(fileId);
    }

    public List<Regulation> getRegulation() {
        return systemMapper.getRegulation();
    }

    public int deleteRegulation(int id) {
        return systemMapper.deleteRgulation(id);
    }
}
