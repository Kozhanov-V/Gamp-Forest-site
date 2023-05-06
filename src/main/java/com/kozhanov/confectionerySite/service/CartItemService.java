package com.kozhanov.confectionerySite.service;

import com.kozhanov.confectionerySite.entity.CartItem;
import com.kozhanov.confectionerySite.entity.Client;
import com.kozhanov.confectionerySite.entity.Product;

import java.util.List;

public interface CartItemService {

    public List<CartItem> getCartItemsByClient(Client client);
    public CartItem getCartItemByClientAndProduct(Client client,Product product);
    public void saveProductToCart(Client client, Product product, int quantity);
    public void saveCartItem(CartItem cartItem);
    public void saveProductToCart(int clientId, int productId, int quantity);
    public void removeProductFromCart(Client client, Product product);
    public void removeCartItemFromCart(CartItem cartItem);

}
