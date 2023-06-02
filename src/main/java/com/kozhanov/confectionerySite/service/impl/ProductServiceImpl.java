package com.kozhanov.confectionerySite.service.impl;

import com.kozhanov.confectionerySite.dao.ProductDAO;
import com.kozhanov.confectionerySite.entity.Product;
import com.kozhanov.confectionerySite.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductDAO productDAO;

    @Transactional
    @Override
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    @Override
    @Transactional
    public List<Product> filterProductsByParameters(Map<String, String> categories) {
        String[] priceRange = categories.get("price").split(" - ");

        String minPriceStr = priceRange[0].replaceAll("[^\\d.]", "").trim();
        String maxPriceStr = priceRange[1].replaceAll("[^\\d.]", "").trim();

        BigDecimal minPrice = new BigDecimal(minPriceStr);
        BigDecimal maxPrice = new BigDecimal(maxPriceStr);

        // Получаем все продукты
        List<Product> allProducts = productDAO.getAllProducts();
        int i =0;
        List<String> categoriesName = new ArrayList<>();
        for (Map.Entry<String, String> employee : categories.entrySet()) {
            if(i==0){
                i++;
                continue;
            }
            categoriesName.add(employee.getKey());

        }
        // Фильтруем продукты по заданным параметрам
        List<Product> filteredProducts = allProducts.stream()
                .filter(product -> product.getPrice().compareTo(minPrice) >= 0 && product.getPrice().compareTo(maxPrice) <= 0)
                .filter(product -> {
                   if(categoriesName.isEmpty()){
                       return true;
                   }else {
                   return categoriesName.contains(product.getCategory().getName());
                   }
                })
                .collect(Collectors.toList());
        for (Product item:
                filteredProducts) {
            System.out.println(item);
        }
        return filteredProducts;

    }

    @Override
    @Transactional
    public Product getByIdProduct(int id) {
        return productDAO.getProductbyId(id);
    }

    @Override
    @Transactional
    public List<Product> getLastSellsProduct(int count) {
        return productDAO.getLastSellsProduct(count);
    }

    @Override
    @Transactional
    public void deleteProduct(int id) {
        productDAO.deleteProduct(id);
    }

    @Override
    @Transactional
    public void updateProduct(Product product) {
        productDAO.updateProduct(product);
    }


}
