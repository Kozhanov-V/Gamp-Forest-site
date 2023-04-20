package com.kozhanov.confectionerySite.service;

import com.kozhanov.confectionerySite.dao.ProductDAO;
import com.kozhanov.confectionerySite.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    ProductDAO productDAO;

    @Transactional
    @Override
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    @Override
    @Transactional
    public List<Product> filterProductsByParameters(String price, boolean chizkeik, boolean naborChizkeik) {
        String[] priceRange = price.split(" - ");

        String minPriceStr = priceRange[0].replaceAll("[^\\d.]", "").trim();
        String maxPriceStr = priceRange[1].replaceAll("[^\\d.]", "").trim();

        BigDecimal minPrice = new BigDecimal(minPriceStr);
        BigDecimal maxPrice = new BigDecimal(maxPriceStr);

        // Получаем все продукты
        List<Product> allProducts = productDAO.getAllProducts();

        // Фильтруем продукты по заданным параметрам
        List<Product> filteredProducts = allProducts.stream()
                .filter(product -> product.getPrice().compareTo(minPrice) >= 0 && product.getPrice().compareTo(maxPrice) <= 0)
                .filter(product -> {
                    if (chizkeik && naborChizkeik) {
                        return product.getCategory().getId() == 1 || product.getCategory().getId() == 2;
                    } else if (chizkeik) {
                        return product.getCategory().getId() == 1;
                    } else if (naborChizkeik) {
                        return product.getCategory().getId() == 2;
                    } else {
                        return true;
                    }
                })
                .collect(Collectors.toList());
        for (Product item:
                filteredProducts) {
            System.out.println(item);
        }
        return filteredProducts;

    }

}
