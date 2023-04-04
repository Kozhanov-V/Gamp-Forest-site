package com.kozhanov.confectionerySite.entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(nullable = false,name = "name")
    private String name;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @Column(name = "description")
    private String description;

    @Column(nullable = false,name = "price")
    private BigDecimal price;

    @Column(name = "image_url")
    private String imageURL;

    public Product() {
    }

    public Product(Integer id, String name, Category category, String description, BigDecimal price, String imageURL) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.description = description;
        this.price = price;
        this.imageURL = imageURL;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    // Конструкторы, геттеры и сеттеры
}

