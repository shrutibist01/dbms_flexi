<%@ page import="java.util.List" %>
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
                <div class="employee-info-label">Project Details:</div>
            </div>
<%
    String username = request.getParameter("username");
    List<Map<String, String>> projects = UsersDAO.getInstance().checkProject(username);
    // Display projects
    if (projects != null && !projects.isEmpty()) {
        for (Map<String, String> project : projects) {
%>
           
            <div class="employee-info">
                <div class="employee-info-item">
                    <div class="employee-info-label">Project ID:</div>
                    <div class="employee-info-value"><%= project.get("ProjectID") %></div>
                </div>
                <div class="employee-info-item">
                    <div class="employee-info-label">Project Name:</div>
                    <div class="employee-info-value"><%= project.get("ProjectName") %></div>
                </div>
                <div class="employee-info-item">
                    <div class="employee-info-label">Time Period:</div>
                    <div class="employee-info-value"><%= project.get("TimePeriod") %></div>
                </div>
                <div class="employee-info-item">
                    <div class="employee-info-label">Status:</div>
                    <div class="employee-info-value"><%= project.get("Status") %></div>
                </div>
                <div class="employee-info-item">
                    <div class="employee-info-label">Expenses:</div>
                    <div class="employee-info-value"><%= project.get("Expenses") %></div>
                </div>
                <div class="employee-info-item">
                    <div class="employee-info-label">Description:</div>
                    <div class="employee-info-value"><%= project.get("Description") %></div>
                </div>
               <div class="employee-info-item">
                    <div class="employee-info-label">Team Members Details:</div>
                    <div class="employee-info-value">
                        <% 
                            String teamMembers = project.get("TeamMembersDetails");
                            String[] membersArray = teamMembers.split(",");
                            for (String member : membersArray) {
                        %>
                            <%= member.trim() %><br/>
                        <% } %>
                    </div>
                </div>
                <hr>
            </div>
<%
        }
    } else {
        out.println("<p>No projects found for this user</p>");
    }
%>
</body>
</html>
