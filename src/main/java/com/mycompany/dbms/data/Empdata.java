package com.mycompany.dbms.data;

public class Empdata {

    int EmployeeID;
    String EmployeeName;
    String EmployeeRole;
    String PhoneNumber;
    float Salary;
    float Bonus;
    String Username;
    String Password;

    public Empdata(int employeeID, String employeeName, String employeeRole, String phoneNumber, float salary, float bonus, String username, String password) {
        this.EmployeeID = employeeID;
        this.EmployeeName = employeeName;
        this.EmployeeRole = employeeRole;
        this.PhoneNumber = phoneNumber;
        this.Salary = salary;
        this.Bonus = bonus;
        this.Username = username;
        this.Password = password;
    }

    // Getters and setters for each field
    public int getEmployeeID() {
        return EmployeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.EmployeeID = employeeID;
    }

    public String getEmployeeName() {
        return EmployeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.EmployeeName = employeeName;
    }

    public String getEmployeeRole() {
        return EmployeeRole;
    }

    public void setEmployeeRole(String employeeRole) {
        this.EmployeeRole = employeeRole;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.PhoneNumber = phoneNumber;
    }

    public float getSalary() {
        return Salary;
    }

    public void setSalary(float salary) {
        this.Salary = salary;
    }

    public float getBonus() {
        return Bonus;
    }

    public void setBonus(float bonus) {
        this.Bonus = bonus;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        this.Username = username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        this.Password = password;
    }
}
