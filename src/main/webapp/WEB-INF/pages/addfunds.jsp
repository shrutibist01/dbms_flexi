<%-- 
    Document   : addfunds
    Created on : Apr 19, 2024, 11:26:11 PM
    Author     : sandi
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Funds</title>
</head>
<body>
    <h1>Add Funds</h1>
    <form method="post" action="/addfunds">
        <label for="transactionID">Transaction ID:</label>
        <input type="text" id="transactionID" name="transactionID" required><br>
        
        <label for="InvestorName">Investor Name:</label>
        <input type="text" id="InvestorName" name="InvestorName" required><br>
        
        <label for="amount">Amount:</label>
        <input type="number" id="amount" name="amount" required><br>
        
        <input type="submit" value="Add Funds">
    </form>
</body>
</html>
