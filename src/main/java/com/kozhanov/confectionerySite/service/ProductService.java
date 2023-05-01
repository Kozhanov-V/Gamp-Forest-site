package com.kozhanov.confectionerySite.service;

import com.kozhanov.confectionerySite.entity.Product;

import java.util.List;

public interface ProductService {
    public List<Product> getAllProducts();
    public List<Product> filterProductsByParameters(String price, boolean chizkeik, boolean naborChizkeik);
    public Product getByIdProduct(int id);
    public List<Product> getLastSellsProduct(int count);
    public List<Product> getLastSellsByUserId(int id);
}
