package com.cleanair.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cleanair.dao.AuthorityDao;
import com.cleanair.dao.CitizenDao;
import com.cleanair.dao.PollutionReportDao;
import com.cleanair.model.Authority;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired private AuthorityDao authorityDao;
    @Autowired private CitizenDao citizenDao;
    @Autowired private PollutionReportDao reportDao;

    @RequestMapping("/dashboard")
    public String dashboard(Model m) {
        m.addAttribute("citizens", citizenDao.all());
        m.addAttribute("authorities", authorityDao.all());
        m.addAttribute("reports", reportDao.all());
        return "admin/dashboard";
    }

    @RequestMapping(value="/authority/new", method=RequestMethod.GET)
    public String addAuthorityForm() {
        return "admin/addAuthority";
    }

    @RequestMapping(value="/authority/new", method=RequestMethod.POST)
    public String addAuthority(HttpServletRequest req) {
        Authority a = new Authority();
        a.setContact(Long.valueOf(req.getParameter("contact")));
        a.setName(req.getParameter("name"));
        a.setDepartment(req.getParameter("department"));
        a.setEmail(req.getParameter("email"));
        a.setPassword(req.getParameter("password"));
        authorityDao.save(a);
        return "redirect:/admin/authorities";
    }

    @RequestMapping("/authorities")
    public String listAuthorities(Model m) {
        List<Authority> list = authorityDao.all();
        m.addAttribute("authorities", list);
        return "admin/listAuthorities";
    }
}
