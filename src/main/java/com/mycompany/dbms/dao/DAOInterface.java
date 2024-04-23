/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dbms.dao;

/**
 *
 * @author sandi
 */
import com.mycompany.dbms.data.Addfunds;
import com.mycompany.dbms.data.Addsales;
import com.mycompany.dbms.data.Empdata;
import com.mycompany.dbms.data.EmployeeProj;
import com.mycompany.dbms.data.ExtraExpenseAdd;
import com.mycompany.dbms.data.Project;
import java.util.List;
import java.util.Map;

public interface DAOInterface {
    Map<String, String> getdata(String username, String password);
    Map<String, String> calculateSalarySplit(String empId);
    List<Map<String, String>> checkProject(String empUsername);
    Map<String, String> admindata(String username, String password);
    int save(Empdata user);
    String updateProjectStatus(String projectID, String newStatus);
    int addextra(ExtraExpenseAdd expense);
    int addextra(Addfunds addFunds);
    boolean isSaleIDExists(String saleID);
    int addNewSale(Addsales sale);
    void updateEmployee(int empID, String empRole, String phone, double salary);
    List<Map<String, String>> getAllEmployees();
    void deleteEmployee(int employeeID);
    int saveEmployees(String projectId, List<EmployeeProj> employees);
    int saveproj(Project project);
    List<Map<String, String>> expenseEmployees();
    List<Map<String, String>> expenseExtra();
    List<Map<String, String>> expenseProjects();
    List<Map<String, String>> expensesales();
    List<Map<String, String>> expensefunds();
    List<Map<String, String>> expensemarketing();
    String calculateNetProfitLoss();
}
