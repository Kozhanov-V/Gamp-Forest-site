package com.kozhanov.confectionerySite.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "authorities")
public class Authorities {
    @Id
    @Column(name = "id_user")
    private int idUser;

    @Column(name = "id_authority")
    private int idAuthority;

    public Authorities() {
    }

    public Authorities(int idUser, int idAuthority) {
        this.idUser = idUser;
        this.idAuthority = idAuthority;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdAuthority() {
        return idAuthority;
    }

    public void setIdAuthority(int idAuthority) {
        this.idAuthority = idAuthority;
    }
}
