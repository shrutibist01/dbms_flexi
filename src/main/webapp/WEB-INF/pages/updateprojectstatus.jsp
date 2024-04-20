<!DOCTYPE html>
<html>
<head>
    <title>Update Project Status</title>
</head>
<body>
    <h1>Update Project Status</h1>
    <form action="/UpdateProjectStatus" method="post">
        <label for="projectID">Project ID:</label>
        <input type="text" id="projectID" name="projectID" required><br><br>
        
        <label for="newStatus">New Status:</label>
        <input type="text" id="newStatus" name="newStatus" required><br><br>
        
        <button type="submit">Update Status</button>
    </form>
</body>
</html>
