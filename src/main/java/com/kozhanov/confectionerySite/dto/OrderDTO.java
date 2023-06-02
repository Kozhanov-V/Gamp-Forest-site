package com.kozhanov.confectionerySite.dto;

import com.kozhanov.confectionerySite.enums.OrderStatus;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;

public class OrderDTO {
    private Integer id;
    private String clientName;
    private HashMap<String,Integer> products;
    private OrderStatus status;
    private BigDecimal totalCost;
    private Date orderDate;

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public HashMap<String, Integer> getProducts() {
        return products;
    }

    public void addInProductMap(String productName,int quantityProduct){
        if(products==null){
            products = new HashMap<>();
        }
        products.put(productName,quantityProduct);
    }
    public void setProducts(HashMap<String, Integer> products) {
        this.products = products;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public BigDecimal getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(BigDecimal totalCost) {
        this.totalCost = totalCost;
    }
}
