<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project Details</title>
</head>
<body>
    <h1>Project Details</h1>
    <table border="1">
        <tr>
            <th>Employee</th>
            <th>Project</th>
        </tr>
        <% 
            List<Map<String, String>> proj = checkProject(employee);
            for(Map<String, String> map : proj) {
                %>
                <tr>
                    <td><%= map.get("employee") %></td>
                    <td><%= map.get("project") %></td>
                </tr>
                <%
            }
        %>
    </table>
</body>
</html>
