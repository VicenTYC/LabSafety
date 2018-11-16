package com.ssm.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.Student;
import com.ssm.pojo.Teacher;

public interface UserMapper {

	Student getStudentById(@Param("studentId")String studentId);

	Teacher getTeacherById(@Param("teacherId")String userId);

	void updateTLastDate(@Param("teacherId")String userId, @Param("date")Date date);

}
