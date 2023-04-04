package com.kozhanov.confectionerySite.entity;

import com.kozhanov.confectionerySite.enums.OrderStatus;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "client_id")
    private Client client;

    @Column(name = "order_date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderDate;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, name = "status")
    private OrderStatus status;

    @Column(name = "total_cost", nullable = false)
    private BigDecimal totalCost;

    @OneToOne
    @JoinColumn(name = "payment_id")
    private Payment payment;

    public Order() {
    }

    public Order(Integer id, Client client, Date orderDate, OrderStatus status, BigDecimal totalCost, Payment payment) {
        this.id = id;
        this.client = client;
        this.orderDate = orderDate;
        this.status = status;
        this.totalCost = totalCost;
        this.payment = payment;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
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

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    // Конструкторы, геттеры и сеттеры, enum OrderStatus
}

