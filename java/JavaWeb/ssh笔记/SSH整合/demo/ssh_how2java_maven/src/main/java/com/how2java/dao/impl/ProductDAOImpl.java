package com.how2java.dao.impl;

import com.how2java.dao.ProductDAO;
import com.how2java.pojo.Product;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.HibernateTemplate;

import java.util.List;


public class ProductDAOImpl extends HibernateTemplate implements ProductDAO{

    private SessionFactory sessionFactory;


    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }


    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Product> list() {
        return (List<Product>) find("from Product");
    }
 

    public void add(Product p) {
        save(p);
    }
     
}