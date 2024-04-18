<%-- 
    Document   : addproject
    Created on : 18-Apr-2024, 7:45:57 pm
    Author     : shruti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Project</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        form {
            margin: 20px auto;
            width: 50%;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Add Project</h2>
    <form action="addproject" method="post">
        <label for="PID">Project ID:</label>
        <input type="text" id="PID" name="PID" required>

        <label for="Pname">Project Name:</label>
        <input type="text" id="Pname" name="Pname" required>

        <label for="timeperiod">Time Period:</label>
        <input type="number" id="timeperiod" name="timeperiod" required>

        <label for="status">Status:</label>
        <input type="text" id="status" name="status" required>

        <label for="expenses">Expenses:</label>
        <input type="number" id="expenses" name="expenses" required>

        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea>

        <label for="NoOfEmp">Number of Employees:</label>
        <input type="number" id="NoOfEmp" name="NoOfEmp" required>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
