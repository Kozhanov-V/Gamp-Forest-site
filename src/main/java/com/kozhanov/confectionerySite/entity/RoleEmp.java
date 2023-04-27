package com.kozhanov.confectionerySite.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "role_employees")
public class RoleEmp {
    @Id
    @Column(name = "id")
    private int id;
    @Column(name = "name")
    private String name;

    @ManyToMany(mappedBy = "roles")
    private List<Employee> employees;

    public RoleEmp() {
    }

    public RoleEmp(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
