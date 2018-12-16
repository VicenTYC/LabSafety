package com.ssm.service.impl;

import com.ssm.mapper.SystemMapper;
import com.ssm.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

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
}
