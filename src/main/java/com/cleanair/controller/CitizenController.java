package com.cleanair.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cleanair.dao.CitizenDao;
import com.cleanair.dao.PollutionReportDao;
import com.cleanair.model.Citizen;
import com.cleanair.model.PollutionReport;

@Controller
@RequestMapping("/citizen")
public class CitizenController {

    @Autowired
    private CitizenDao citizenDao;

    @Autowired
    private PollutionReportDao reportDao;

    // -------- Citizen Registration --------
    @RequestMapping(value="/register", method=RequestMethod.GET)
    public String registerForm() {
        return "citizen/register";
    }

    @RequestMapping(value="/register", method=RequestMethod.POST)
    public String register(HttpServletRequest req) {
        Citizen c = new Citizen();
        String contactStr = req.getParameter("contact");
        if (contactStr != null && !contactStr.isEmpty()) {
            c.setContact(Long.valueOf(contactStr));
        }
        c.setName(req.getParameter("name"));
        c.setAddress(req.getParameter("address"));
        c.setEmail(req.getParameter("email"));
        c.setPassword(req.getParameter("password"));
        citizenDao.save(c);
        return "redirect:/citizen/login";
    }

    // -------- Citizen Login --------
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
        m.addAttribute("citizen", c);
        m.addAttribute("reports", reportDao.byCitizen(c.getContact()));
        return "citizen/reports";
    }

    // -------- Add New Report (Form) --------
    @RequestMapping(value="/report/new", method=RequestMethod.GET)
    public String newReportForm(HttpServletRequest req, Model m) {
        String contactStr = req.getParameter("contact");
        if (contactStr != null) {
            m.addAttribute("citizenContactId", contactStr);
        }
        return "citizen/addReport";
    }

    // -------- Add New Report (Submit with optional image) --------
    @RequestMapping(value="/report/new", method=RequestMethod.POST)
    public String createReport(HttpServletRequest req,
                               @RequestParam(value="reportImageFile", required=false) MultipartFile file,
                               Model m) {
        String contactStr = req.getParameter("citizenContactId");
        if (contactStr == null || contactStr.isEmpty()) {
            m.addAttribute("error", "Citizen contact is missing!");
            return "citizen/addReport";
        }
        Long citizenContact = Long.valueOf(contactStr);

        PollutionReport r = new PollutionReport();
        r.setCitizenContactId(citizenContact);
        r.setLocation(req.getParameter("location"));
        r.setPollutionType(req.getParameter("pollutionType"));
        r.setDescription(req.getParameter("description"));
        r.setDate(new Date());
        r.setStatus("NEW");

        // --- Handle image upload ---
     // --- Handle image upload ---
        if (file != null && !file.isEmpty()) {
            try {
                // Resolve /uploads/ folder inside webapp
                String uploadRootPath = req.getServletContext().getRealPath("/uploads/");
                File uploadDir = new File(uploadRootPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();

                // Create unique filename
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                File dest = new File(uploadDir, fileName);

                // ✅ Debug: Print absolute path
                System.out.println(">>> Saving file to: " + dest.getAbsolutePath());

                // Save file
                file.transferTo(dest);

                // Save only filename in DB
                r.setReportImage(fileName);

            } catch (IOException e) {
                e.printStackTrace();
                m.addAttribute("error", "Failed to upload image!");
                return "citizen/addReport";
            }
        }


        // --- Save report to DB ---
        reportDao.create(r);
        System.out.println("DEBUG: New report created by citizen " + citizenContact + " with ID " + r.getId());

        // Redirect citizen to reports page
        return "redirect:/citizen/reports?contact=" + citizenContact;
    }

    // -------- Show Reports (after redirect) --------
    @RequestMapping(value="/reports", method=RequestMethod.GET)
    public String showReports(@RequestParam("contact") Long citizenContact, Model m) {
        Citizen c = citizenDao.get(citizenContact);
        m.addAttribute("citizen", c);
        m.addAttribute("reports", reportDao.byCitizen(citizenContact));
        return "citizen/reports";
    }

    // -------- Delete Report --------
    @RequestMapping(value="/report/delete", method=RequestMethod.POST)
    public String deleteReport(HttpServletRequest req) {
        Long id = Long.valueOf(req.getParameter("id"));
        Long citizenContact = Long.valueOf(req.getParameter("citizenContactId"));
        reportDao.delete(id);
        return "redirect:/citizen/reports?contact=" + citizenContact;
    }
}
