/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dbms.data;

/**
 *
 * @author sandi
 */


public class Addsales {

    private String saleID;
    private String projectID;
    private int profit;

    // Constructor with all fields
    public Addsales(String saleID, String projectID, int profit) {
        this.saleID = saleID;
        this.projectID = projectID;
        this.profit = profit;
    }

    // Constructor without saleID
    public Addsales(String projectID, int profit) {
        this.projectID = projectID;
        this.profit = profit;
    }

    // Getters and setters
    public String getSaleID() {
        return saleID;
    }

    public void setSaleID(String saleID) {
        this.saleID = saleID;
    }

    public String getProjectID() {
        return projectID;
    }

    public void setProjectID(String projectID) {
        this.projectID = projectID;
    }

    public int getProfit() {
        return profit;
    }

    public void setProfit(int profit) {
        this.profit = profit;
    }
}
