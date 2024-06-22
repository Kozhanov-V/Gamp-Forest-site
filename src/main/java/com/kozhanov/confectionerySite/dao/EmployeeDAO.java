package com.kozhanov.confectionerySite.dao;

import com.kozhanov.confectionerySite.entity.Employee;

import java.util.List;

public interface EmployeeDAO {
    public Employee getEmployeeByPhone(String phone);
    public Employee getEmployeeById(int id);
    public Employee getEmployeeByEmail(String email);
    public Employee getEmployeeByLoginAndPassword(String login,String password);
    public List<Employee> getAllEmployee();
    public void updateEmployee(Employee employee);
    public void deleteEmployee(int id);
}
