# 更换阿里云镜像
    wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

# vim升级

    rpm -Uvh http://mirror.ghettoforge.org/distributions/gf/gf-release-latest.gf.el7.noarch.rpm
    rpm --import http://mirror.ghettoforge.org/distributions/gf/RPM-GPG-KEY-gf.el7
    yum -y remove vim-minimal vim-common vim-enhanced 
    yum -y --enablerepo=gf-plus install vim-enhanced 

# 利用xshell上传文件到linux

    yum install -y lrzsz
    rz

# 安装dokcer
    要求内核3.10以上
    卸载旧版：sudo yum remove docker  docker-common docker-selinux docker-engine
    安装新版：
        sudo yum install -y yum-utils device-mapper-persistent-data lvm2
        sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
        yum list docker-ce --showduplicates | sort -r
        sudo yum install docker-ce 

# 安装nvm

    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
    source   ~/.bashrc

# 图形界面与tty界面的切换
    systemctl set-default graphical.target
    systemctl set-default multi-user.target

# centos防火墙相关命令
    查看已开放的端口:netstat -anp
    查询某个端口是否开放:firewall-cmd --query-port=61500/tcp
    添加指定需要开放的端口:firewall-cmd --add-port=123/tcp --permanent
    重载入添加的端口:firewall-cmd --reload
    查看防火墙状态 systemctl status firewalld
    开启防火墙 systemctl start firewalld  
    关闭防火墙 systemctl stop firewalld
    开启防火墙 service firewalld start 
    若遇到无法开启
    先用：systemctl unmask firewalld.service 
    然后：systemctl start firewalld.service
