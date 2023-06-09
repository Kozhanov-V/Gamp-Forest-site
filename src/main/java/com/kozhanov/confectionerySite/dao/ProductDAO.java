package com.kozhanov.confectionerySite.dao;

import com.kozhanov.confectionerySite.entity.Product;

import java.util.List;

public interface ProductDAO {

    public List<Product> getAllProducts();
    public Product getProductbyId(int id);
    public List<Product>getLastSellsProduct(int count);
    public void deleteProduct(int id);
    public void updateProduct(Product product);

}
