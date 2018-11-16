package com.ssm.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.Inet4Address;
import java.net.URLEncoder;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.ssm.pojo.FileRule;
import com.ssm.pojo.FileType;
import com.ssm.pojo.LearningFile;
import com.ssm.pojo.Regulation;
import com.ssm.pojo.Student;
import com.ssm.pojo.SystemNotice;
import com.ssm.service.IndexService;
import com.ssm.service.LearnService;

@Controller
@RequestMapping("")
public class IndexController {

	@Autowired
	private IndexService indexService;
	@Autowired
	private LearnService learnService;

	private ModelAndView ERROR_PAGE = new ModelAndView("error");

	
	@RequestMapping("getIndex.do")
	public ModelAndView getIndex(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * //登陆检查 if(request.getSession().getAttribute("student")==null) { ModelAndView
		 * mav = new ModelAndView("login"); return mav; }
		 */
		ModelAndView mav = new ModelAndView("index");
		// 获取无内容规章制度名列表
		List<Regulation> regulationList = indexService.getRegulation(0, 5);
		// List<FileRule> fileRuleList = indexService.getFileRule(0,5);
		// 获取无内容系统公告
		List<SystemNotice> systemNoticeList = indexService.getSystemNotice(0, 5);

		List<FileType> fileTypeList = getFileTypeList();
		List<String> questionBankTypeList = getQuestionBankTypeList();
		// Student student = (Student)request.getSession().getAttribute("student");

		mav.addObject("fileTypeList", fileTypeList);
		mav.addObject("questionBankTypeList", questionBankTypeList);
		mav.addObject("regulationList", regulationList);
		// mav.addObject("fileRuleList",fileRuleList);
		mav.addObject("systemNoticeList", systemNoticeList);

		return mav;
	}

	@RequestMapping("getMoreRegulation.do")
	public ModelAndView getMoreRegulation(@RequestParam(defaultValue = "1") int regulationId) {
		ModelAndView mav = new ModelAndView("regulation");
		List<Regulation> regulationList = indexService.getRegulation(0, 10);
		Regulation regulation = learnService.getRegulationById(regulationId);
		int regAmount = learnService.getRegulationAmount();
		mav.addObject("regulationList", regulationList);
		int pageAmount = regAmount / 10 + 1;
		mav.addObject("regulationList", regulationList);
		mav.addObject("pageAmount", pageAmount);
		mav.addObject("regulation", regulation);
		mav.addObject("curPage", 1);
		return mav;
	}
	@RequestMapping("getMoreSystemNotice.do")
	public ModelAndView getSystemNoticeContent(@RequestParam(defaultValue = "1") int noticeId) {

		ModelAndView mav = new ModelAndView("sysnotice");
		// 获取无内容系统公告
		List<SystemNotice> systemNoticeList = indexService.getSystemNotice(0, 10);
		SystemNotice notice = learnService.getSysNoticeById(noticeId);
		int noticeAmount = learnService.getNoticeAmount();
		int pageAmount = noticeAmount / 10 + 1;

		mav.addObject("pageAmount", pageAmount);
		mav.addObject("curPage", 1);
		mav.addObject("notice", notice);
		mav.addObject("systemNoticeList", systemNoticeList);
		return mav;
	}

	@RequestMapping("getFileResource.do")
	private ModelAndView getFileResource(@RequestParam(defaultValue = "1")int fileType, @RequestParam(defaultValue = "1") int page) {
		ModelAndView mav = new ModelAndView("fileresource");		
		List<LearningFile> learningFiles = indexService.getLearningFileByType(fileType,1);
		List<FileType> fileTypeList = getFileTypeList();
		
		for (LearningFile iter : learningFiles) {			
			String str = iter.getFile_content().replaceAll("<span.*?>", "");
			str = str.replaceAll("</sapn", "");
			str = str.replaceAll("<p.*?>", "");
			str = str.replaceAll("</p>", "").replaceAll("</br>", "");
			str = str.replaceAll("&nbsp;", "").replaceAll(" ", "").replaceAll("<strong.*?>", "").replaceAll("</strong>", "");			
			if (str.length() > 200) {
				str = str.substring(0, 201);

				iter.setFile_content(str);
			} else {
				
				iter.setFile_content(str);
			}
		}
		int fileAmount = indexService.getFileAmount(fileType);
		mav.addObject("amount", fileAmount);
		mav.addObject("fileTypeList", fileTypeList);
		mav.addObject("fileList", learningFiles);
		return mav;
	}
	
	//获取文件制度列表
    @RequestMapping("fileRules.do")
    private ModelAndView getFileRules(@RequestParam(defaultValue = "1")int page) {
    	ModelAndView mav = new ModelAndView("filerules");    	
     	List<FileRule> fileRulesList = indexService.getFileRule(page);     	
     	int curAmount = indexService.getFileRuleAmount();     	
     	mav.addObject("fileRulesList",fileRulesList);
     	mav.addObject("amount", curAmount);
     	return mav;
    }
    @RequestMapping("moreFileRules.do")
    @ResponseBody
    private List<FileRule> getMoreFileRules(@RequestParam(defaultValue = "1")int page) {
    	
    	return indexService.getFileRule(page); 
    }
    
	// 文件规则下载
	@RequestMapping("down.do")
	public void down(HttpServletRequest request, HttpServletResponse response, String rootPath, String fileName)
			throws Exception {
		// 模拟文件，myfile.txt为需要下载的文件
		String filePath = request.getSession().getServletContext().getRealPath(rootPath) + "/" + fileName;
		// 获取输入流
		InputStream bis = new BufferedInputStream(new FileInputStream(new File(filePath)));
		// 假如以中文名下载的话,转码，免得文件名中文乱码
		fileName = URLEncoder.encode(fileName, "UTF-8");
		// 设置文件下载头
		response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
		// 设置文件ContentType类型，这样设置，会自动判断下载文件类型
		response.setContentType("multipart/form-data");
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		int len = 0;
		while ((len = bis.read()) != -1) {
			out.write(len);
			out.flush();
		}
		out.close();
	}

	// 获取在线学习的文章类型列表
	public List<FileType> getFileTypeList() {
		return indexService.getFileTypeList();
	}

	// 获取试题库类型列表
	public List<String> getQuestionBankTypeList() {
		return indexService.getQuestionBankTypeList();
	}
}
