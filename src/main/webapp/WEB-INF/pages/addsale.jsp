<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Sale</title>
</head>
<body>
    <h2>Add Sale</h2>
    <form action="/addsale" method="post">
        <label for="saleID">Sale ID:</label><br>
        <input type="text" id="saleID" name="saleID"><br>
        
        <label for="projectID">Project ID:</label><br>
        <input type="text" id="projectID" name="projectID"><br>
        
        <label for="profit">Profit:</label><br>
        <input type="text" id="profit" name="profit"><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
