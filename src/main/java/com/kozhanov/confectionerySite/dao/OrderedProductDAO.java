package com.kozhanov.confectionerySite.dao;

import com.kozhanov.confectionerySite.entity.Product;

import java.util.List;

public interface OrderedProductDAO {
    public List<Product> getSellsByUser(int idClient, int count);
}
