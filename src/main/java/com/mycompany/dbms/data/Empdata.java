package com.mycompany.dbms.data;

public class Empdata {
    private int EmployeeID;
    private String EmployeeName;
    private String EmployeeRole;
    private String PhoneNumber;
    private float Salary;
    private float Bonus;
    private String Username;
    private String Password;

    public int getEmployeeID() {
        return EmployeeID;
    }

    public void setEmployeeID(int EmployeeID) {
        this.EmployeeID = EmployeeID;
    }

    public String getEmployeeName() {
        return EmployeeName;
    }

    public void setEmployeeName(String EmployeeName) {
        this.EmployeeName = EmployeeName;
    }

    public String getEmployeeRole() {
        return EmployeeRole;
    }

    public void setEmployeeRole(String EmployeeRole) {
        this.EmployeeRole = EmployeeRole;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public float getSalary() {
        return Salary;
    }

    public void setSalary(float Salary) {
        this.Salary = Salary;
    }

    public float getBonus() {
        return Bonus;
    }

    public void setBonus(float Bonus) {
        this.Bonus = Bonus;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }   
}
