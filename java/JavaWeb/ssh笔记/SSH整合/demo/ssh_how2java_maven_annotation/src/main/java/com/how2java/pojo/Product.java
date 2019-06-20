package com.how2java.pojo;

import javax.persistence.*;

@Entity
@Table(name = "product_")
public class Product {

	private int id;
	private String name;
	private float price;


	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	@Column
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	@Column
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
}
