/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dbms.data;

/**
 *
 * @author sandi
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
