package com.kozhanov.confectionerySite.service.impl;

import com.kozhanov.confectionerySite.dao.SupplierDAO;
import com.kozhanov.confectionerySite.entity.Supplier;
import com.kozhanov.confectionerySite.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SupplierServiceImpl implements SupplierService {

    @Autowired
    SupplierDAO supplierDAO;


    @Override
    @Transactional
    public List<Supplier> getAllSupplier() {
        return supplierDAO.getAllSupplier();
    }
}
