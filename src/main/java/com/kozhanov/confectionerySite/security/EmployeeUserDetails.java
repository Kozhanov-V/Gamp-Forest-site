package com.kozhanov.confectionerySite.security;

import com.kozhanov.confectionerySite.entity.Employee;
import com.kozhanov.confectionerySite.entity.RoleEmp;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class EmployeeUserDetails implements UserDetails {
    private Employee employee;
    public EmployeeUserDetails(Employee employee) {
        this.employee = employee;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (RoleEmp role : employee.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(role.getName()));
        }
        return authorities;
    }

    @Override
    public String getPassword() {
        return employee.getPassword();
    }

    @Override
    public String getUsername() {
        return employee.getPhone();
    }

    @Override
    public boolean isAccountNonExpired() {
        return employee.isEnabled();
    }

    @Override
    public boolean isAccountNonLocked() {
        return employee.isEnabled();
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return employee.isEnabled();
    }

    @Override
    public boolean isEnabled() {
        return employee.isEnabled();
    }
}
