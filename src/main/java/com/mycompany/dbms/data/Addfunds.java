package com.mycompany.dbms.data;

public class Addfunds {
    
    private String transactionID;
    private String investorName;
    private int amount;

    // Constructor with all fields
    public Addfunds(String transactionID, String investorName, int amount) {
        this.transactionID = transactionID;
        this.investorName = investorName;
        this.amount = amount;
    }

    // Constructor without transactionID
    public Addfunds(String investorName, int amount) {
        this.investorName = investorName;
        this.amount = amount;
    }

    // Getters and setters
    public String getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(String transactionID) {
        this.transactionID = transactionID;
    }

    public String getInvestorName() {
        return investorName;
    }

    public void setInvestorName(String investorName) {
        this.investorName = investorName;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

}
