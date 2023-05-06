package com.kozhanov.confectionerySite.dao;

import com.kozhanov.confectionerySite.entity.Employee;
import com.kozhanov.confectionerySite.entity.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderedProductDAOImpl implements OrderedProductDAO{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Product> getSellsByUser(int clientId, int count) {
        Session session = sessionFactory.getCurrentSession();
        Query<Product> query = session.createQuery("SELECT o.product FROM OrderedProduct o WHERE o.order.client.id = :clientId GROUP BY o.product ORDER BY MAX(o.order.orderDate) DESC");
        query.setParameter("clientId", clientId);
        query.setMaxResults(count);

        return query.getResultList();
    }

}
