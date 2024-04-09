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
                    if (salarySplit != null) {
                        System.out.println("abc");
                        data.putAll(salarySplit); // Merge the salary split data into the existing data map
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
                    System.out.println("com.mycompany.dbms.dao.UsersDAO.calculateSalarySplit()"+rs.getString("MedicalInsurance"));
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Handle the exception appropriately
            salarySplit = null;
        }
        return salarySplit;
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

