package com.kozhanov.confectionerySite.dao;

import com.kozhanov.confectionerySite.entity.Order;
import com.kozhanov.confectionerySite.entity.OrderedProduct;
import com.kozhanov.confectionerySite.entity.Product;

import java.util.List;

public interface OrderedProductDAO {
    public List<Product> getSellsByUser(int idClient, int count);
    public List<OrderedProduct> getAllOrders();
    public List<OrderedProduct> getByOrder(Order order);
}
