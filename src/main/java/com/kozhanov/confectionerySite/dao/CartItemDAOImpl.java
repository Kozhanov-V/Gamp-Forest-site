package com.kozhanov.confectionerySite.dao;

import com.kozhanov.confectionerySite.entity.CartItem;
import com.kozhanov.confectionerySite.entity.Client;
import com.kozhanov.confectionerySite.entity.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import java.util.List;

@Repository
public class CartItemDAOImpl implements CartItemDAO{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<CartItem> findByClient(Client client) {

        Session session = sessionFactory.getCurrentSession();
           List<CartItem> cartItemsByClient = session.createQuery("from CartItem where client = :client").setParameter("client",client).getResultList();


        return cartItemsByClient;
    }

    @Override
    public CartItem findByClientAndProduct(Client client, Product product) {
        Session session = sessionFactory.getCurrentSession();
        CartItem cartItem = (CartItem) session.createQuery("from CartItem  where client= :client and product=:product").setParameter("client",client).setParameter("product",product).getSingleResult();
        return cartItem;
    }

    @Override
    public void removeCartItemOfCart(CartItem cartItem) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(cartItem);
    }



    @Override
    public void saveCartItem(CartItem cartItem) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(cartItem);
    }
}
