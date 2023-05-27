package com.kozhanov.confectionerySite.service;

import com.kozhanov.confectionerySite.dto.OrderDTO;

import java.util.List;

public interface OrderService {
    public List<OrderDTO> getAllOrder();
}
