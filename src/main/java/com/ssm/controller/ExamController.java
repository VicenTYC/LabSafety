package com.ssm.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.ssm.pojo.BankType;
import com.ssm.pojo.Exam;
import com.ssm.pojo.ExamQuestion;
import com.ssm.pojo.MultChoiceQuestion;
import com.ssm.pojo.Question;
import com.ssm.pojo.SingleChoiceQuestion;
import com.ssm.pojo.Teacher;
import com.ssm.service.ExamService;

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
	private int addSingleChoice(SingleChoiceQuestion question) {
		if (examService.addQuestion(makeQuestion(question, 1)))
			return 200;
		else
			return 500;
	}

	@RequestMapping("addTofChoice.do")
	@ResponseBody
	private int addTofChoice(int quesBank, String queContent, String answer, String analysis) {
		question.setBank_id(quesBank);
		question.setQuestion_content(queContent);
		question.setQuestion_answer(answer);
		question.setQuestion_analysis(analysis);
		question.setQuestion_type(3);
		if (examService.addQuestion(question))
			return 200;
		else
			return 500;
	}

	@RequestMapping("addMultChoice.do")
	@ResponseBody
	private int addMultChoice(MultChoiceQuestion que) {
		String str = que.getItemA() + " " + que.getItemB() + " " + que.getItemC() + " " + que.getItemD();
		String answer = "";
		for (String iter : que.getAnswer())
			answer += iter + " ";
		question.setBank_id(que.getQuesBank());
		question.setQuestion_analysis(que.getAnalysis());
		question.setQuestion_content(que.getQuestion());
		question.setQuestion_item(str);
		question.setQuestion_answer(answer);
		question.setQuestion_type(2);
		if (examService.addQuestion(question))
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

	private Question makeQuestion(SingleChoiceQuestion que, int qtype) {
		String str = que.getItemA() + " " + que.getItemB() + " " + que.getItemC() + " " + que.getItemD();
		question.setBank_id(que.getQuesBank());
		question.setQuestion_analysis(que.getAnalysis());
		question.setQuestion_content(que.getQuestion());
		question.setQuestion_item(str);
		question.setQuestion_answer(que.getAnswer());
		question.setQuestion_type(qtype);
		return question;
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
