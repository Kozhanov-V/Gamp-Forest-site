package com.kozhanov.confectionerySite.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "purchases")
public class Purchase {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "supplier_id")
    private Supplier supplier;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @Column(name = "purchase_date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date purchaseDate;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "purchase_price", nullable = false)
    private BigDecimal purchasePrice;

    public Purchase() {
    }

    public Purchase(Integer id, Supplier supplier, Product product, Date purchaseDate, Integer quantity, BigDecimal purchasePrice) {
        this.id = id;
        this.supplier = supplier;
        this.product = product;
        this.purchaseDate = purchaseDate;
        this.quantity = quantity;
        this.purchasePrice = purchasePrice;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(BigDecimal purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    // Конструкторы, геттеры и сеттеры
}

