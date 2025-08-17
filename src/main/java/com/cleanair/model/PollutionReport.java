package com.cleanair.model;

import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "pollution_reports")
public class PollutionReport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long citizenContactId;
    private String location;
    private String pollutionType;

    @Column(length = 1024)
    private String description;

    @Temporal(TemporalType.TIMESTAMP)
    private Date date;

    private String status; // NEW / IN_PROGRESS / ACTION_COMPLETE
    private String authorityComment;

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
}
