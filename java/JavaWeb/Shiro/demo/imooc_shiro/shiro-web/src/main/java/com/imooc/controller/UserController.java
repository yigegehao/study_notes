package com.imooc.controller;

import com.imooc.vo.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

    @RequestMapping(value = "/subLogin", method = RequestMethod.POST,
            produces = "application/json;charset=utf-8")
    @ResponseBody
    public String subLogin(User user) {
        System.out.println(user.getUsername());
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());
        try {
            subject.login(token);
        } catch (Exception e) {
            return (e.getMessage());
        }
        //System.out.println(subject.hasRole("admin"));
        return "登陆成功";
    }

    //@RequiresRoles("admin")
    @RequestMapping(value = "/testRole", method = RequestMethod.GET)
    @ResponseBody
    public String testRoles() {
        return "testRole success";
    }

    //@RequiresRoles("admin1")
    @RequestMapping(value = "/testRole1", method = RequestMethod.GET)
    @ResponseBody
    public String testRole1() {
        return "testRole success";
    }

    @RequestMapping(value = "/testPerm", method = RequestMethod.GET)
    @ResponseBody
    public String testPerm() {
        return "testRole success";
    }

    @RequestMapping(value = "/testPerm1", method = RequestMethod.GET)
    @ResponseBody
    public String testPerm1() {
        return "testRole success";
    }

}
