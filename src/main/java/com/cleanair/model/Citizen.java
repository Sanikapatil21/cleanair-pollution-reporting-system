package com.cleanair.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "citizen")
public class Citizen {

    @Id
    private Long contact;     // primary key per spec
    private String name;
    private String address;
    private String email;
    private String password;

    public Citizen() {}

    // getters/setters
    public Long getContact() { return contact; }
    public void setContact(Long contact) { this.contact = contact; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
