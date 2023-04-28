package com.kozhanov.confectionerySite.security;

import com.kozhanov.confectionerySite.dao.EmployeeDAO;
import com.kozhanov.confectionerySite.entity.Employee;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class EmployeeUserDetailsService implements UserDetailsService {

    @Autowired
    EmployeeDAO employeeDAO;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Employee employee;

        // Проверка на то, является ли строка e-mail
        if (username.contains("@")) {
            employee = employeeDAO.getEmployeeByEmail(username);
        } else {
            employee = employeeDAO.getEmployeeByPhone(username);
        }

        if (employee == null) {
            throw new UsernameNotFoundException("Employee not found with username: " + username);
        }

        return new EmployeeUserDetails(employee);
    }
}
