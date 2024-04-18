/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.dbms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddProjectServlet", urlPatterns = {"/addproject"})
public class AddProjectServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Retrieve project details from request parameters
            String pid = request.getParameter("pid");
            String pname = request.getParameter("pname");
            float timeperiod = Float.parseFloat(request.getParameter("timeperiod"));
            String status = request.getParameter("status");
            float expenses = Float.parseFloat(request.getParameter("expenses"));
            String description = request.getParameter("description");
            int noOfEmp = Integer.parseInt(request.getParameter("noOfEmp"));
            
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/project";
            String user = "root";
            String password = "shruti2004";

            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                // Begin transaction
                conn.setAutoCommit(false);
                
                try {
                    // Update Projects table
                    String updateProjectQuery = "INSERT INTO Projects (PID, Pname, timeperiod, status, expenses, description, NoOfEmp) "
                                              + "VALUES (?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement updateProjectStmt = conn.prepareStatement(updateProjectQuery);
                    updateProjectStmt.setString(1, pid);
                    updateProjectStmt.setString(2, pname);
                    updateProjectStmt.setFloat(3, timeperiod);
                    updateProjectStmt.setString(4, status);
                    updateProjectStmt.setFloat(5, expenses);
                    updateProjectStmt.setString(6, description);
                    updateProjectStmt.setInt(7, noOfEmp);
                    updateProjectStmt.executeUpdate();
                    updateProjectStmt.close();
                    
                    // Update ProjectEmployees table
                    String updateProjectEmployeesQuery = "INSERT INTO ProjectEmployees (ProjectID, EmployeeID) VALUES (?, ?)";
                    PreparedStatement updateProjectEmployeesStmt = conn.prepareStatement(updateProjectEmployeesQuery);
                    for (int i = 1; i <= noOfEmp; i++) {
                        updateProjectEmployeesStmt.setString(1, pid);
                        updateProjectEmployeesStmt.setInt(2, i);
                        updateProjectEmployeesStmt.addBatch();
                    }
                    updateProjectEmployeesStmt.executeBatch();
                    updateProjectEmployeesStmt.close();
                    
                    // Commit transaction
                    conn.commit();
                    
                    out.println("<h3>Project and associated employees added successfully!</h3>");
                    
                } catch (SQLException ex) {
                    conn.rollback(); // Rollback transaction if an error occurs
                    out.println("<h3>Error: " + ex.getMessage() + "</h3>");
                }
                
            } catch (SQLException ex) {
                out.println("<h3>Error: " + ex.getMessage() + "</h3>");
            }
        }
    }
}
