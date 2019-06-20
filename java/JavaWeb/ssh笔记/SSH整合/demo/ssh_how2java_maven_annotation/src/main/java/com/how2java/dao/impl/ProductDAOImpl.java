package com.how2java.dao.impl;

import com.how2java.dao.ProductDAO;
import com.how2java.pojo.Product;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO{

    @Autowired private SessionFactory sessionFactory;


    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }


    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Product> list() {
        Query query = sessionFactory.getCurrentSession().createQuery("from Product");
        List list = query.list();
        return (List<Product>) list;
    }
 

    public void add(Product p) {
        sessionFactory.getCurrentSession().save(p);
    }
     
}