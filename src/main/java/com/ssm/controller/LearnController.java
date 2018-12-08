package com.ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.ssm.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.service.IndexService;
import com.ssm.service.LearnService;

import javax.ws.rs.DefaultValue;

@Controller
@RequestMapping("/learn")
public class LearnController {
	@Autowired
	private LearnService learnService;
	@Autowired
	private IndexService indexService;

	@RequestMapping("regContent.do")
	private ModelAndView getRegContentById(int regulationId) {
		ModelAndView mav = new ModelAndView("content");

		String content = learnService.getRegContentById(regulationId);

		mav.addObject("content", content);
		return mav;
	}

	@RequestMapping("getNotice.do")
	@ResponseBody
	private SystemNotice getNoticeContentById(int noticeId) {
		Map<String, SystemNotice> resultMap = new HashMap<String, SystemNotice>();
		SystemNotice notice = learnService.getSysNoticeById(noticeId);
		return notice;
	}

	@RequestMapping("getRegulation.do")
	@ResponseBody
	private Regulation getRugulationById(int fileId) {
		Map<String, Regulation> resultMap = new HashMap<String, Regulation>();
		Regulation regulation = learnService.getRegulationById(fileId);
		return regulation;
	}

	@RequestMapping("getNewRegulation.do")
	@ResponseBody
	private List<Regulation> getNewRegulation(int pageNum) {
		int startClu = (pageNum - 1) * 10;
		List<Regulation> regulationList = indexService.getRegulation(startClu, 10);
		return regulationList;
	}

	@RequestMapping("getFileById.do")
	@ResponseBody
	private LearningFile getFileById(int fileId) {
		LearningFile Lfile = learnService.getFileById(fileId);
		return Lfile;
	}

	@RequestMapping("getFileList.do")
	@ResponseBody
	private Map<String, Object> getFileListByType(@RequestParam(defaultValue = "1")int fileType, @RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "0")int amount) {
		List<LearningFile> fileList = indexService.getLearningFileByType(fileType, page);
		//如果是第一页则查询所有文件的条数
		if(amount == 0) {
			amount = indexService.getFileAmount(fileType);
		}
		for (LearningFile iter : fileList) {
			String str = iter.getFile_content().replaceAll("<span.*?>", "");
			str = str.replaceAll("</span", "");
			str = str.replaceAll("<p.*?>", "");
			str = str.replaceAll("</p>", "").replaceAll("<br/>", "");
			str = str.replaceAll("&nbsp;", "").replaceAll(" ", "").replaceAll("<strong.*?>", "").replaceAll("</strong>", "");
			if (str.length() > 200) {
				str = str.substring(0, 201);

				iter.setFile_content(str);
			} else {

				iter.setFile_content(str);
			}
		}
       Map<String, Object> res = new HashMap<String, Object>();
       if(fileList!=null) {
       res.put("fileList", fileList);
       res.put("amount", amount);
       res.put("stat", "200");
       }
       else {
    	   res.put("stat", "500");
       }
	return res;
	}
	@RequestMapping("getPrectice.do")
	@ResponseBody
	private Map<String,Object>getPracticeQuestion(int bankId,int page,int limit,@RequestParam(defaultValue = "0") int quesAmount){
		Map<String,Object> result = new HashMap<String, Object>();
		List<Question> practiceList = indexService.getPracticeQuestions(bankId,page,limit);
		if(quesAmount==0)
			 quesAmount  = indexService.getPracticeQuestionsAmount(bankId);
		if(practiceList!=null) {
			result.put("status", 200);
			result.put("quesAmount", quesAmount);
			result.put("quesList", practiceList);
		}
		else{
			result.put("status", 500);
			result.put("errMsg","出错了，正在修");
		}
		return result;
	}

}
