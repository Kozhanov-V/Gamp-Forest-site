package com.kozhanov.confectionerySite.dao.impl;

import com.kozhanov.confectionerySite.dao.SupplierDAO;
import com.kozhanov.confectionerySite.entity.Supplier;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SupplierDAOImpl implements SupplierDAO {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<Supplier> getAllSupplier() {
        Session session = sessionFactory.getCurrentSession();
        Query<Supplier> query = session.createQuery("from Supplier");
        List<Supplier> supplierList = query.getResultList();
        return supplierList;
    }
}
