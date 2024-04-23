/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author sandi
 */
package com.mycompany.dbms.data;

public class Projdata extends EmployeeProj {

    private String projectID;
    private String projectName;
    private String timePeriod;
    private String status;
    private String expenses;
    private String description;
    private String teamMembersDetails;

    public Projdata(String ID, String projectID, String projectName, String timePeriod, String status, String expenses, String description, String teamMembersDetails) {
        super(ID);
        this.projectID = projectID;
        this.projectName = projectName;
        this.timePeriod = timePeriod;
        this.status = status;
        this.expenses = expenses;
        this.description = description;
        this.teamMembersDetails = teamMembersDetails;
    }

    // Getters and setters for the additional fields
    public String getProjectID() {
        return projectID;
    }

    public void setProjectID(String projectID) {
        this.projectID = projectID;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getTimePeriod() {
        return timePeriod;
    }

    public void setTimePeriod(String timePeriod) {
        this.timePeriod = timePeriod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getExpenses() {
        return expenses;
    }

    public void setExpenses(String expenses) {
        this.expenses = expenses;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTeamMembersDetails() {
        return teamMembersDetails;
    }

    public void setTeamMembersDetails(String teamMembersDetails) {
        this.teamMembersDetails = teamMembersDetails;
    }
}
