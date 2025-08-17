package com.cleanair.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cleanair.model.Citizen;

@Component
public class CitizenDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Transactional
    public void save(Citizen c) {
        this.hibernateTemplate.saveOrUpdate(c);
    }

    public Citizen get(Long contact) {
        return this.hibernateTemplate.get(Citizen.class, contact);
    }

    @SuppressWarnings("deprecation")
	public List<Citizen> all() {
        return (List<Citizen>) this.hibernateTemplate.find("from Citizen");
    }

    @Transactional
    public void delete(Long contact) {
        Citizen c = get(contact);
        if (c != null) this.hibernateTemplate.delete(c);
    }

    public Citizen login(String email, String password) {
        List<Citizen> list = (List<Citizen>) this.hibernateTemplate.findByNamedParam(
            "from Citizen where email=:email and password=:password",
            new String[] {"email", "password"},
            new Object[] {email, password}
        );
        return list.isEmpty() ? null : list.get(0);
    }

}
