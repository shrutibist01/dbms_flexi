<%@ page import="java.util.Map" %>
<%@ page import="com.mycompany.dbms.dao.UsersDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Projects</title>
    <style>
        table, th, td {
            border: 1px solid black;
        }
        .employee-info {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            margin: 20px 0;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .employee-info-item {
            display: flex;
            margin-bottom: 10px;
        }
        .employee-info-label {
            width: 150px;
            font-weight: bold;
        }
        .employee-info-value {
            flex: 1;
        }
    </style>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="employee-info-item">
                <div class="employee-info-label">Salary Details:</div>
            </div>
    
<%
    String user = request.getParameter("username");
    Map<String, String> userData = UsersDAO.getInstance().calculateSalarySplit(user);
    // Display projects
    if (userData != null) {
        // Set username in session
        request.getSession().setAttribute("username", user);
%>
    <div class="employee-info">
        <div class="employee-info-item">
            <div class="employee-info-label">Basic Salary:</div>
            <div class="employee-info-value"><%= userData.get("BasicSalary") %></div>
        </div>
        <div class="employee-info-item">
            <div class="employee-info-label">House Rent Allowance:</div>
            <div class="employee-info-value"><%= userData.get("HouseRentAllowance") %></div>
        </div>
        <div class="employee-info-item">
            <div class="employee-info-label">Special Allowance:</div>
            <div class="employee-info-value"><%= userData.get("SpecialAllowance") %></div>
        </div>
        <div class="employee-info-item">
            <div class="employee-info-label">Bonus:</div>
            <div class="employee-info-value"><%= userData.get("Bonus") %></div>
        </div>
        <div class="employee-info-item">
            <div class="employee-info-label">Income Tax:</div>
            <div class="employee-info-value"><%= userData.get("IncomeTax") %></div>
        </div>
        <div class="employee-info-item">
            <div class="employee-info-label">Net Salary:</div>
            <div class="employee-info-value"><%= userData.get("NetSalary") %></div>
        </div>
        <hr>
    </div>
<%
    } else {
        out.println("<p>No salary found for this user</p>");
    }
%>
</body>
</html>
