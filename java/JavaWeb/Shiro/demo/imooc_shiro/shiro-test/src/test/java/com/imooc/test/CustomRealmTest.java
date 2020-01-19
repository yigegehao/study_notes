package com.imooc.test;

import com.imooc.shiro.realm.CustomRealm;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.subject.Subject;
import org.junit.Test;

public class CustomRealmTest {

    @Test
    public void testAuthentication() {
        CustomRealm cr = new CustomRealm();
        //加密
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher();
        matcher.setHashAlgorithmName("md5");
        matcher.setHashIterations(1);
        cr.setCredentialsMatcher(matcher);
        //1.构建SecurityManager环境
        DefaultSecurityManager dsm = new DefaultSecurityManager();
        dsm.setRealm(cr);
        //2.获取主体对象
        SecurityUtils.setSecurityManager(dsm);
        Subject subject = SecurityUtils.getSubject();
        //3.主体提交认证请求
        UsernamePasswordToken token = new UsernamePasswordToken("Mark", "123456");
        subject.login(token);

        System.out.println(subject.isAuthenticated());
       /* subject.checkRole("admin");
        subject.checkPermission("user:delete");*/
    }
}
