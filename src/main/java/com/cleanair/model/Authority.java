package com.cleanair.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "authority")
public class Authority {

    @Id
    private Long contact; // PK
    private String name;
    private String department;
    private String email;
    private String password;

    public Authority() {}

    public Long getContact() { return contact; }
    public void setContact(Long contact) { this.contact = contact; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
