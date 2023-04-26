package com.kozhanov.confectionerySite.service;

import com.kozhanov.confectionerySite.entity.Employee;

public interface EmployeeService {
    public Employee getEmployeeByLoginAndPassword(String login,String passwod);
}
