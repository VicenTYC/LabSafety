package com.ssm.service;

import java.util.Date;

import com.ssm.pojo.Student;
import com.ssm.pojo.Teacher;

public interface UserService {

	Student getStudentById(String studentId);

	Teacher getTeacherById(String userId);

	void updateTLastDate(String userId, Date date);

}
