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

    @Transactional
    public Long create(PollutionReport r) {
        if (r.getDate() == null) r.setDate(new Date());
        if (r.getStatus() == null) r.setStatus("NEW");
        return (Long) this.hibernateTemplate.save(r);
    }

    public PollutionReport get(Long id) {
        return this.hibernateTemplate.get(PollutionReport.class, id);
    }

    public List<PollutionReport> all() {
        return (List<PollutionReport>) this.hibernateTemplate.find("from PollutionReport order by date desc");
    }

    public List<PollutionReport> byCitizen(Long citizenContactId) {
        return (List<PollutionReport>) this.hibernateTemplate.findByNamedParam(
            "from PollutionReport where citizenContactId=:cid order by date desc",
            "cid",
            citizenContactId
        );
    }


    @Transactional
    public void delete(Long id) {
        PollutionReport r = get(id);
        if (r != null) this.hibernateTemplate.delete(r);
    }

    @Transactional
    public void updateStatus(Long id, String status, String comment) {
        PollutionReport r = get(id);
        if (r != null) {
            r.setStatus(status);
            r.setAuthorityComment(comment);
            this.hibernateTemplate.update(r);
        }
    }

    public List<PollutionReport> unavailable() {
        // sample query pattern like ShowUnavailable* in InventoryWeb
        return (List<PollutionReport>) this.hibernateTemplate.find(
            "from PollutionReport where status='NEW'");
    }
}
