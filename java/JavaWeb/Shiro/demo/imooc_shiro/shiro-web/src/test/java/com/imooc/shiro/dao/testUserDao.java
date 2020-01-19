package com.imooc.shiro.dao;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class testUserDao {

    @Test
    public void testUserDao() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:spring/spring.xml");
        ac.getBean("jdbcTemplate");
    }
}
