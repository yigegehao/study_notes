package com.how2java.dao.impl;
 
import java.util.List;
 
import org.springframework.orm.hibernate3.HibernateTemplate;
 
import com.how2java.dao.ProductDAO;
import com.how2java.pojo.Product;
 
public class ProductDAOImpl extends HibernateTemplate implements ProductDAO{
     
    public List<Product> list() {
        return find("from Product");
    }
 
    @Override
    public void add(Product p) {
        save(p);
    }
     
}