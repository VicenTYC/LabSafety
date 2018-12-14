package com.ssm.controller;

import com.ssm.pojo.BankType;
import com.ssm.service.ExamService;
import com.ssm.service.SystemService;
import com.ssm.util.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: create by TianYc
 * @version: v1.0
 * @description: com.ssm.controller
 * @date:2018/12/13
 **/

@Controller
@RequestMapping("/system")
public class SystemController {
    @Autowired
    private SystemService systemService;
    @Autowired
    private ExamService examService;
    private ModelAndView LOGIN = new ModelAndView("redirect:/login.do");
    private ModelAndView SYSINDEX = new ModelAndView("/system/syshome");

    @RequestMapping("sysIndex.do")
    private ModelAndView getSystemIndex(HttpServletRequest request, @RequestParam(defaultValue = "") String op) {
        if (request.getSession().getAttribute("system") == null)
            return LOGIN;
        /*if (op.equals("questionbank")) {
            List<BankType> questionBankTypeList = examService.getQuestionBankTypeList();
           SYSINDEX.addObject("bankList",questionBankTypeList);
        }*/
        SYSINDEX.addObject("op",op);
        return SYSINDEX;
    }

    @ResponseBody
    @RequestMapping("addSystemNotice.do")
    private int addSystemNotice(String title, String content) {
        int status = systemService.addSystemNotice(title, content, new Date());
        int res = 200;
        if (status != 1)
            res = 500;
        return res;
    }
    @ResponseBody
    @RequestMapping("addQuesBank.do")
    private int addQuestionBank(String bankName){
        int status = systemService.addQuestionBank(bankName);
        return status;
    }
    @ResponseBody
    @RequestMapping("addFileBank.do")
    private int addFileBank(String bankName){
        int status = systemService.addFileBank(bankName);
        return status;
    }
    @ResponseBody
    @RequestMapping("uploadFileRule.do")
    private Map<String,Object> uploadFileRule(MultipartFile file,HttpServletRequest request){
        Map<String,Object > res = new HashMap<String, Object>();
        try{
            String path = request.getSession().getServletContext().getRealPath("file");
            String realName = file.getOriginalFilename();//获得上传文件的真实名称
            String suffixName = realName.substring(realName.lastIndexOf("."));// 获取后缀名
            String hash = ""+System.currentTimeMillis(); //自定义数字加字母作为文件名
            String fileName = hash+suffixName;
            if(systemService.addFileRule(fileName,realName,new Date(),path)==1) {
                UploadUtil.uploadFile(file,path,fileName);
                res.put("code", 0);
                res.put("name", realName);
            }
            else{
                res.put("code", 0);
                res.put("name", realName);
            }
        } catch (IOException e) {
            res.put("code",1);
            e.printStackTrace();
        }
        return res;
    }

}
