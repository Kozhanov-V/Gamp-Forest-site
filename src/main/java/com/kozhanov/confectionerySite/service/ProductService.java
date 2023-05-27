package com.kozhanov.confectionerySite.service;

import com.kozhanov.confectionerySite.entity.Product;

import java.util.List;
import java.util.Map;

public interface ProductService {
    public List<Product> getAllProducts();
    public List<Product> filterProductsByParameters(Map<String, String> categories);
    public Product getByIdProduct(int id);
    public List<Product> getLastSellsProduct(int count);
}
