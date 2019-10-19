# 什么是jenkins
    Jenkins是一个开源软件项目，是基于Java开发的一种持续集成工具，用于监控持续重复的工作，旨在提供一个开放易用的软件平台，使软件的持续集成变成可能。
# jenkins的主要功能
    1、持续的软件版本发布/测试项目。
    2、监控外部调用执行的工作。
# docker部署jenkins
    docker pull jenkins/jenkins:lts
    docker run --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --restart always -d jenkins/jenkins:lts
    docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword