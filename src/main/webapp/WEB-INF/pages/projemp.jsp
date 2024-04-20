<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Employees to Project</title>
        <script>
            function addFields() {
                var numEmployees = document.getElementById("numEmployees").value;
                var container = document.getElementById("employeeFields");
                container.innerHTML = "";
                for (var i = 0; i < numEmployees; i++) {
                    container.innerHTML += "<div>" +
                            "<label for='employeeId_" + i + "'>Employee ID:</label>" +
                            "<input type='text' id='employeeId_" + i + "' name='employeeId_" + i + "' required>" +
                             "</div>";
                }
            }


        </script>
    </head>
    <body>
        <h2>Add Employees to Project</h2>
        <form action="UpdateProjEmployee" method="post">
            <div>
                <label for="projectId">Project ID:</label>
                <input type="text" id="projectId" name="projectId">
            </div>
            <div>
                <label for="numEmployees">Number of Employees:</label>
                <input type="number" id="numEmployees" name="numEmployees" min="1" onchange="addFields()">
            </div>
            <div id="employeeFields">
                <!-- Employee input fields will be generated here -->
            </div>
            <div>
                <input type="submit" value="Submit">
            </div>
        </form>
    </body>
</html>
