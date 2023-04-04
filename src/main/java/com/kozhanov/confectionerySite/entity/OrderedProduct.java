package com.kozhanov.confectionerySite.entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "ordered_products")
public class OrderedProduct {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "price_per_unit", nullable = false)
    private BigDecimal pricePerUnit;

    public OrderedProduct() {
    }

    public OrderedProduct(Integer id, Order order, Product product, Integer quantity, BigDecimal pricePerUnit) {
        this.id = id;
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.pricePerUnit = pricePerUnit;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPricePerUnit() {
        return pricePerUnit;
    }

    public void setPricePerUnit(BigDecimal pricePerUnit) {
        this.pricePerUnit = pricePerUnit;
    }

    // Конструкторы, геттеры и сеттеры
}

