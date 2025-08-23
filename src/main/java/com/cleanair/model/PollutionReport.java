package com.cleanair.model;

import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "pollution_Report") // ✅ match your actual DB table name
public class PollutionReport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "citizen_contact_id", nullable = false)
    private Long citizenContactId;

    @Column(name = "location", nullable = false, length = 255)
    private String location;

    @Column(name = "pollution_type", nullable = false, length = 100)
    private String pollutionType;

    @Column(name = "description", length = 1024)
    private String description;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date", nullable = false)
    private Date date = new Date();

    @Column(name = "status", nullable = false, length = 50)
    private String status = "NEW";

    @Column(name = "authority_comment", length = 1024)
    private String authorityComment;

    @Column(name = "report_image", length = 512)
    private String reportImage;

    public PollutionReport() {}

    // getters/setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getCitizenContactId() { return citizenContactId; }
    public void setCitizenContactId(Long citizenContactId) { this.citizenContactId = citizenContactId; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getPollutionType() { return pollutionType; }
    public void setPollutionType(String pollutionType) { this.pollutionType = pollutionType; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getAuthorityComment() { return authorityComment; }
    public void setAuthorityComment(String authorityComment) { this.authorityComment = authorityComment; }

    public String getReportImage() { return reportImage; }
    public void setReportImage(String reportImage) { this.reportImage = reportImage; }
}
