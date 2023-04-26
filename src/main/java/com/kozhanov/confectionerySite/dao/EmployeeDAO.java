package com.kozhanov.confectionerySite.dao;

import com.kozhanov.confectionerySite.entity.Employee;

public interface EmployeeDAO {
    public Employee getEmployeeByPhone(String phone);
    public Employee getEmployeeByEmail(String email);
    public Employee getEmployeeByLoginAndPassword(String login,String password);
}
