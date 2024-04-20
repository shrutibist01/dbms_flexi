<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Net Expense</title>
</head>
<body>
    <h1>Net Expense Data</h1>
    
    <h2>Employees Data</h2>
    <table border="1">
        <tr>
            <th>Employee ID</th>
            <th>Employee Name</th>
            <th>Salary</th>
        </tr>
        <c:forEach items="${employeesData}" var="employee">
            <tr>
                <td>${employee.EmployeeID}</td>
                <td>${employee.EmployeeName}</td>
                <td>${employee.Salary} Lacs</td>
            </tr>
        </c:forEach>
    </table>
    <p>Subtotal: ${subtotals.employee} Lacs</p>
    
    <h2>Projects Data</h2>
    <table border="1">
        <tr>
            <th>Project ID</th>
            <th>Project Name</th>
            <th>Expenses</th>
        </tr>
        <c:forEach items="${projectData}" var="project">
            <tr>
                <td>${project.PID}</td>
                <td>${project.Pname}</td>
                <td>${project.expenses} Lacs</td>
            </tr>
        </c:forEach>
    </table>
    <p>Subtotal: ${subtotals.project} Lacs</p>
    
    <h2>Funds Data</h2>
    <table border="1">
        <tr>
            <th>Transaction ID</th>
            <th>Investor Name</th>
            <th>Amount</th>
        </tr>
        <c:forEach items="${fundsData}" var="fund">
            <tr>
                <td>${fund.TransactionID}</td>
                <td>${fund.InvestorName}</td>
                <td>${fund.Amount} Lacs</td>
            </tr>
        </c:forEach>
    </table>
    <p>Subtotal: ${subtotals.funds} Lacs</p>
    
    <h2>Marketing Data</h2>
    <table border="1">
        <tr>
            <th>Marketing ID</th>
            <th>Name</th>
            <th>Amount</th>
        </tr>
        <c:forEach items="${marketingData}" var="marketing">
            <tr>
                <td>${marketing.MarketingID}</td>
                <td>${marketing.Name}</td>
                <td>${marketing.Amount} Lacs</td>
            </tr>
        </c:forEach>
    </table>
    <p>Subtotal: ${subtotals.marketing} Lacs</p>
    
    <h2>Extra Expenses Data</h2>
    <table border="1">
        <tr>
            <th>Expense ID</th>
            <th>Purpose</th>
            <th>Amount</th>
        </tr>
        <c:forEach items="${extraExpenseData}" var="expense">
            <tr>
                <td>${expense.ExpenseID}</td>
                <td>${expense.Purpose}</td>
                <td>${expense.Amount} Lacs</td>
            </tr>
        </c:forEach>
    </table>
    <p>Subtotal: ${subtotals.extra} Lacs</p>
    
    <h2>Sales Data</h2>
    <table border="1">
        <tr>
            <th>Sale ID</th>
            <th>Profit</th>
        </tr>
        <c:forEach items="${salesData}" var="sale">
            <tr>
                <td>${sale.SaleID}</td>
                <td>${sale.profit} Lacs</td>
            </tr>
        </c:forEach>  
    </table>
    <p>Subtotal: ${subtotals.sales} Lacs</p>
    <h1>Net Profit/Loss</h1>
    
    <p>Net Profit/Loss: ${result} Lacs</p>
</body>
</html>
