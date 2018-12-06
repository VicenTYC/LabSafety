package com.ssm.controller;

import com.ssm.pojo.*;
import com.ssm.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/exam")
public class ExamController {
	@Autowired
	private ExamService examService;
	@Autowired
	private Question question;

	@RequestMapping("bgIndex.do")
	private ModelAndView getBgIndex(HttpServletRequest request, @RequestParam(defaultValue = "questlist") String op,
			@RequestParam(defaultValue = "-1") int banktype) {
		ModelAndView mav = new ModelAndView("/teacher/teacher");
		// 登陆检查
		Object object = request.getSession().getAttribute("teacher");
		if (object == null) {
			ModelAndView login = new ModelAndView("redirect:/login.do");
			return login;
		} else {
			if (banktype != -1) {
				List<Question> question1List = examService.getQuestionList(banktype, 1);
				List<Question> question2List = examService.getQuestionList(banktype, 2);
				List<Question> question3List = examService.getQuestionList(banktype, 3);
				int amount1 = examService.getAmount(banktype, 1);
				int amount2 = examService.getAmount(banktype, 2);
				int amount3 = examService.getAmount(banktype, 3);

				mav.addObject("amount1", amount1);
				mav.addObject("amount2", amount2);
				mav.addObject("amount3", amount3);
				mav.addObject("question1List", question1List);
				mav.addObject("question2List", question2List);
				mav.addObject("question3List", question3List);

			}
			if (op.equals("examlist")) {
				Teacher teacher = (Teacher) object;
				List<Exam> examList = examService.getExamList(teacher.getTeacher_id());
				mav.addObject("examList", examList);
			}
			if (op.equals("importstudent")) {
				Teacher teacher = (Teacher) object;
				List<Exam> examList = examService.getExamList(teacher.getTeacher_id());
				mav.addObject("examList", examList);
			}
			if(op.equals("tableresult")){
                Teacher teacher = (Teacher) object;
                List<Exam> examList = examService.getExamList(teacher.getTeacher_id());
                mav.addObject("examList", examList);
            }
			List<BankType> questionBankTypeList = getQuestionBankTypeList();
			mav.addObject("op", op);
			mav.addObject("banktype", questionBankTypeList);
			mav.addObject("qbank", banktype);
			return mav;
		}
	}

	@RequestMapping("getQuestinsByType.do")
	@ResponseBody
	private Map<String, Object> getQuestinsByType(int page, int qtype, int amount, int qbank) {
		List<Question> questionList = examService.getQuestionByType(page, qtype, qbank);
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("questionlist", questionList);
		res.put("amount", amount);
		res.put("stat", "200");
		return res;
	}

	@RequestMapping("delQuestionById.do")
	@ResponseBody
	private int deleteQuestionById(int qid) {
		if (examService.deleteQuestionById(qid)) {
			return 200;
		} else
			return 500;

	}

	public List<BankType> getQuestionBankTypeList() {
		return examService.getQuestionBankTypeList();
	}

	@RequestMapping("addSingleChoice.do")
	@ResponseBody
	private int addSingleChoice(QuestionDao queDao) {
		question.setBank_id(queDao.getQuesBank());
		question.setQuestion_analysis(queDao.getAnalysis());
		question.setQuestion_item(queDao.getItemA()+" "+queDao.getItemB()+" "+queDao.getItemC()+" "+queDao.getItemD());
		question.setQuestion_type(1);
		question.setQuestion_content(queDao.getQuestion());
		question.setQuestion_answer(queDao.getAnswer());
		if (examService.addQuestion(question,queDao.getIfPractice()))
			return 200;
		else
			return 500;
	}

	@RequestMapping("addTofChoice.do")
	@ResponseBody
	private int addTofChoice(QuestionDao queDao) {
		question.setBank_id(queDao.getQuesBank());
		question.setQuestion_analysis(queDao.getAnalysis());
		question.setQuestion_item("");
		question.setQuestion_type(3);
		question.setQuestion_content(queDao.getQuestion());
		question.setQuestion_answer(queDao.getAnswer());
		if (examService.addQuestion(question, queDao.getIfPractice()))
			return 200;
		else
			return 500;
	}

	@RequestMapping("addMultChoice.do")
	@ResponseBody
	private int addMultChoice(QuestionDao queDao) {
		question.setBank_id(queDao.getQuesBank());
		question.setQuestion_analysis(queDao.getAnalysis());
		question.setQuestion_item(queDao.getItemA()+" "+queDao.getItemB()+" "+queDao.getItemC()+" "+queDao.getItemD());
		question.setQuestion_type(2);
		question.setQuestion_content(queDao.getQuestion());
		question.setQuestion_answer(queDao.getAnswer());
		if (examService.addQuestion(question,queDao.getIfPractice()))
			return 200;
		else
			return 500;
	}

	@RequestMapping("addExam.do")
	@ResponseBody
	private int addExam(Exam exam) {		
        exam.setExam_finish_time(finishDate(exam));
        
		int resStat = examService.addExam(exam);
		int ifSus;
		if (resStat == 0) {
			int examId = exam.getExam_id();
			// 自动抽题
			try{
				String bankIdStr = exam.getBank_type();
		
			String[] strs = bankIdStr.split(",");
			List<ExamQuestion> questions = new ArrayList();
			List<Question> singleQuesList = examService.getQuestionByBank(strs, 1);
			List<Question> multQuesList = examService.getQuestionByBank(strs, 2);
			List<Question> torfQuesList = examService.getQuestionByBank(strs, 3);
			int singleNum = exam.getSingle_num();
			int mulitNum = exam.getMulit_num();
			int torfNum = exam.getTorf_num();
			Random random = new Random();
			// 抽取单选题
			for (int i = 0; i < singleNum; i++) {
				int index = random.nextInt(singleQuesList.size());
				Question q = singleQuesList.get(index);
				questions.add(makeExamQuestion(q, examId));
				singleQuesList.remove(index);
			}
			// 抽取多选题
			for (int i = 0; i < mulitNum; i++) {
				int index = random.nextInt(multQuesList.size());
				Question q = multQuesList.get(index);
				questions.add(makeExamQuestion(q, examId));
				multQuesList.remove(index);
			}
			// 抽取判断题
			for (int i = 0; i < torfNum; i++) {
				int index = random.nextInt(torfQuesList.size());
				Question q = torfQuesList.get(index);
				questions.add(makeExamQuestion(q, examId));
				torfQuesList.remove(index);
			}
			 ifSus = examService.addExamQuestion(questions);
			 
			}
			catch (Exception e) {
				examService.deleteExamById(examId);
				return -1;
			}			
			if (ifSus == 0) {
				examService.deleteExamById(examId);
				return -1;
			}
		}
		return resStat;
	}

	@RequestMapping("deleExam.do")
	@ResponseBody
	private int deleteExamById(int examId) {
		if (examService.deleteExamById(examId) == 1)
			return 200;
		else
			return 500;
	}
	@RequestMapping("addStudent.do")
	@ResponseBody
	private int addStudent(int exam_id,String collegeId,String majorId,int examPwd) {
		
		return 200;
	}
	@RequestMapping("getStuScore.do")
	@ResponseBody
	private Map<String, Object> getStudentScore(int page,int limit,int examId){
		Map<String,Object> res = new HashMap();
		int total = examService.getScoreTotal(examId);
		List<StudentScore> scoreList = examService.getScoreList(page,limit,examId);
		if(scoreList!=null) {
			res.put("code", 0);
			res.put("message", "");
			res.put("total",total);
            res.put("data",scoreList);
		}
		else
        {
            res.put("code",-1);
            res.put("message","获取数据失败");
            res.put("total",total);
        }
		return res;
	}

	private ExamQuestion makeExamQuestion(Question que, int examId) {
		ExamQuestion q = new ExamQuestion();
		q.setExam_id(examId);
		q.setQuestion_analysis(que.getQuestion_analysis());
		q.setQuestion_content(que.getQuestion_content());
		q.setQuestion_item(que.getQuestion_item());
		q.setQuestion_answer(que.getQuestion_answer());
		q.setQuestion_type(que.getQuestion_type());
		q.setQuestion_id(que.getQuestion_id());
		return q;
	}
	private Date finishDate(Exam exam) {
		Date startDate = exam.getExam_begin_time();
		Date duration = exam.getExam_duration();
		Calendar strCal = Calendar.getInstance(),durCal = Calendar.getInstance();
		strCal.setTime(startDate);
		durCal.setTime(duration);
        int hour = durCal.get(Calendar.HOUR_OF_DAY);
        int minute = durCal.get(Calendar.MINUTE);
        int second  = durCal.get(Calendar.SECOND);
        strCal.add(Calendar.HOUR_OF_DAY, hour);
        strCal.add(Calendar.MINUTE, minute);
        strCal.add(Calendar.SECOND, second);
        return strCal.getTime();
	}
}
