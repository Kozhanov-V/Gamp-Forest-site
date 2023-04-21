package com.kozhanov.confectionerySite.dao;

import com.kozhanov.confectionerySite.entity.OrderedProduct;
import com.kozhanov.confectionerySite.entity.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductDAOImpl implements ProductDAO{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Product> getAllProducts() {
        Session session = sessionFactory.getCurrentSession();
        List<Product> productList = session.createQuery("from Product").getResultList();
        return productList;
    }

    @Override
    public Product getProductbyId(int id) {
        Session session = sessionFactory.getCurrentSession();
        Product product = session.get(Product.class,id);
        return product;
    }

    @Override
    public List<Product> getLastSellsProduct(int count) {
        Session session = sessionFactory.getCurrentSession();

        List<Product> productList = session.createQuery("SELECT p FROM Product p WHERE p.id IN (SELECT DISTINCT op.product.id FROM OrderedProduct op ORDER BY op.id DESC)", Product.class)
                .setMaxResults(count).getResultList();

        return productList;
    }


}
