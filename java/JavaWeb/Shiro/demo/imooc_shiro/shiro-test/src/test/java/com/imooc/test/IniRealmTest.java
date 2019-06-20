package com.imooc.test;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.text.IniRealm;
import org.apache.shiro.subject.Subject;
import org.junit.Test;


public class IniRealmTest {

    @Test
    public void testAuthentication(){
        IniRealm iniRealm = new IniRealm("classpath:user.ini");

        //1.构建securityManager环境
        DefaultSecurityManager dsm = new DefaultSecurityManager();
        dsm.setRealm(iniRealm);

        //2.主体提交认证请求
        SecurityUtils.setSecurityManager(dsm);
        Subject subject = SecurityUtils.getSubject();

        UsernamePasswordToken token = new UsernamePasswordToken("mark","123456");
        subject.login(token);

        System.out.println("isAuthenticated:"+subject.isAuthenticated());
        subject.checkPermission("admin");
        subject.checkPermission("user:delete");
    }
}
