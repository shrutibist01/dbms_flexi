<!--show employee / delete-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Show Employees</title>
    <style>
        body{
            background-color: #6895D2;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            background-color: rgba(229, 225, 218,0.6);
            margin-left: 135px;
            margin-top: 70px;
            
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
            
        }

        th {
            background-color: black;
            color: white;
        }

        .delete-button {
            background-color: transparent;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .delete-button:hover {
            color: red;
        }
        h1{
            text-align: center;
            margin-top: 50px;
            margin-bottom: -50px;
            color:#F0EBE3;
        }
        
    </style>
</head>
<body>
<h1>List of Employees</h1>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%
    List<Map<String, String>> employees = (List<Map<String, String>>) request.getAttribute("employees");
    if (employees != null && !employees.isEmpty()) {
%>
<table>
    <thead>
    <tr>
        <th>Employee ID</th>
        <th>Name</th>
        <th>Employee Role</th>
        <th>Username</th>
        <th>Phone Number</th>
        <th>Salary</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Map<String, String> employee : employees) {
    %>
    <tr>
        <td><%= employee.get("EmployeeID") %></td>
        <td><%= employee.get("EmployeeName") %></td>
        <td><%= employee.get("EmployeeRole") %></td>
        <td><%= employee.get("Username") %></td>
        <td><%= employee.get("PhoneNumber") %></td>
        <td><%= employee.get("Salary") %> Lacs</td>
        <td>
            <!-- Form for deletion -->
            <form action="/deleteEmployee" method="post">
                <input type="hidden" name="employeeID" value="<%= employee.get("EmployeeID") %>">
                <button class="delete-button" type="submit">&#10006;</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<%
    } else {
%>
<p>No employees found.</p>
<%
    }
%>

<%
    String success = request.getParameter("success");
    if (success != null && success.equals("true")) {
%>
<p style="color:green;">Employee deleted successfully!</p>
<%
    }
%>
</body>
</html>