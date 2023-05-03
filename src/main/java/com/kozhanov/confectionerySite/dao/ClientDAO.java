package com.kozhanov.confectionerySite.dao;

import com.kozhanov.confectionerySite.entity.Client;
import com.kozhanov.confectionerySite.entity.Employee;

public interface ClientDAO {
    public Client getClientByPhone(String phone);
    public Client getClientById(int id);
    public Client getClientByEmail(String email);
    public Client getClientByLoginAndPassword(String login,String password);
    public void updateClient(Client client);
}
