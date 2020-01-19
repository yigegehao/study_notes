package com.how2java.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.how2java.pojo.Product;
import com.how2java.service.ProductService;

@Controller("productAction")
//@ParentPackage("struts-default")
//@Namespace("/")
@Scope("prototype")
public class ProductAction {

    //@Resource(name="productServiceImpl")
    @Autowired
    ProductService productService;

    List<Product> products;

    @Action(value = "/listProduct", results = {@Result(name = "listJsp", location = "/list.jsp")})
    public String list() {
        products = productService.list();
        return "listJsp";
    }

    public ProductService getProductService() {
        return productService;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

}