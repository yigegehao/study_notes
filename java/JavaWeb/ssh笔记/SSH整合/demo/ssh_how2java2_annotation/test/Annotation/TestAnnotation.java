package Annotation;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.how2java.dao.ProductDAO;
import com.how2java.pojo.Product;
import com.sun.glass.ui.Application;

public class TestAnnotation {

	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		ProductDAO productDAO = (ProductDAO) ac.getBean("productDAO");
		Product p1 = new Product();
		p1.setId(1);
		p1.setName("x");
		p1.setPrice((float)11.11);
		productDAO.add(p1);
	}

}
