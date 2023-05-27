package com.kozhanov.confectionerySite.service.impl;

import com.kozhanov.confectionerySite.dao.CartItemDAO;
import com.kozhanov.confectionerySite.dao.ClientDAO;
import com.kozhanov.confectionerySite.dao.ProductDAO;
import com.kozhanov.confectionerySite.entity.CartItem;
import com.kozhanov.confectionerySite.entity.Client;
import com.kozhanov.confectionerySite.entity.Product;
import com.kozhanov.confectionerySite.service.CartItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CartItemServiceImpl implements CartItemService {

    @Autowired
    private CartItemDAO cartItemDAO;

    @Autowired
    private ClientDAO clientDAO;

    @Autowired
    private ProductDAO productDAO;

    @Override
    @Transactional
    public List<CartItem> getCartItemsByClient(Client client) {
        return cartItemDAO.findByClient(client);
    }

    @Override
    public CartItem getCartItemByClientAndProduct(Client client, Product product) {
        return cartItemDAO.findByClientAndProduct(client,product);
    }

    @Override
    @Transactional
    public void saveProductToCart(Client client, Product product, int quantity) {
        CartItem cartItem = cartItemDAO.findByClientAndProduct(client,product);

        if(cartItem==null){
            cartItem = new CartItem(client,product,quantity);
        }
        else{
            cartItem.setQuantity(cartItem.getQuantity()+quantity);
        }
        if(cartItem.getQuantity()<=0){
            cartItemDAO.removeCartItemOfCart(cartItem);
        }else
        cartItemDAO.saveCartItem(cartItem);



    }

    @Override
    public void saveCartItem(CartItem cartItem) {
        cartItemDAO.saveCartItem(cartItem);
    }

    @Override
    @Transactional
    public void saveProductToCart(int clientId, int productId, int quantity) {
        Client client = clientDAO.getClientById(clientId);
        Product product = productDAO.getProductbyId(productId);
        saveProductToCart(client, product, quantity);
    }

    @Override
    @Transactional
    public void removeProductFromCart(Client client, Product product) {
        CartItem cartItem = cartItemDAO.findByClientAndProduct(client,product);
        cartItemDAO.removeCartItemOfCart(cartItem);
    }
    @Override
    @Transactional
    public void removeCartItemFromCart(CartItem cartItem) {
        cartItemDAO.removeCartItemOfCart(cartItem);
    }


}
