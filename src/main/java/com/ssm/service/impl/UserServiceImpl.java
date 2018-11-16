package com.ssm.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.mapper.UserMapper;
import com.ssm.pojo.Student;
import com.ssm.pojo.Teacher;
import com.ssm.service.UserService;

@Service(value = "userService")
public class UserServiceImpl  implements UserService{

	@Autowired
    private UserMapper userMapper;
	
	public Student getStudentById(String studentId) {
		return userMapper.getStudentById(studentId);
	}

	public Teacher getTeacherById(String userId) {
		return userMapper.getTeacherById(userId);
	}

	public void updateTLastDate(String userId, Date date) {
		userMapper.updateTLastDate(userId,date);
	}

}
