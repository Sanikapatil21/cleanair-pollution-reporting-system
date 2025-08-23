package com.cleanair.dao;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.cleanair.model.PollutionReport;

@Component
public class PollutionReportDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    // -------- Create Report --------
    @Transactional
    public Long create(PollutionReport r) {
        if (r.getDate() == null) {
            r.setDate(new Date()); // ✅ always set date if not given
        }
        if (r.getStatus() == null || r.getStatus().trim().isEmpty()) {
            r.setStatus("NEW");   // ✅ default status
        }
        Long id = (Long) this.hibernateTemplate.save(r);
        this.hibernateTemplate.flush(); // ✅ ensure immediate write to DB
        return id;
    }

    // -------- Get by ID --------
    public PollutionReport get(Long id) {
        return this.hibernateTemplate.get(PollutionReport.class, id);
    }

    // -------- All Reports --------
    @SuppressWarnings("unchecked")
    public List<PollutionReport> all() {
        return (List<PollutionReport>) this.hibernateTemplate.find(
            "from PollutionReport order by date desc"
        );
    }

    // -------- Reports by Citizen --------
    @SuppressWarnings("unchecked")
    public List<PollutionReport> byCitizen(Long citizenContactId) {
        return (List<PollutionReport>) this.hibernateTemplate.findByNamedParam(
            "from PollutionReport where citizenContactId = :cid order by date desc",
            "cid",
            citizenContactId
        );
    }

    // -------- Delete Report --------
    @Transactional
    public void delete(Long id) {
        PollutionReport r = get(id);
        if (r != null) {
            this.hibernateTemplate.delete(r);
            this.hibernateTemplate.flush(); // ✅ force commit
        }
    }

    // -------- Update Report Status --------
    @Transactional
    public void updateStatus(Long id, String status, String comment) {
        PollutionReport r = get(id);
        if (r != null) {
            r.setStatus(status);
            r.setAuthorityComment(comment);
            this.hibernateTemplate.update(r);
            this.hibernateTemplate.flush(); // ✅ force commit
        }
    }

    // -------- Reports pending review --------
    @SuppressWarnings("unchecked")
    public List<PollutionReport> unavailable() {
        return (List<PollutionReport>) this.hibernateTemplate.find(
            "from PollutionReport where status = 'NEW' order by date desc"
        );
    }
}
