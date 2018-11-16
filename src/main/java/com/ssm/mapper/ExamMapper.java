package com.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

import com.ssm.pojo.BankType;
import com.ssm.pojo.Exam;
import com.ssm.pojo.ExamQuestion;
import com.ssm.pojo.Question;

public interface  ExamMapper {

	public List<BankType> getQuestionBankTypeList();

	public List<Question> getQuestionList(@Param("banktype")int banktype, @Param("qtype")int qtype);

	public int getAmount(@Param("banktype")int banktype, @Param("qtype")int qtype);

	public List<Question> getQuestionByType(@Param("staNum")int staNum, @Param("qtype")int qtype, @Param("qbank")int qbank);

	public int deleteQuestionById(@Param("qid")int qid);

	public int addQuestion(Question question);

	public Exam getExamByName(@Param("exam_name")String exam_name);

	public int addExam(Exam exam);

	public List<Exam> getExamList(@Param("teacherId")int teacher_id);

	public List<Question> getQuestionByBank(@Param("banks")String[] strs, @Param("questionType")int questionType);

	public int addExamQuestion(@Param("questions")List<ExamQuestion> questions);

	public int deleteExamById(@Param("examId") int examId);


}
