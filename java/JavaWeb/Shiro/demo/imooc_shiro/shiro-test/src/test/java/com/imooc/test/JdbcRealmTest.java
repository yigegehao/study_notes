package com.imooc.test;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.jdbc.JdbcRealm;
import org.apache.shiro.subject.Subject;
import org.junit.Test;

public class JdbcRealmTest {
    DruidDataSource dataSource = new DruidDataSource();
    {
        dataSource.setUrl("jdbc:mysql://localhost:32768/test");
        dataSource.setUsername("root");
        dataSource.setPassword("x");
    }
    @Test
    public void testAuthentication(){
        JdbcRealm jr = new JdbcRealm();
        jr.setDataSource(dataSource);
        //jr.setPermissionsLookupEnabled(true);
        //用户查询
        String sqlUser = "select password from shiro_user where username = ?";
        jr.setAuthenticationQuery(sqlUser);
        //角色查询
        String sqlRoles = "select role_name from shiro_user_roles where username = ?";
        jr.setUserRolesQuery(sqlRoles);

        //1.配置SecurityManager环境
        DefaultSecurityManager dsm = new DefaultSecurityManager();
        dsm.setRealm(jr);


        //2.获取主体
        SecurityUtils.setSecurityManager(dsm);
        Subject subject = SecurityUtils.getSubject();

        //3.主体提交认证请求
        UsernamePasswordToken token = new UsernamePasswordToken("x","x");
        subject.login(token);
        System.out.println("isAuthenticated:"+subject.isAuthenticated());

        subject.checkRole("admin");
        //subject.checkPermission("admin");
    }
}
