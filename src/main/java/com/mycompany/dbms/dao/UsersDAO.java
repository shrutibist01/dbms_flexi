/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dbms.dao;

import com.mycompany.dbms.config.DBConnectionConfigs;
import com.mycompany.dbms.data.Empdata;
import com.mycompany.dbms.data.Userdata;
import com.sun.source.tree.BreakTree;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.management.Query;

public class UsersDAO {

    private static UsersDAO instance;

    private UsersDAO() {

    }

    public static synchronized UsersDAO getInstance() {
        if (instance == null) {
            instance = new UsersDAO();

        }

        return instance;
    }

    /*
    public void save(Userdata user) {
        Connection connection = DBConnectionConfigs.getConnection();
        try {
            PreparedStatement pr = connection.prepareStatement("insert into trial (name, email, age) values (? , ?, ?) ");
            pr.setString(2, user.getEmail());
            pr.setString(1, user.getName());
            pr.setString(3, user.getAge());
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
     */
    public Map<String, String> getdata(String username, String password) {
        Map<String, String> data = new HashMap<>();
        List<Map<String, String>> projects = new ArrayList<>();

        try (Connection connection = DBConnectionConfigs.getConnection(); PreparedStatement pr = connection.prepareStatement("SELECT * FROM employees WHERE Username=? AND Password=?")) {

            pr.setString(1, username);
            pr.setString(2, password);
            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    data.put("EmployeeID", rs.getString("EmployeeID"));
                    data.put("EmployeeName", rs.getString("EmployeeName"));
                    data.put("EmployeeRole", rs.getString("EmployeeRole"));
                    data.put("PhoneNumber", rs.getString("PhoneNumber"));
                    data.put("Username", rs.getString("Username"));
                    data.put("Salary", rs.getString("Salary"));

                    // Call the stored procedure to calculate salary split
                    String employee = rs.getString("Username");
                    Map<String, String> salarySplit = calculateSalarySplit(employee);
                    if (salarySplit != null) {
                        System.out.println("abc");
                        data.putAll(salarySplit);

                        System.out.println(data);

                    } else {
                        System.out.println("Failed to calculate salary split.");
                    }

                } else {
                    System.out.println("Authentication failed. Please try again.");
                    data = null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately
            data = null;
        }
        return data;
    }

    public Map<String, String> calculateSalarySplit(String empId) {
        Map<String, String> salarySplit = new HashMap<>();
        try (Connection connection = DBConnectionConfigs.getConnection(); CallableStatement stmt = connection.prepareCall("{CALL CalculateSalarySplitByUsername(?)}")) {
            stmt.setString(1, empId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    salarySplit.put("BasicSalary", rs.getString("BasicSalary"));
                    salarySplit.put("HouseRentAllowance", rs.getString("HouseRentAllowance"));
                    salarySplit.put("SpecialAllowance", rs.getString("SpecialAllowance"));
                    salarySplit.put("Bonus", rs.getString("Bonus"));
                    salarySplit.put("IncomeTax", rs.getString("IncomeTax"));
                    salarySplit.put("ProvidentFund", rs.getString("ProvidentFund"));
                    salarySplit.put("NetSalary", rs.getString("NetSalary"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return salarySplit;
    }

    public List<Map<String, String>> checkProject(String empUsername) {
        List<Map<String, String>> projectsList = new ArrayList<>();
        try (Connection connection = DBConnectionConfigs.getConnection(); CallableStatement stmt = connection.prepareCall("{CALL GetEmployeeProjectDetails(?)}")) {
            stmt.setString(1, empUsername);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> projectDetails = new HashMap<>();
                    String projectID = rs.getString("ProjectID");
                    String projectName = rs.getString("ProjectName");
                    String timePeriod = rs.getString("TimePeriod");
                    String status = rs.getString("Status");
                    String expenses = rs.getString("Expenses");
                    String description = rs.getString("Description");
                    String teamMembersDetails = rs.getString("TeamMembersDetails");
                    projectDetails.put("ProjectID", projectID);
                    projectDetails.put("ProjectName", projectName);
                    projectDetails.put("TimePeriod", timePeriod);
                    projectDetails.put("Status", status);
                    projectDetails.put("Expenses", expenses);
                    projectDetails.put("Description", description);
                    projectDetails.put("TeamMembersDetails", teamMembersDetails);

                    projectsList.add(projectDetails);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Handle the exception appropriately
            projectsList = null;
        }
        return projectsList;
    }

    public Map<String, String> admindata(String username, String password) {
        Map<String, String> dat = new HashMap<>();
        try (Connection connection = DBConnectionConfigs.getConnection(); PreparedStatement pr = connection.prepareStatement("SELECT * FROM employees WHERE Username=? AND Password=? AND EmployeeRole = ?")) {
            pr.setString(1, username);
            pr.setString(2, password);
            pr.setString(3, "Admin");

            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    dat.put("EmployeeID", rs.getString("EmployeeID"));
                    dat.put("EmployeeName", rs.getString("EmployeeName"));
                    dat.put("EmployeeRole", rs.getString("EmployeeRole"));
                    dat.put("PhoneNumber", rs.getString("PhoneNumber"));
                    dat.put("Username", rs.getString("Username"));
                    dat.put("Salary", rs.getString("Salary"));
                    // Authentication succeeded
                    return dat;
                } else {
                    System.out.println("Authentication failed. Please try again.");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, "An error occurred during authentication", ex);
        }
        // Authentication failed
        return null;
    }
    

    public int save(Empdata user) {
        Connection connection = DBConnectionConfigs.getConnection();
        try {
            // Check if the EmployeeID or Username already exists
            PreparedStatement checkStmt = connection.prepareStatement("SELECT EmployeeID, Username FROM employees WHERE EmployeeID = ? OR Username = ?");
            checkStmt.setInt(1, user.getEmployeeID());
            checkStmt.setString(2, user.getUsername());
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                return (0);
                //throw new RuntimeException("EmployeeID or Username already exists.");
            } else {
                PreparedStatement pr = connection.prepareStatement("INSERT INTO employees (EmployeeID, EmployeeName, EmployeeRole, PhoneNumber, Salary, Username, Password) VALUES (?, ?, ?, ?, ?, ?, ?)");
                pr.setInt(1, user.getEmployeeID());
                pr.setString(2, user.getEmployeeName());
                pr.setString(3, user.getEmployeeRole());
                pr.setString(4, user.getPhoneNumber());
                pr.setFloat(5, user.getSalary());
                pr.setString(6, user.getUsername());
                pr.setString(7, user.getPassword());
                pr.executeUpdate();
                return (1);
            }
        } catch (SQLException ex) {

            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return (0);
    }

}
