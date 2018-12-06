package com.ssm.mapper;

import com.ssm.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface  ExamMapper {

	public List<BankType> getQuestionBankTypeList();

	public List<Question> getQuestionList(@Param("banktype")int banktype, @Param("qtype")int qtype);

	public int getAmount(@Param("banktype")int banktype, @Param("qtype")int qtype);

	public List<Question> getQuestionByType(@Param("staNum")int staNum, @Param("qtype")int qtype, @Param("qbank")int qbank);

	public int deleteQuestionById(@Param("qid")int qid);

	public int addQuestion(Question question);

	int addPracticeQuestion(Question question);

	public Exam getExamByName(@Param("exam_name")String exam_name);

	public int addExam(Exam exam);

	public List<Exam> getExamList(@Param("teacherId")int teacher_id);

	public List<Question> getQuestionByBank(@Param("banks")String[] strs, @Param("questionType")int questionType);

	public int addExamQuestion(@Param("questions")List<ExamQuestion> questions);

	public int deleteExamById(@Param("examId") int examId);

	public int deleteExamQuestion(@Param("examId")int examId);

	public List<StudentScore> getScoreList(@Param("start")int startClum,@Param("limit") int limit, @Param("examId")int examId);

    int getScoreTotal(@Param("examId") int examId);
}
