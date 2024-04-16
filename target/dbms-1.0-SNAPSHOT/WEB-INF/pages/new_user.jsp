<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Form</title>
<style>
    form {
        max-width: 400px;
        margin: 0 auto;
    }

    label {
        display: block;
        margin-bottom: 5px;
    }

    input[type="text"],
    input[type="password"],
    input[type="number"],
    input[type="tel"],
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    small {
        color: #888;
    }
</style>
</head>
<body>
<form method="post">
    <label for="EmployeeID">Employee ID:</label>
    <input type="text" id="EmployeeID" name="EmployeeID" placeholder="Employee ID" required>
    
    <label for="EmployeeName">Employee Name:</label>
    <input type="text" id="EmployeeName" name="EmployeeName" placeholder="Employee Name" required>
    
    <label for="EmployeeRole">Employee Role:</label>
    <input type="text" id="EmployeeRole" name="EmployeeRole" placeholder="Employee Role" required>
    
    <label for="PhoneNumber">Phone Number:</label>
    <input type="tel" id="PhoneNumber" name="PhoneNumber" placeholder="Phone Number" pattern="[0-9]{10}" required>
    
    <label for="Salary">Salary:</label>
    <input type="number" id="Salary" name="Salary" placeholder="Salary" min="0" required>
    
    
    <label for="Username">Username:</label>
    <input type="text" id="Username" name="Username" placeholder="Username" required>
    
    <label for="Password">Password:</label>
    <input type="password" id="Password" name="Password" placeholder="Password" required>
    
    <input type="submit" value="Submit Employee">
</form>
</body>
</html>
