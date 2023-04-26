package com.kozhanov.confectionerySite.dao;

import com.kozhanov.confectionerySite.entity.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Employee getEmployeeByPhone(String phone) {
        Session session = sessionFactory.getCurrentSession();
        Employee employee = (Employee) session.createQuery("from Employee where phone = :phone").setParameter("phone",phone).list().get(0);
        return employee;
    }

    @Override
    public Employee getEmployeeByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Employee employee = (Employee) session.createQuery("from Employee where email = :email").setParameter("email",email).list().get(0);
        return employee;
    }

    @Override
    public Employee getEmployeeByLoginAndPassword(String login, String password) {
       Session session = sessionFactory.getCurrentSession();
        Query<Employee> query = session.createQuery("FROM Employee WHERE (phone = :login OR email = :login) AND password = :password");
        query.setParameter("login",login);
        query.setParameter("password",password);
        Employee employee;
        try{
            employee = query.getSingleResult();
        }catch (NoResultException e){
            employee =null;
        }
        return employee;
    }
}
