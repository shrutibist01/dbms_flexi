<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Projects</title>
</head>
<body>
    <h2>Add New Project</h2>
    <form method="POST">
        <label for="pname">Project Name:</label>
        <input type="text" id="pname" name="pname" required><br><br>
        
        <label for="timeperiod">Time Period:</label>
        <input type="text" id="timeperiod" name="timeperiod" required><br><br>
        
        <label for="status">Status:</label>
        <input type="text" id="status" name="status" required><br><br>
        
        <label for="expenses">Expenses:</label>
        <input type="text" id="expenses" name="expenses" required><br><br>
        
        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" cols="50" required></textarea><br><br>
        

        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
