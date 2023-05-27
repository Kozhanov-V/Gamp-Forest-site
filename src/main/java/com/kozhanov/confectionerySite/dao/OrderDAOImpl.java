package com.kozhanov.confectionerySite.dao;

import com.kozhanov.confectionerySite.entity.Order;
import com.kozhanov.confectionerySite.entity.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDAOImpl implements OrderDAO{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Order> getAllOrders() {
        Session session = sessionFactory.getCurrentSession();
        Query<Order> query = session.createQuery("FROM Order");
        List<Order> allOrders = query.getResultList();
        return allOrders;
    }
}
