/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dbms.data;

/**
 *
 * @author sandi
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    EmployeeRole VARCHAR(50),
    PhoneNumber CHAR(10),
    Salary DECIMAL(10, 2),
    Bonus DECIMAL(10, 2),
    Username VARCHAR(50) Unique key,
    Password VARCHAR(50) Unique key
);
 */


public class Userdata {
    int age;
    String name;
    String email;
    String password;

    public Userdata(int age, String name, String email) {
        this.age = age;
        this.name = name;
        this.email = email;
    }
public String getAge() {
    return Integer.toString(age);
}

    public void setAge(int age) {
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return email;
    }

    public void setPassword(String Password) {
        this.password = password;
    }
}

