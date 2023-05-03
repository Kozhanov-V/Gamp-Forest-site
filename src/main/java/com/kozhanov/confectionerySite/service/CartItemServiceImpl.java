package com.kozhanov.confectionerySite.service;

import com.kozhanov.confectionerySite.dao.CartItemDAO;
import com.kozhanov.confectionerySite.entity.CartItem;
import com.kozhanov.confectionerySite.entity.Client;
import com.kozhanov.confectionerySite.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CartItemServiceImpl implements CartItemService{

    @Autowired
    private CartItemDAO cartItemDAO;

    @Override
    @Transactional
    public List<CartItem> getCartItemsByClient(Client client) {
        return cartItemDAO.findByClient(client);
    }

    @Override
    @Transactional
    public void addProductToCart(Client client, Product product, int quantity) {
        CartItem cartItem = cartItemDAO.findByClientAndProduct(client,product);
        cartItemDAO.saveCartItem(cartItem);

    }

    @Override
    @Transactional
    public void removeProductFromCart(Client client, Product product) {
        CartItem cartItem = cartItemDAO.findByClientAndProduct(client,product);
        cartItemDAO.removeCartItemOfCart(cartItem);
    }
}
