package com.cleanair.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cleanair.dao.CitizenDao;
import com.cleanair.dao.PollutionReportDao;
import com.cleanair.model.Citizen;
import com.cleanair.model.PollutionReport;

@Controller
@RequestMapping("/citizen")
public class CitizenController {

    @Autowired private CitizenDao citizenDao;
    @Autowired private PollutionReportDao reportDao;

    @RequestMapping(value="/register", method=RequestMethod.GET)
    public String registerForm() {
        return "citizen/register";
    }

    @RequestMapping(value="/register", method=RequestMethod.POST)
    public String register(HttpServletRequest req) {
        Citizen c = new Citizen();
        c.setContact(Long.valueOf(req.getParameter("contact")));
        c.setName(req.getParameter("name"));
        c.setAddress(req.getParameter("address"));
        c.setEmail(req.getParameter("email"));
        c.setPassword(req.getParameter("password"));
        citizenDao.save(c);
        return "redirect:/citizen/login";
    }

    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String loginForm() {
        return "citizen/login";
    }

    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String doLogin(HttpServletRequest req, Model m) {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        Citizen c = citizenDao.login(email, password);
        if (c == null) {
            m.addAttribute("error", "Invalid credentials");
            return "citizen/login";
        }
        // Show reports page after login
        m.addAttribute("citizen", c);
        m.addAttribute("reports", reportDao.byCitizen(c.getContact()));
        return "citizen/reports";
    }

    @RequestMapping(value="/report/new", method=RequestMethod.GET)
    public String newReportForm(HttpServletRequest req, Model m) {
        String contactStr = req.getParameter("contact");
        if (contactStr != null) {
            m.addAttribute("citizenContactId", contactStr);
        }
        return "citizen/addReport";
    }



    @RequestMapping(value="/report/new", method=RequestMethod.POST)
    public String createReport(HttpServletRequest req, Model m) {
        Long citizenContact = Long.valueOf(req.getParameter("citizenContactId"));
        PollutionReport r = new PollutionReport();
        r.setCitizenContactId(citizenContact);
        r.setLocation(req.getParameter("location"));
        r.setPollutionType(req.getParameter("pollutionType"));
        r.setDescription(req.getParameter("description"));
        r.setDate(new Date());
        r.setStatus("NEW");
        reportDao.create(r);

        // Fetch citizen again and add to model
        Citizen c = citizenDao.get(citizenContact);
        m.addAttribute("citizen", c);
        m.addAttribute("reports", reportDao.byCitizen(citizenContact));

        return "citizen/reports";
    }


    @RequestMapping(value="/report/delete", method=RequestMethod.POST)
    public String deleteReport(HttpServletRequest req, Model m) {
        Long id = Long.valueOf(req.getParameter("id"));
        Long citizenContact = Long.valueOf(req.getParameter("citizenContactId"));
        reportDao.delete(id);

        Citizen c = citizenDao.get(citizenContact);
        m.addAttribute("citizen", c);
        m.addAttribute("reports", reportDao.byCitizen(citizenContact));

        return "citizen/reports";
    }

}
