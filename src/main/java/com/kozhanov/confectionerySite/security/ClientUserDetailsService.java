package com.kozhanov.confectionerySite.security;

import com.kozhanov.confectionerySite.dao.ClientDAO;
import com.kozhanov.confectionerySite.entity.Client;
import com.kozhanov.confectionerySite.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class ClientUserDetailsService implements UserDetailsService {

    @Autowired
    ClientDAO clientDAO;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Client client;

        // Проверка на то, является ли строка e-mail
        if (username.contains("@")) {
            client = clientDAO.getClientByEmail(username);
        } else {
            client = clientDAO.getClientByPhone(username);
        }

        if (client == null) {
            throw new UsernameNotFoundException("Employee not found with username: " + username);
        }

        return new ClientUserDetails(client);
    }
}
