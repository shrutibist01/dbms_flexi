

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Fund</title>
</head>
<body>
    <h2>Add Fund</h2>
    <form method="POST">
        <label for="purpose">Purpose:</label><br>
        <input type="text" id="purpose" name="purpose" required><br><br>
        
        <label for="amount">Amount:</label><br>
        <input type="number" id="amount" name="amount" required><br><br>
        
        <input type="submit" value="Add Fund">
    </form>
</body>
</html>

