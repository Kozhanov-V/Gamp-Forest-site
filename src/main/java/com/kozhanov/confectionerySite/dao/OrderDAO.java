package com.kozhanov.confectionerySite.dao;

import com.kozhanov.confectionerySite.entity.Order;

import java.util.List;

public interface OrderDAO {
    public List<Order> getAllOrders();
}
