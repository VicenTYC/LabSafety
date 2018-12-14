package com.ssm.mapper;

import com.ssm.pojo.BankType;
import com.ssm.pojo.FileType;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

/**
 * @author: create by TianYc
 * @version: v1.0
 * @description: com.ssm.mapper
 * @date:2018/12/13
 **/
public interface SystemMapper {

    int addSystemNotice(String title, String content, Date date);

    int addQuestionBank(String bankName);

    int addFileBank(String bankName);

    BankType findQBank(String bankName);

    FileType findFBank(String bankName);

    int addFileRule( String name, String realName,Date date, String path);
}
