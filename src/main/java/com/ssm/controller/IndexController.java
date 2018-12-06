package com.ssm.controller;

import com.ssm.pojo.*;
import com.ssm.service.IndexService;
import com.ssm.service.LearnService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("")
public class IndexController {

	@Autowired
	private IndexService indexService;
	@Autowired
	private LearnService learnService;
    
	Map<Integer,Map<String,String> > serverExam = new HashMap();
	Map<String,String> studentAnswer ;
    Map<Integer,Map<Integer,List<Question>>> examQuestionList = new HashMap();
    Map<Integer,List<Question>> examQuestion ;
	
	private ModelAndView ERROR_PAGE = new ModelAndView("error");
	private ModelAndView LOGIN = new ModelAndView("login");
	private ModelAndView INDEX = new ModelAndView("index");
	
	private boolean ifLogin(HttpServletRequest request) {
		//登陆检查
				if(request.getSession().getAttribute("student")==null)
					return true;
				else return false;	
	}
	@RequestMapping("getIndex.do")
	public ModelAndView getIndex(HttpServletRequest request, HttpServletResponse response) {
		
	   if(ifLogin(request))
			return LOGIN;
		
		ModelAndView mav = new ModelAndView("index");
		// 获取无内容规章制度名列表
		List<Regulation> regulationList = indexService.getRegulation(0, 5);
		// List<FileRule> fileRuleList = indexService.getFileRule(0,5);
		// 获取无内容系统公告
		List<SystemNotice> systemNoticeList = indexService.getSystemNotice(0, 5);
		List<FileType> fileTypeList = getFileTypeList();
		List<BankType> questionBankTypeList = getQuestionBankTypeList();
		Student student = (Student)request.getSession().getAttribute("student");
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");//设置日期格式
		String date =  df.format(new Date());
		Date now = new Date();
        List<Exam> examInfo =  indexService.findExam(student.getStudent_college(),student.getStudent_major());
	    Exam resExam = null;
        for(Exam iter : examInfo){
        	if(iter.getExam_begin_time().after(now)){
        		resExam = iter;
        		break;
			}
			else if(iter.getExam_finish_time().after(now)){
        		resExam = iter;
        		break;
			}
		}
        mav.addObject("examInfo",resExam);
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
	@RequestMapping("startExam.do")
    private ModelAndView  ifTimeStartExam(@RequestParam(defaultValue = "0")int examId,@RequestParam(defaultValue = "-1")int pwd) {
		ModelAndView indexMav = new ModelAndView("forward:/getIndex.do");
		ModelAndView noteMav =new ModelAndView("forward:/getExamNote.do");
		if(examId==0)
			return indexMav;
    	Date now = new Date();
    	Exam exam = indexService.findExamById(examId);
    	if(pwd==-1||exam.getExampwd()!=pwd) {
 			indexMav.addObject("errMsg","密码错误，重新输入");
 			return indexMav;
		}
    	if(now.before(exam.getExam_begin_time()))
    		indexMav.addObject("errMsg", "考试还未开始");
    	else if(now.after(exam.getExam_finish_time()))
            indexMav.addObject("errMsg","考试已经结束");
    	else {
    		return noteMav;
    	}    		
    	return indexMav;
    }
    
	@RequestMapping("getExamNote.do")
	private ModelAndView getExamNote(HttpServletRequest request,@RequestParam(defaultValue = "0")int examId) {
		//登陆检查
		if(ifLogin(request))
				return LOGIN;
		if(examId==0)
			return INDEX;
		
		ModelAndView noteMav = new ModelAndView("/exam/examNote");
		noteMav.addObject("examId",examId);
		return noteMav;
	}
	@RequestMapping("getTestPaper.do")
	private ModelAndView getTestPaper(HttpServletRequest request,@RequestParam(defaultValue = "0")int examId) {
		//登陆检查
		if(ifLogin(request))
			return LOGIN;
		if(examId==0)
			return INDEX;
		
		ModelAndView paperMav= new ModelAndView("/exam/exam");
		//检查是否是中断考试需要恢复
		Student student = (Student)request.getSession().getAttribute("student");
		if(serverExam.containsKey(examId)&&serverExam.get(examId).containsKey(student.getStudent_id())) {
			String answer = serverExam.get(examId).get(student.getStudent_id());
			System.out.println(answer);
			paperMav.addObject("answer",answer);			
		}
		//检查是否是第一次抽题
		int singleQue=1,mulitQue=2,torfQue=3;
		List<Question> mulitList,torfList,singleList;
		Map<Integer,List<Question>> examQuestion =new HashMap<Integer,List<Question>>();
		if(examQuestionList.containsKey(examId)) {
			 singleList =  examQuestionList.get(examId).get(1);
			 mulitList = examQuestionList.get(examId).get(2);
			 torfList = examQuestionList.get(examId).get(3);
		}
		else {
		 singleList = indexService.getQuestionOfPaper(examId,singleQue);
		 mulitList = indexService.getQuestionOfPaper(examId,mulitQue);
		 torfList = indexService.getQuestionOfPaper(examId,torfQue);
		 examQuestion.put(1, singleList);
		 examQuestion.put(2, mulitList);
		 examQuestion.put(3, torfList);
		 examQuestionList.put(examId, examQuestion);
		}
		Exam nowExam  = indexService.findExamById(examId);
		
		Calendar stime = Calendar.getInstance(),etime = Calendar.getInstance();
		stime.setTime(new Date());
		etime.setTime(nowExam.getExam_finish_time());	
		
		int year = stime.get(Calendar.YEAR);
		int month = stime.get(Calendar.MONTH)+1;
		int sday = stime.get(Calendar.DAY_OF_MONTH);
		int eday = etime.get(Calendar.DAY_OF_MONTH);
		int shour = stime.get(Calendar.HOUR_OF_DAY);
		int ehour = etime.get(Calendar.HOUR_OF_DAY);
		int sminute = stime.get(Calendar.MINUTE);
		int eminute = etime.get(Calendar.MINUTE);
		int ssecond = stime.get(Calendar.SECOND);
		int esecond = etime.get(Calendar.SECOND);
		
		paperMav.addObject("year",year);
		paperMav.addObject("month",month);
		paperMav.addObject("sday",sday);
		paperMav.addObject("eday",eday);
		paperMav.addObject("shour",shour);
		paperMav.addObject("ehour",ehour);
		paperMav.addObject("sminute",sminute);
		paperMav.addObject("eminute",eminute);
		paperMav.addObject("ssecond",ssecond);
		paperMav.addObject("esecond",esecond);
		paperMav.addObject("singleList",singleList);
		paperMav.addObject("mulitList",mulitList);
		paperMav.addObject("torfList",torfList);
		paperMav.addObject("nowExam",nowExam);
		return paperMav;
	}
	//缓存答题过程中间答案
	@RequestMapping("answerCache.do")
	@ResponseBody
	private int saveMidAnswer(String answer,int examId,HttpServletRequest request) {
		int status = 0;
		Student student = (Student)request.getSession().getAttribute("student");
		String studentId = student.getStudent_id();
		if(!serverExam.containsKey(examId))
		{
			studentAnswer = new HashMap<String, String>();
			studentAnswer.put(studentId, answer);
			serverExam.put(examId, studentAnswer);
		}
		else
			serverExam.get(examId).put(studentId, answer);
		return status;	
	}
	@RequestMapping("submitPaper.do")
	@ResponseBody
	private int submitPaper(HttpServletRequest request,int examId) {
		//从前端获取json对象answer
		String answers  = request.getParameter("answer");
		JSONObject jsonObj = new JSONObject(answers);
		Map<String,Object> map = jsonObj.toMap();
		
/*		answers = answers.replace("{","").replace("}", "");
		String answerList[] = answers.split(",");*/
		
		int singleQue=1,mulitQue=2,torfQue=3, status=0;
		int right=0;
		Student student = (Student)request.getSession().getAttribute("student");
		
		//String[] answerList = answer.split("&");
		List<Question> mulitList,torfList,singleList;
		singleList =  examQuestionList.get(examId).get(1);
		mulitList = examQuestionList.get(examId).get(2);
		torfList = examQuestionList.get(examId).get(3);	
		int count = singleList.size()+mulitList.size()+torfList.size();
		Exam nowExam  = indexService.findExamById(examId);
		
		int i=0,j=0,m=0;
		String wrongQuestion="";
		//获取每题的分数
		int singleScore = nowExam.getSingle_score();
		int mulitScore = nowExam.getMulit_score();
		int torfScore = nowExam.getTorf_score();	
		//自动判题
		Iterator iter = map.entrySet().iterator();
		while(iter.hasNext()) {			
			Map.Entry entry = (Map.Entry) iter.next();
			String key = (String)entry.getKey();
			Object val = entry.getValue();
			
			if(key.startsWith("single")) {
				String value = (String)val;
				if(value!=""&&value.equals(singleList.get(i).getQuestion_answer())) {
					right+=singleScore;					
				}
				else{
					wrongQuestion+=" "+singleList.get(i).getQuestion_id();					
				}
				i++;
			}
			if(key.startsWith("mulit")) {
				String str;
				if(!val.equals("")) {
					ArrayList<String> value = (ArrayList<String>)val;
						str = value.toString().replace(",", "").replace("[", "").replace("]", "").replace("  ", " ").trim();
						
				}
				else
				   str = (String) val;
				
				if(str!=""&&str.equals(mulitList.get(j).getQuestion_answer())) {
					right+=mulitScore;					
				}
				else{
					wrongQuestion+=" "+mulitList.get(j).getQuestion_id();
					
				}
				j++;
			}
			if(key.startsWith("torf")) {
				String value = (String)val;
				if(value!=""&&value.equals(torfList.get(m).getQuestion_answer())) {
					right+=torfScore;
					
				}
				else{
					wrongQuestion+=" "+torfList.get(m).getQuestion_id();
				}
				m++;
			}
		}	
		int res = indexService.addStudentScore(examId,student.getStudent_id(),right,wrongQuestion,student.getStudent_college(),student.getStudent_major(),student.getStudent_name(),nowExam.getExam_begin_time());
		if(res ==1) {
			//提交成功则删除缓存的提交答案
			//开考五分钟之内交卷，则无缓存答案
			if(serverExam.containsKey(examId)) {
				serverExam.get(examId).remove(student.getStudent_id());
				if(serverExam.get(examId).isEmpty())
					serverExam.remove(examId);
			}
			if(nowExam.getExam_finish_time().before(new Date())) {
				examQuestionList.get(examId).remove(1);
				examQuestionList.get(examId).remove(2);
				examQuestionList.get(examId).remove(3);
				examQuestionList.remove(examId);	
			}		     
		}
		else {
			status=1;
		}
		return status;
	}

	@RequestMapping("getPractice.do")
	@ResponseBody
	private ModelAndView getPractice(int bankId,int page,int limit,@RequestParam(defaultValue  = "0") int ifShowAns){
		ModelAndView practice = new ModelAndView("practice");
		List<Question> practiceList = indexService.getPracticeQuestions(bankId,page,limit);
        practice.addObject("quesList",practiceList);
        practice.addObject("ifShowAns",ifShowAns);
		return practice;
	}
	// 获取在线学习的文章类型列表
	public List<FileType> getFileTypeList() {
		return indexService.getFileTypeList();
	}

	// 获取试题库类型列表
	public List<BankType> getQuestionBankTypeList() {
		return indexService.getQuestionBankTypeList();
	}
}
