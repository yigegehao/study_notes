# 导入依赖
# 在web.xml中配置Spring容器

    <listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>
# 配置Struts2的拦截器

    <filter>
        <filter-name>struts2</filter-name>
        <filter-class>
            org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter
        </filter-class>
    </filter>
    <filter-mapping>
        <filter-name>struts2</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

# 在Struts.xml中开启Action的创建交给Spring掌管

    <!-- 将action的生命周期交给spring -->
    <constant name="struts.objectFactory" value="spring"/>

# 在Application.xml中配置Hibernate的SessionFactory


    <bean name="sessionFactory" class="org.springframework.orm.hibernate3.LocalSessionFactoryBean">
            <!--配置数据源 -->
            <property name="dataSource" ref="dataSource"/>
            <!--配置实体映射文件路径 -->
            <property name="mappingResources">
                <list>
                    <value>com/how2java/pojo/Product.hbm.cfg</value>
                </list>
            </property>
            <property name="hibernateProperties">
                <value>
                    hibernate.dialect=org.hibernate.dialect.MySQLDialect
                    hibernate.show_sql=true
                    hbm2ddl.auto=update
                </value>
            </property>
     </bean>
    <bean name="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
        <property name="driverClassName" value="com.mysql.jdbc.Driver" />
        <property name="url" value="jdbc:mysql://localhost:32768/how2java?characterEncoding=UTF-8" />
        <property name="username" value="root" />
        <property name="password" value="x" />
    </bean>


# 基于注解方式
## Spring开启Bean扫描和自动装配

    <context:component-scan base-package="com.how2java"></context:component-scan>

    实体bean扫描：
    <property name="packagesToScan">
        <list>
            <value>com.how2java.pojo</value>
        </list>
    </property>