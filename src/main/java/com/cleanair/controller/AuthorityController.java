package com.cleanair.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cleanair.dao.AuthorityDao;
import com.cleanair.dao.PollutionReportDao;
import com.cleanair.model.Authority;

@Controller
@RequestMapping("/authority")
public class AuthorityController {

    @Autowired private AuthorityDao authorityDao;
    @Autowired private PollutionReportDao reportDao;

    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String loginForm() {
        return "authority/login";
    }

    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String doLogin(HttpServletRequest req, Model m) {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        Authority a = authorityDao.login(email, password);
        if (a == null) {
            m.addAttribute("error", "Invalid credentials");
            return "authority/login";
        }
        m.addAttribute("authority", a);
        m.addAttribute("reports", reportDao.all());
        return "authority/reports";
    }

    @RequestMapping(value="/report/update", method=RequestMethod.POST)
    public String updateStatus(HttpServletRequest req, Model m) {
        Long id = Long.valueOf(req.getParameter("id"));
        String status = req.getParameter("status");
        String comment = req.getParameter("comment");
        reportDao.updateStatus(id, status, comment);
        m.addAttribute("reports", reportDao.all());
        return "authority/reports";
    }
}
