package com.cleanair.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cleanair.model.Authority;

@Component
public class AuthorityDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Transactional
    public void save(Authority a) {
        this.hibernateTemplate.saveOrUpdate(a);
    }

    public Authority get(Long contact) {
        return this.hibernateTemplate.get(Authority.class, contact);
    }

    public List<Authority> all() {
        return (List<Authority>) this.hibernateTemplate.find("from Authority");
    }

    @Transactional
    public void delete(Long contact) {
        Authority a = get(contact);
        if (a != null) this.hibernateTemplate.delete(a);
    }

    public Authority login(String email, String password) {
        @SuppressWarnings("deprecation")
		List<Authority> list = (List<Authority>) this.hibernateTemplate.findByNamedParam(
            "from Authority where email=:email and password=:password",
            new String[] { "email", "password" },
            new Object[] { email, password }
        );
        return list.isEmpty() ? null : list.get(0);
    }
}