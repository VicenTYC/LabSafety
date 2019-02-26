package com.ssm.controller;

import com.ssm.pojo.*;
import com.ssm.service.IndexService;
import com.ssm.service.SystemService;
import com.ssm.util.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
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
    private IndexService indexService;
    private ModelAndView LOGIN = new ModelAndView("redirect:/login.do");
    private ModelAndView SYSINDEX = new ModelAndView("/system/syshome");

    @RequestMapping("sysIndex.do")
    private ModelAndView getSystemIndex(HttpServletRequest request, @RequestParam(defaultValue = "") String op) {
        if (request.getSession().getAttribute("system") == null)
            return LOGIN;
        if (op.equals("studyonline")) {
            List<FileType> fileTypeList = indexService.getFileTypeList();
            SYSINDEX.addObject("fileList", fileTypeList);
        }
        if (op.equals("sysnotice")) {
            List<SystemNotice> noticeList = systemService.getNotice();
            SYSINDEX.addObject("noticeList", noticeList);
        }
        if (op.equals("uploadfile")) {
            List<FileRule> fileRuleList = systemService.getFileRule();
            SYSINDEX.addObject("fileRuleList", fileRuleList);
        }
        if(op.equals("studyonline")){
            List<LearningFile> learningFiles = systemService.getLearningFile(1,25);
            int totalCount = systemService.getLearingFileCount();
            SYSINDEX.addObject("learningFiles",learningFiles);
            SYSINDEX.addObject("totalCount",totalCount);
        }
        if(op.equals("regulation")){
            List<Regulation> regulationList = systemService.getRegulation();
            SYSINDEX.addObject("regulations",regulationList);
        }
        SYSINDEX.addObject("op", op);
        return SYSINDEX;
    }

    @ResponseBody
    @RequestMapping("getLearningFile.do")
    private List<LearningFile> getLearningFile(int page,int clumnNum){
        List<LearningFile> res = systemService.getLearningFile(page,clumnNum);
        return res;
    }
    @RequestMapping("deleteSystemNotice.do")
    private ModelAndView deleteNotice(int noticeId) {
        systemService.deleteNotice(noticeId);
        return SYSINDEX;
    }

    @RequestMapping("deleteFileRule.do")
    private ModelAndView deleteFileRule(int fileId) {
        systemService.deleteFileRule(fileId);
        return SYSINDEX;
    }
    @RequestMapping("deleteLearningFile.do")
    private ModelAndView deleteLearningFile(int fileId){
        systemService.deleteLearningFile(fileId);
        return SYSINDEX;
    }
    @RequestMapping("deleteRegulation.do")
    private ModelAndView deleteRegulation(int id){
        systemService.deleteRegulation(id);
        return SYSINDEX;
    }

    @ResponseBody
    @RequestMapping("addSystemNotice.do")
    private int addSystemNotice(String title, String content) {
        int status = systemService.addNotice(title, content, new Date());
        int res = 200;
        if (status != 1)
            res = 500;
        return res;
    }

    @ResponseBody
    @RequestMapping("addRegulation.do")
    private int addSystemRegulation(String title, String content) {
        int status = systemService.addSystemRegulation(title, content, new Date());
        int res = 200;
        if (status != 1)
            res = 500;
        return res;
    }

    @ResponseBody
    @RequestMapping("addLearnFile.do")
    private Map<String, Object> addLearnFile(String content, String fileType, String title) {
        Map<String, Object> res = new HashMap<String, Object>();
        int status = systemService.addLearnFile(content, fileType, title, new Date());
        if (status == 1) {
            res.put("code", 0);
            res.put("msg", "添加成功");
        } else {
            res.put("code", -1);
            res.put("msg", "添加失败");
        }
        return res;
    }

    @ResponseBody
    @RequestMapping("addQuesBank.do")
    private int addQuestionBank(String bankName) {
        int status = systemService.addQuestionBank(bankName);
        return status;
    }

    @ResponseBody
    @RequestMapping("addFileBank.do")
    private int addFileBank(String bankName) {
        int status = systemService.addFileBank(bankName);
        return status;
    }

    @ResponseBody
    @RequestMapping("uploadFile.do")
    private Map<String, Object> uploadFileRule(MultipartFile file, HttpServletRequest request
            , @RequestParam(defaultValue = "file") String midPath) {
        Map<String, Object> res = new HashMap<String, Object>();
        try {
            String path = request.getSession().getServletContext().getRealPath(midPath);
            String realName = file.getOriginalFilename();//获得上传文件的真实名称
            String suffixName = realName.substring(realName.lastIndexOf("."));// 获取后缀名
            String hash = "" + System.currentTimeMillis(); //自定义数字加字母作为文件名
            String fileName = hash + suffixName;
            if (systemService.addFileRule(fileName, realName, new Date(), path) == 1) {
                UploadUtil.uploadFile(file, path, fileName);
                res.put("code", 0);
                res.put("name", realName);
                res.put("filepath", midPath + "/" + fileName);
            } else {
                res.put("code", 0);
                res.put("name", realName);
            }
        } catch (IOException e) {
            res.put("code", 1);
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping("deleteFile.do")
    private int deleteFile(HttpServletRequest request, String imgpath) {
        String imageName = imgpath.replace("http://localhost:8080/labsafety/images/", "");
        String path = request.getSession().getServletContext().getRealPath("images");
        File file = new File(path + "/" + imageName);
        file.delete();
        return 200;
    }

}
