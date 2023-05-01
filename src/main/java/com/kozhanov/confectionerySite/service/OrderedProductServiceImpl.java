package com.kozhanov.confectionerySite.service;

import com.kozhanov.confectionerySite.dao.OrderedProductDAO;
import com.kozhanov.confectionerySite.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderedProductServiceImpl implements OrderedProductService{

    @Autowired
    OrderedProductDAO orderedProductDAO;

    @Override
    @Transactional
    public List<Product> getSellsByUser(int idClient, int count) {
        return orderedProductDAO.getSellsByUser(idClient,count);
    }
}
