package com.kozhanov.confectionerySite.dao;

import com.kozhanov.confectionerySite.entity.Category;

import java.util.List;

public interface CategoryProductsDAO {
    public List<Category> getAllCategory();
    public Category getByIdCategory(int id);
    public void updateCategory(Category category);
    public void deleteCategory(int id);
}
