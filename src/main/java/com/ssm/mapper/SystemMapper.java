package com.ssm.mapper;

import com.ssm.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @author: create by TianYc
 * @version: v1.0
 * @description: com.ssm.mapper
 * @date:2018/12/13
 **/
public interface SystemMapper {
    int addQuestionBank(String bankName);

    int addFileBank(String bankName);

    BankType findQBank(String bankName);

    FileType findFBank(String bankName);

    int addFileRule(String name, String realName, Date date, String path);

    int addLearnFile(String content, String fileType, String title, Date date);

    int addSystemRegulation(String title, String content, Date date);

    int addNotice(String title, String content, Date date);

    List<SystemNotice> getNotice();

    int deleteNotice(int noticeId);

    List<FileRule> getFileRule();

    int deleteFileRule(int fileId);

    List<LearningFile> getLearningFile(@Param("start")int startClumn, @Param("num")int clumn);

    int getLearingFileCount();

    int deleteLearningFile(int fileId);

    List<Regulation> getRegulation();

    int deleteRgulation(int id);
}
