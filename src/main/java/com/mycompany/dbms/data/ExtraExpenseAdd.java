/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dbms.data;

/**
 *
 * @author sandi
 */


public class ExtraExpenseAdd {
    private String purpose;
    private int amount;

    // Constructor
    public ExtraExpenseAdd( String purpose, int amount) {
        this.purpose = purpose;
        this.amount = amount;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}

