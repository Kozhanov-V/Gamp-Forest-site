package com.kozhanov.confectionerySite.entity;

import javax.persistence.*;

@Entity
@Table(name = "clients")
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "full_name", nullable = false)
    private String fullName;

    @Column(name = "phone",nullable = false)
    private String phone;

    @Column(name = "email")
    private String email;

    @Column(name = "delivery_address")
    private String deliveryAddress;

    @Column(name = "password",nullable = false)
    private String password;

    public Client() {
    }

    public Client(Integer id, String fullName, String phone, String email, String deliveryAddress, String password) {
        this.id = id;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.deliveryAddress = deliveryAddress;
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Конструкторы, геттеры и сеттеры
}

