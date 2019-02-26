package com.ssm.service;

import com.ssm.pojo.FileRule;
import com.ssm.pojo.LearningFile;
import com.ssm.pojo.Regulation;
import com.ssm.pojo.SystemNotice;

import java.util.Date;
import java.util.List;

/**
 * @author: create by TianYc
 * @version: v1.0
 * @description: com.ssm.service
 * @date:2018/12/13
 **/
public interface SystemService {
    /*int addSystemNotice(String title, String content, Date date);*/

    int addSystemRegulation(String title, String content, Date date);

    int addQuestionBank(String bankName);

    int addFileBank(String bankName);

    int addFileRule(String name, String realName, Date date, String path);

    int addLearnFile(String content, String fileType, String title, Date date);

    int addNotice(String title, String content, Date date);

    List<SystemNotice> getNotice();

    int deleteNotice(int noticeId);

    List<FileRule> getFileRule();

    List<LearningFile> getLearningFile(int page, int clumn);

    int getLearingFileCount();

    int  deleteFileRule(int fileId);

    int  deleteLearningFile(int fileId);

    List<Regulation> getRegulation();

    int deleteRegulation(int id);
}
