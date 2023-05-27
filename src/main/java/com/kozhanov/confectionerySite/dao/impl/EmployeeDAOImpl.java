package com.kozhanov.confectionerySite.dao.impl;

import com.kozhanov.confectionerySite.dao.EmployeeDAO;
import com.kozhanov.confectionerySite.entity.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import java.util.List;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public Employee getEmployeeByPhone(String phone) {
        Session session = sessionFactory.getCurrentSession();
        Employee employee;
        try{
            employee = (Employee) session.createQuery("from Employee where phone = :phone").setParameter("phone",phone).list().get(0);
        }catch (NoResultException e){
            employee =null;
        }
        return employee;
    }

    @Override
    @Transactional
    public Employee getEmployeeByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Employee employee;
        try{
            employee = (Employee) session.createQuery("from Employee where email = :email").setParameter("email",email).list().get(0);
        }catch (NoResultException e){
            employee =null;
        }

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

    @Override
    public List<Employee> getAllEmployee() {
        Session session = sessionFactory.getCurrentSession();
        Query<Employee> query = session.createQuery("FROM Employee");
        List<Employee> employeeList = query.getResultList();
        return employeeList;
    }
}
