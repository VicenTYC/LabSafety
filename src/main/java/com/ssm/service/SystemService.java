package com.ssm.service;

import java.util.Date;

/**
 * @author: create by TianYc
 * @version: v1.0
 * @description: com.ssm.service
 * @date:2018/12/13
 **/
public interface SystemService {
    int addSystemNotice(String title, String content, Date date);

    int addQuestionBank(String bankName);

    int addFileBank(String bankName);

    int addFileRule(String name, String realName, Date date, String path);
}
