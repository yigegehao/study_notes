package com.imooc.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class testUserDao {

    @Test
    public void testUserDao(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:spring/*");
        ac.getBean("jdbcTemplate");
    }
}
