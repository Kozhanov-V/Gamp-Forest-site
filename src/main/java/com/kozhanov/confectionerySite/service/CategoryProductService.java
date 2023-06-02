package com.kozhanov.confectionerySite.service;

import com.kozhanov.confectionerySite.entity.Category;

import java.util.List;

public interface CategoryProductService {
    public List<Category> getAllCategoriesProducts();
    public Category getByIdCategory(int id);
    public void updateCategory(Category category);
    public void deleteCategory(int id);
}
