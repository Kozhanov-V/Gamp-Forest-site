package com.kozhanov.confectionerySite.entity;

import com.kozhanov.confectionerySite.enums.PaymentMethod;
import com.kozhanov.confectionerySite.enums.PaymentStatus;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "payments")
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Enumerated(EnumType.STRING)
    @Column(name = "payment_method", nullable = false)
    private PaymentMethod paymentMethod;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, name = "status")
    private PaymentStatus status;

    @Column(name = "payment_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date paymentDate;

    @Column(name = "amount")
    private BigDecimal amount;

    public Payment() {
    }

    public Payment(Integer id, PaymentMethod paymentMethod, PaymentStatus status, Date paymentDate, BigDecimal amount) {
        this.id = id;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.paymentDate = paymentDate;
        this.amount = amount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public PaymentStatus getStatus() {
        return status;
    }

    public void setStatus(PaymentStatus status) {
        this.status = status;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    // Конструкторы, геттеры и сеттеры, enums PaymentMethod и PaymentStatus
}

