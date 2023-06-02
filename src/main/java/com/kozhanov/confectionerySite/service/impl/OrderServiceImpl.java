package com.kozhanov.confectionerySite.service.impl;

import com.kozhanov.confectionerySite.dao.OrderDAO;
import com.kozhanov.confectionerySite.dao.OrderedProductDAO;
import com.kozhanov.confectionerySite.dto.OrderDTO;
import com.kozhanov.confectionerySite.entity.Order;
import com.kozhanov.confectionerySite.entity.OrderedProduct;
import com.kozhanov.confectionerySite.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private OrderedProductDAO orderedProductDAO;

    @Override
    @Transactional
    public List<OrderDTO> getAllOrder() {
        List<Order> orders = orderDAO.getAllOrders();
        List<OrderDTO> orderDtos = new ArrayList<>();
        for (Order order : orders) {
            OrderDTO dto = new OrderDTO();
            dto.setId(order.getId());
            dto.setClientName(order.getClient().getFullName());
            dto.setStatus(order.getStatus());
            dto.setTotalCost(order.getTotalCost());
            dto.setOrderDate(order.getOrderDate());
            List<OrderedProduct> orderedProducts =orderedProductDAO.getByOrder(order);


            for (OrderedProduct orderedProduct : orderedProducts) {
               dto.addInProductMap(orderedProduct.getProduct().getName(),orderedProduct.getQuantity());
            }


            orderDtos.add(dto);
        }

        return orderDtos;
    }
}
