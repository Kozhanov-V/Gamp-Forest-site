package com.kozhanov.confectionerySite.service;

import com.kozhanov.confectionerySite.entity.Product;

import java.util.List;

public interface OrderedProductService {
    public List<Product> getSellsByUser(int idClient, int count);
}
