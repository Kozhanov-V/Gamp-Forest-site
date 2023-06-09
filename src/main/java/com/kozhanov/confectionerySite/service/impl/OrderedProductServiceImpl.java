package com.kozhanov.confectionerySite.service.impl;

import com.kozhanov.confectionerySite.dao.OrderedProductDAO;
import com.kozhanov.confectionerySite.entity.OrderedProduct;
import com.kozhanov.confectionerySite.entity.Product;
import com.kozhanov.confectionerySite.service.OrderedProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderedProductServiceImpl implements OrderedProductService {

    @Autowired
    OrderedProductDAO orderedProductDAO;

    @Override
    @Transactional
    public List<Product> getSellsByUser(int idClient, int count) {
        return orderedProductDAO.getSellsByUser(idClient,count);
    }

    @Override
    @Transactional
    public List<OrderedProduct> getAllOrders() {
        return orderedProductDAO.getAllOrders();
    }
}
