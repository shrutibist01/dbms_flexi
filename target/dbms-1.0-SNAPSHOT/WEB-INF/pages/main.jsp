<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 20vh;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        .employee-details {
            padding: 30px;
            margin: auto;
            background-color: #20182620;
            border-radius: 10px;
            width: 50%;
            border: 1px solid #ccc;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            height: auto;
            margin-bottom: 20px;
        }

        th,
        td {
            border: 1px solid black;
            padding: 15px;
            text-align: center;
        }

        .custom-btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            border-radius: 5px;
            text-align: center;
            background-color: #B4D4FF;
            color: black;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
                7px 7px 20px 0px rgba(77, 67, 207, 0.51),
                4px 4px 5px 0px rgba(0, 0, 0, .1);
        }

        .custom-btn:hover {
            background-color: #280274;
            color: white;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <title>JSP Page</title>
</head>

<body style="background-color:#40679E">
<nav class="navbar navbar-expand-lg" style="background-color: #487fc2a6;">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/" style="color: white;">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5" >
    <div class="employee-details" style="background-color: #B7C9F2">
        <h3 style="color:#280274">Employee Details</h3>
        <table>
            <tr>
                <th>Name</th>
                <td>${data.EmployeeName}</td>
            </tr>
            <tr>
                <th>Position</th>
                <td>${data.EmployeeRole}</td>
            </tr>
            <tr>
                <th>Email</th>
                <td>${data.EmployeeID}</td>
            </tr>
            <tr>
                <th>Phone Number</th>
                <td>${data.PhoneNumber}</td>
            </tr>
            <tr>
                <th>Username</th>
                <td>${data.Username}</td>
            </tr>
        </table>
    </div>

    <div>
        <a href="empproj?username=<%= request.getSession().getAttribute("username") %>">
            <button class="custom-btn">View Projects</button>
        </a>

        <a href="empsal?username=<%= request.getSession().getAttribute("username") %>">
            <button class="custom-btn">View Salary</button>
        </a>
    </div>
</div>

</body>

</html>