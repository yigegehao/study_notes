package com.how2java.controller;

import com.how2java.pojo.Product;
import com.how2java.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
public class ProductController {

    @Autowired
    ProductService productService;

    @RequestMapping("/listProduct")
    private String list(Model model) {
        List<Product> products = productService.list();
        model.addAttribute("products", products);
        return "list";
    }

    public ProductService getProductService() {
        return productService;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }


}