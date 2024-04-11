/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dbms.dao;

import com.mycompany.dbms.config.DBConnectionConfigs;
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
    private boolean ProjectID;

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
    

    try (Connection connection = DBConnectionConfigs.getConnection();
         PreparedStatement pr = connection.prepareStatement("SELECT * FROM employees WHERE Username=? AND Password=?")) {

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
                data.put("Bonus", rs.getString("Bonus"));
                
                System.out.println("Authentication successful. Redirecting to main page...");
                
                // Call the stored procedure to calculate salary split
                String employee = rs.getString("Username");
                Map<String, String> salarySplit = calculateSalarySplit(employee);
                List<Map<String, String>> proj = checkProject(employee);
                if (salarySplit != null) {
                    System.out.println("abc");
                    data.putAll(salarySplit); 
                    for (int i = 0; i < proj.size(); i++) {
                    Map<String, String> projectDetails = proj.get(i);
                     projects.add(projectDetails);
                     
                    }
                    //System.out.println(projects);
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

    private Map<String, String> calculateSalarySplit(String empId) {
        Map<String, String> salarySplit = new HashMap<>();
        try (Connection connection = DBConnectionConfigs.getConnection();
             CallableStatement stmt = connection.prepareCall("{CALL CalculateSalarySplitByUsername(?)}")) {
            stmt.setString(1, empId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    salarySplit.put("ProvidentFund", rs.getString("ProvidentFund"));
                    salarySplit.put("HouseRentAllowance", rs.getString("HouseRentAllowance"));
                    salarySplit.put("MedicalInsurance", rs.getString("MedicalInsurance"));
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Handle the exception appropriately
            salarySplit = null;
        }
        return salarySplit;
    }
    
   public List<Map<String, String>> checkProject(String empUsername) {
    List<Map<String, String>> projectsList = new ArrayList<>();
    try (Connection connection = DBConnectionConfigs.getConnection();
         CallableStatement stmt = connection.prepareCall("{CALL GetEmployeeProjectDetails(?)}")) {
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


      public int admindata(String username, String password) {
    int flag = 0;
    try (Connection connection = DBConnectionConfigs.getConnection();
         PreparedStatement pr = connection.prepareStatement("SELECT * FROM employees WHERE Username=? AND Password=? AND EmployeeRole = ?")) {
        System.out.println(username+password);
        pr.setString(1, username);
        pr.setString(2, password);
        pr.setString(3, "Admin");
        
        
        try (ResultSet rs = pr.executeQuery()) {
            if (rs.next()) {
                flag = 1;
                System.out.println("Authentication successful. Redirecting to main page...");
            } else {
                System.out.println("Authentication failed. Please try again.");
            }
        }
    } catch (SQLException ex) {
        Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return flag;
}

    }

