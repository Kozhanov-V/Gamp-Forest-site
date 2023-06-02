package com.kozhanov.confectionerySite.service.impl;

import com.kozhanov.confectionerySite.dao.CategoryProductsDAO;
import com.kozhanov.confectionerySite.entity.Category;
import com.kozhanov.confectionerySite.service.CategoryProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CategoryProductServiceImpl implements CategoryProductService {

    @Autowired
    CategoryProductsDAO categoryProductsDAO;

    @Override
    @Transactional
    public List<Category> getAllCategoriesProducts() {
        return categoryProductsDAO.getAllCategory();
    }

    @Override
    @Transactional
    public Category getByIdCategory(int id) {
        return categoryProductsDAO.getByIdCategory(id);
    }

    @Override
    @Transactional
    public void updateCategory(Category category) {
        categoryProductsDAO.updateCategory(category);
    }

    @Override
    @Transactional
    public void deleteCategory(int id) {
        categoryProductsDAO.deleteCategory(id);
    }
}
