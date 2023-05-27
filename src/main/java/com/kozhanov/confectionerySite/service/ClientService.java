package com.kozhanov.confectionerySite.service;

import com.kozhanov.confectionerySite.entity.Client;

import java.util.List;

public interface ClientService {
    public Client getClientByPhone(String username);
    public void updateClient(Client client);
    public List<Client> getAllClients();
}
