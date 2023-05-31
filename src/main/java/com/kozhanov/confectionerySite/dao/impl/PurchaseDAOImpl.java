package com.kozhanov.confectionerySite.dao.impl;

import com.kozhanov.confectionerySite.dao.PurchaseDAO;
import com.kozhanov.confectionerySite.entity.Purchase;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PurchaseDAOImpl implements PurchaseDAO {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<Purchase> getAllPurchase() {
        Session session = sessionFactory.getCurrentSession();
        Query<Purchase> query = session.createQuery("from Purchase ");
        List<Purchase> purchaseList = query.getResultList();
        return purchaseList;
    }
}
