package com.how2java.service.impl;

import com.how2java.dao.ProductDAO;
import com.how2java.pojo.Product;
import com.how2java.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductDAO productDAO;

    public List<Product> list() {
        List<Product> products = productDAO.list();
        if (products.isEmpty()) {
            for (int i = 0; i < 5; i++) {
                Product p = new Product();
                p.setName("product " + i);
                productDAO.add(p);
                products.add(p);
            }
        }
        return products;
    }

    public ProductDAO getProductDAO() {
        return productDAO;
    }

    public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }
}