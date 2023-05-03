package com.kozhanov.confectionerySite.dao;

import com.kozhanov.confectionerySite.entity.CartItem;
import com.kozhanov.confectionerySite.entity.Client;
import com.kozhanov.confectionerySite.entity.Product;

import java.util.List;

public interface CartItemDAO {
   public List<CartItem> findByClient(Client client);
   public CartItem findByClientAndProduct(Client client, Product product);
   public void removeCartItemOfCart(CartItem cartItem);
   public void saveCartItem(CartItem cartItem);
}
