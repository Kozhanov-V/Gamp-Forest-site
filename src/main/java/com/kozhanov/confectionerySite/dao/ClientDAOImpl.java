package com.kozhanov.confectionerySite.dao;


import com.kozhanov.confectionerySite.entity.Client;
import com.kozhanov.confectionerySite.entity.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;

@Repository
public class ClientDAOImpl implements ClientDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public Client getClientByPhone(String phone) {
        Session session = sessionFactory.getCurrentSession();
        Client client;
        try{
            client = (Client) session.createQuery("from Client where phone = :phone").setParameter("phone",phone).getSingleResult();
        }catch (NoResultException e){
            client =null;
        }

        return client;
    }

    @Override
    @Transactional
    public Client getClientByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Client client;
        try{
            client = (Client) session.createQuery("from Client where email = :email").setParameter("email",email).getSingleResult();
        }catch (NoResultException e){
            client =null;
        }

        return client;
    }

    @Override
    public Client getClientByLoginAndPassword(String login, String password) {
        Session session = sessionFactory.getCurrentSession();
        Query<Client> query = session.createQuery("FROM Client WHERE (phone = :login OR email = :login) AND password = :password");
        query.setParameter("login",login);
        query.setParameter("password",password);
        Client client;
        try{
            client = query.getSingleResult();
        }catch (NoResultException e){
            client =null;
        }
        return client;
    }
}
