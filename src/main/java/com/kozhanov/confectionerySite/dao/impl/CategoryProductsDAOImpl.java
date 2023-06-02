package com.kozhanov.confectionerySite.dao.impl;

import com.kozhanov.confectionerySite.dao.CategoryProductsDAO;
import com.kozhanov.confectionerySite.entity.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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

    @Override
    public Category getByIdCategory(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Category> query = session.createQuery("from Category where id = :id");
        query.setParameter("id",id);
        Category category = query.getSingleResult();
        return category;
    }

    @Override
    public void updateCategory(Category category) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(category);
    }

    @Override
    public void deleteCategory(int id) {
        Session session = sessionFactory.getCurrentSession();
        session.remove(getByIdCategory(id));
    }
}
