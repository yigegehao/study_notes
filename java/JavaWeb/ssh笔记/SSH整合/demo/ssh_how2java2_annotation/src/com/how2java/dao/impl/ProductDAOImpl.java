package com.how2java.dao.impl;
 
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.how2java.dao.ProductDAO;
import com.how2java.pojo.Product;

@Repository("productDAO")
public class ProductDAOImpl extends HibernateTemplate implements ProductDAO{
     
	//@Autowired
    //private HibernateTemplate hibernateTemplate;//Ìá¹©HibernateÄ£°å
	@Autowired private SessionFactory sessionFactory;
	
	
    public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Product> list() {
        return /*hibernateTemplate.*/find("from Product");
    }
 
    @Override
    public void add(Product p) {
        /*hibernateTemplate.*/save(p);
    }
     
}