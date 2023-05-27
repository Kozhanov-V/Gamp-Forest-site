package com.kozhanov.confectionerySite.dao.impl;

import com.kozhanov.confectionerySite.dao.CategoryProductsDAO;
import com.kozhanov.confectionerySite.entity.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CategoryProductsDAOImpl implements CategoryProductsDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Category> getAllCategory() {
        Session session = sessionFactory.getCurrentSession();
        List<Category> categories = session.createQuery("from Category").getResultList();
        return categories;
    }
}
