<%@ page import="java.util.Map" %>
<%@ page import="com.mycompany.dbms.dao.UsersDAO" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Projects</title>
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 90vh;
            text-align: center;
        }

        .employee-details {
            padding: 30px;
            margin: auto;
            background-color: #B7C9F2;
            border-radius: 10px;
            width: 80%; /* Increased width */
            border: 1px solid #ccc;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden; /* Ensure content doesn't overflow */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        th,
        td {
            border: 1px solid #dddddd;
            padding: 15px;
            text-align: center;
        }

        th {
            background-color: #7483a4a7;
        }

        td {
            background-color: #8695b5a7;
        }

        hr {
            border: 0;
            height: 1px;
            background: #ccc;
            margin: 20px 0;
        }
    </style>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous">
</head>

<body style="background-color: #40679E;">
    <div class="container">
        <div class="employee-details">
            <h3 style="color:#280274">Salary Details</h3>

            <% String user=request.getParameter("username"); Map<String, String> userData =
                UsersDAO.getInstance().calculateSalarySplit(user);
                // Display salary details
                if (userData != null) {
                // Set username in session
                request.getSession().setAttribute("username", user);
            %>

            <table style="background-color: #B7C9F2;">
                <tr>
                    <th>Basic Salary:</th>
                    <td><%= userData.get("BasicSalary") %> Lakhs</td>
                </tr>
                <tr>
                    <th>House Rent Allowance:</th>
                    <td><%= userData.get("HouseRentAllowance") %> Lakhs</td>
                </tr>
                <tr>
                    <th>Special Allowance:</th>
                    <td><%= userData.get("SpecialAllowance") %> Lakhs</td>
                </tr>
                <tr>
                    <th>Bonus:</th>
                    <td><%= userData.get("Bonus") %> Lakhs</td>
                </tr>
                <tr>
                    <th>Income Tax:</th>
                    <td><%= userData.get("IncomeTax") %> Lakhs</td>
                </tr>
                
                <tr>
                    <th>Net Salary:</th>
                    <td><%= userData.get("NetSalary") %> Lakhs</td>
                </tr>
            </table>
            <hr>
            <% } else { out.println("<p>No salary found for this user</p>"); } %>
        </div>
    </div>
</body>

</html>