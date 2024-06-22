package com.kozhanov.confectionerySite.service;

import com.kozhanov.confectionerySite.entity.Employee;

import java.util.List;

public interface EmployeeService {
    public Employee getEmployeeByLoginAndPassword(String login,String passwod);
    public Employee getEmployeeByPhone(String username);
    public List<Employee> getAllEmployees();
    public void updateEmployee(Employee employee);
    public void deleteEmployees(int id);
}
