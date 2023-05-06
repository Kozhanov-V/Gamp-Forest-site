package com.kozhanov.confectionerySite.entity;

import javax.persistence.*;

@Entity
@Table(name = "cart_items")
public class CartItem {

    @Override
    public String toString() {
        return "CartItem{" +
                "id=" + id +
                ", client=" + client +
                ", product=" + product +
                ", quantity=" + quantity +
                '}';
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id",nullable = false)
    private int id;

    @ManyToOne
    @JoinColumn(name = "client_id",nullable = false)
    private Client client;

    @ManyToOne
    @JoinColumn(name = "product_id",nullable = false)
    private Product product;

    @Column(name = "quantity",nullable = false)
    private int quantity;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public CartItem() {
    }


    public CartItem(Client client, Product product, int quantity) {
        this.client = client;
        this.product = product;
        this.quantity = quantity;
    }
}

