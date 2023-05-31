package com.kozhanov.confectionerySite.service.impl;

import com.kozhanov.confectionerySite.dao.PurchaseDAO;
import com.kozhanov.confectionerySite.entity.Purchase;
import com.kozhanov.confectionerySite.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PurchaseServiceImpl implements PurchaseService {
    @Autowired
    private PurchaseDAO purchaseDAO;
    @Override
    @Transactional
    public List<Purchase> getAllPurchase() {
        return purchaseDAO.getAllPurchase();
    }
}
