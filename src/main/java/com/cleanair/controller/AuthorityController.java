package com.cleanair.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cleanair.dao.AuthorityDao;
import com.cleanair.dao.PollutionReportDao;
import com.cleanair.model.Authority;

@Controller
@RequestMapping("/authority")
public class AuthorityController {

    @Autowired private AuthorityDao authorityDao;
    @Autowired private PollutionReportDao reportDao;

    // -------- Login Form --------
    @GetMapping("/login")
    public String loginForm() {
        return "authority/login";
    }

    // -------- Handle Login --------
    @PostMapping("/login")
    public String doLogin(HttpServletRequest req, Model m) {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Authority a = authorityDao.login(email, password);
        if (a == null) {
            m.addAttribute("error", "Invalid credentials");
            return "authority/login";
        }

        // ✅ Always load fresh reports
        m.addAttribute("authority", a);
        m.addAttribute("reports", reportDao.all());
        return "authority/reports";
    }

    // -------- Reports List --------
    @GetMapping("/reports")
    public String allReports(Model m) {
        // ✅ fetch fresh list every time
        m.addAttribute("reports", reportDao.all());
        return "authority/reports";
    }

    // -------- Update Report Status --------
    @PostMapping("/report/update")
    public String updateStatus(HttpServletRequest req, Model m) {
        Long id = Long.valueOf(req.getParameter("id"));
        String status = req.getParameter("status");
        String comment = req.getParameter("comment");

        // ✅ Update in DB
        reportDao.updateStatus(id, status, comment);

        // ✅ Always reload reports
        m.addAttribute("reports", reportDao.all());
        return "authority/reports";
    }
}
