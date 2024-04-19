/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dbms.data;

/**
 *
 * @author sandi
 */
public class Project {
    
    private String Pname;
    private float timeperiod;
    private String status;
    private float expenses;
    private String description;

    // Constructor
    public Project( String Pname, float timeperiod, String status, float expenses, String description) {
        this.Pname = Pname;
        this.timeperiod = timeperiod;
        this.status = status;
        this.expenses = expenses;
        this.description = description;

    }

 

    public String getPname() {
        return Pname;
    }

    public void setPname(String Pname) {
        this.Pname = Pname;
    }

    public float getTimeperiod() {
        return timeperiod;
    }

    public void setTimeperiod(float timeperiod) {
        this.timeperiod = timeperiod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getExpenses() {
        return expenses;
    }

    public void setExpenses(float expenses) {
        this.expenses = expenses;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }




}
