package com.kozhanov.confectionerySite.service;

import com.kozhanov.confectionerySite.entity.Client;

public interface ClientService {
    public Client getClientByPhone(String username);
    public void updateClient(Client client);
}
