package com.kozhanov.confectionerySite.service;

import com.kozhanov.confectionerySite.dao.EmployeeDAO;
import com.kozhanov.confectionerySite.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EmployeeServiceImpl implements EmployeeService{

    @Autowired
    EmployeeDAO employeeDAO;

    @Override
    @Transactional
    public Employee getEmployeeByLoginAndPassword(String login,String password) {
        return employeeDAO.getEmployeeByLoginAndPassword(login,password);
    }

    @Override
    public Employee getEmployeeByPhone(String username) {
        return employeeDAO.getEmployeeByPhone(username);
    }
}
