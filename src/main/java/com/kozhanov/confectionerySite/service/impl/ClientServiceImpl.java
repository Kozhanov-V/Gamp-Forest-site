package com.kozhanov.confectionerySite.service.impl;

import com.kozhanov.confectionerySite.dao.ClientDAO;
import com.kozhanov.confectionerySite.entity.Client;
import com.kozhanov.confectionerySite.entity.Employee;
import com.kozhanov.confectionerySite.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ClientServiceImpl implements ClientService {

    @Autowired
    ClientDAO clientDAO;

    @Override
    @Transactional
    public Client getClientByPhone(String username) {
        return clientDAO.getClientByPhone( username);
    }

    @Override
    @Transactional
    public void updateClient(Client client) {
        clientDAO.updateClient(client);
    }

    @Override
    @Transactional
    public List<Client> getAllClients() {
        return clientDAO.getAllClients();
    }
}
