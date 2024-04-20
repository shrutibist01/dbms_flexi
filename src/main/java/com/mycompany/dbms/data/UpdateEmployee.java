package com.mycompany.dbms.data;

public class UpdateEmployee {
    
    private int empID;
    private String empRole;
    private String phone;
    private double salary;

    // Constructor with all fields
    public UpdateEmployee(int empID, String empRole, String phone, double salary) {
        this.empID = empID;
        this.empRole = empRole;
        this.phone = phone;
        this.salary = salary;
    }

    // Getters and setters
    public int getEmpID() {
        return empID;
    }

    public void setEmpID(int empID) {
        this.empID = empID;
    }

    public String getEmpRole() {
        return empRole;
    }

    public void setEmpRole(String empRole) {
        this.empRole = empRole;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

}
