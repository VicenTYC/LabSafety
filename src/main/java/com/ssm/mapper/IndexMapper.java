package com.ssm.mapper;

import com.ssm.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface IndexMapper {

	List<FileRule> getFileRule(@Param("start")int start, @Param("pageSize")int pageSize);

	List<Regulation> getRegulation(@Param("currentPage")int currentPage, @Param("pageSize")int pageSize);
	
	//获取无内容系统公告
	List<SystemNotice> getSystemNotice(@Param("currentPage")int currentPage, @Param("pageSize")int pageSize);

	List<FileType> getFileTypeList();

	List<BankType> getQuestionBankTypeList();

	List<LearningFile> getLearningFileByType(@Param("fileType")int fileType,@Param("start") int sta);

	int getFileAmount(@Param("fileType")int fileType);

	int getFileRuleAmount();

	List<Exam> findExam( @Param("college")String student_college, @Param("major")String student_major);

	Exam findExamById(@Param("examId")int examId);

	List<Question> getQuestionOfPaper(@Param("examId")int examId, @Param("quesType")int quesType);

	int addStudentScore(@Param("examId") int examId, @Param("studentId") String studentId, @Param("right") int right, @Param("wrongQuestion") String wrongQuestion, String string, String string2, String student_name, Date exam_begin_time);

    List<Question> getPracticeQuestions(@Param("bankId") int bankId,@Param("start") int start,@Param("limit") int limit);

    int getPracticeQuestionsAmount(@Param("bankId") int bankId);
}
