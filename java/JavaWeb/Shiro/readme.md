# 概述

    shiro是Apache开源的一个强大灵活的安全框架
    提供认证、授权、企业会话管理、安全加密等功能

# Shiro架构图
![](./picture/shiro_arch.png)

# Shiro认证流程
![](./picture/认证流程.png)

    //1.构建SecurityManager环境
    DefaultSecurityManager dsm = new DefaultSecurityManager();
    SimpleAccountRealm sar = new SimpleAccountRealm();
    sar.addAcount("username","password");
    dsm.setReaml(sar);

    //2.主体提交请求
    SecurityUtils.setSecurityMananger(dsm);
    Subject subject = SecurityUtils.getSubjetc();
    UsernamePasswordToken token = new UsernamePasswordToker("username","password");
    subject.login(token);

# Shiro授权流程
![](./picture/授权流程.png)

    