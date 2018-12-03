package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.tags.EscapeBodyTag;

import com.ssm.mapper.ExamMapper;
import com.ssm.pojo.BankType;
import com.ssm.pojo.Exam;
import com.ssm.pojo.ExamQuestion;
import com.ssm.pojo.Question;
import com.ssm.pojo.StudentScore;
import com.ssm.service.ExamService;
@Service(value="examServie")
public class ExamServiceImpl implements ExamService {
     @Autowired
     ExamMapper examMapper;
     
	public List<BankType> getQuestionBankTypeList() {
		return examMapper.getQuestionBankTypeList();
	}


	public List<Question> getQuestionList(int banktype, int qtype) {
		return examMapper.getQuestionList(banktype,qtype);
	}


	public int getAmount(int banktype, int qtype) {
		return examMapper.getAmount(banktype,qtype);
	}


	public List<Question> getQuestionByType(int page, int qtype, int qbank) {
		int staNum = (page-1)*15;
		return examMapper.getQuestionByType(staNum,qtype,qbank);
	}


	public boolean deleteQuestionById(int qid) {
		return (examMapper.deleteQuestionById(qid)==1)?true:false;
	}


	public boolean addQuestion(Question question) {
		return (examMapper.addQuestion(question)==1)?true:false;
	}


	public int addExam(Exam exam) {
		Exam sec = examMapper.getExamByName(exam.getExam_name());
		if(sec==null) {
			if(examMapper.addExam(exam)==1)
				return 0;
			else return -1;
		}
		else
		return 2;
	}


	public List<Exam> getExamList(int teacher_id) {
		return examMapper.getExamList(teacher_id);
	}


	public List<Question> getQuestionByBank(String[] strs, int questionType) {
		return examMapper.getQuestionByBank(strs,questionType);
	}


	public int addExamQuestion(List<ExamQuestion> questions) {
		return examMapper.addExamQuestion(questions);
	}


	public int deleteExamById(int examId) {
		int status = 0;
		if(examMapper.deleteExamQuestion(examId)>=1)
			status = examMapper.deleteExamById(examId);
		return status;
	}


	@Override
	public List<StudentScore> getScoreList(int page, int limit, int examId) {
		int starClum = (page-1)*limit;
		return examMapper.getScoreList(starClum,limit,examId);
	}


	@Override
	public int getScoreTotal(int examId) {
		return 0;
	}

}
