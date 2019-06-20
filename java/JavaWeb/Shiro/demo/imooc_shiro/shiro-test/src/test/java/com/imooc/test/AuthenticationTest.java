package com.imooc.test;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.SimpleAccountRealm;
import org.apache.shiro.subject.Subject;
import org.junit.Before;
import org.junit.Test;

public class AuthenticationTest {
    SimpleAccountRealm sar = new SimpleAccountRealm();

    @Before
    public void addUser(){
        sar.addAccount("x","x","admin");
    }
    @Test
    public void testAuthentication(){
        //1.构建SecurityManager环境
        DefaultSecurityManager dsm = new DefaultSecurityManager();
        dsm.setRealm(sar);

        //2.主体提交认证请求
        SecurityUtils.setSecurityManager(dsm);
        Subject subject = SecurityUtils.getSubject();

        //3.模拟登陆
        UsernamePasswordToken token = new UsernamePasswordToken("x","x");
        subject.login(token);
        System.out.println("isAuthentication:"+subject.isAuthenticated());

        subject.checkPermission("admin1");

        //4.模拟注销
        subject.logout();
        System.out.println("isAuthentication:"+subject.isAuthenticated());
    }
}
