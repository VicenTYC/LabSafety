package com.ssm.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.ssm.pojo.Student;
import com.ssm.pojo.Teacher;
import com.ssm.service.UserService;

@Controller
@RequestMapping("")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("studentlogin.do")
    public ModelAndView studentLogin(HttpServletRequest request, HttpServletResponse response, String userId, String userPwd) {
        ModelAndView indexMav = new ModelAndView("redirect:getIndex.do");
        ModelAndView loginMav = new ModelAndView("login");
        Student student = userService.getStudentById(userId);
        String errMsg = null;
        if (student == null) {
            errMsg = "用户不存在，请检查账号是否正确";
            request.setAttribute("errMsg", errMsg);
            return loginMav;
        } else if (student.getStudent_password().equals(userPwd) == false) {
            errMsg = "用户密码错误";
            request.setAttribute("errMsg", errMsg);
            return loginMav;
        } else {
            request.getSession().setAttribute("student", student);
        }
        return indexMav;
    }

    @RequestMapping("teacherlogin.do")
    public ModelAndView teacherlogin(HttpServletRequest request, HttpServletResponse response, String userId, String userPwd) {
        ModelAndView indexMav = new ModelAndView("redirect:/exam/bgIndex.do");
        ModelAndView loginMav = new ModelAndView("login");
        ModelAndView systemMav = new ModelAndView("redirect:/system/sysIndex.do");
        if(userId.trim().equals("12345"))
            if(userPwd.equals("sysaqykspt_sys")) {
                request.getSession().setAttribute("system", "system");
                return systemMav;
            }
        Teacher teacher = userService.getTeacherById(userId);
        String errMsg = null;
        if (teacher == null) {
            errMsg = "用户不存在，请检查账号是否正确";
            request.setAttribute("errMsg", errMsg);
            return loginMav;
        } else if (teacher.getTeacher_password().equals(userPwd) == false) {
            errMsg = "用户密码错误";
            request.setAttribute("errMsg", errMsg);
            return loginMav;
        } else {
            request.getSession().setAttribute("teacher", teacher);
            Date date = new Date();
            userService.updateTLastDate(userId, date);
        }
        return indexMav;
    }

    @RequestMapping("login.do")
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView("login");
        return mav;
    }

    @RequestMapping("quit.do")
    public ModelAndView quie(HttpServletRequest request, String user) {
        ModelAndView mav = new ModelAndView("login");
        request.getSession().removeAttribute(user);
        return mav;
    }
}
