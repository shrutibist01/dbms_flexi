<!DOCTYPE html>
<html>
<head>
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>JSP Page</title>
</head>
<body>
<nav class="navbar navbar-expand-lg" style="background-color: #092756;">
    <div class="container-fluid">
        <a class="navbar-brand" href="#" style="color: white;">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#" style="color: white;">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: white;">Link</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" aria-disabled="true" style="color: white;">Disabled</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<div class="employee-info-item">
        <div class="employee-info-label">Employee Details:</div>
    </div>
<div class="employee-info">
    <div class="employee-info-item">
        <div class="employee-info-label">Employee Name:</div>
        <div class="employee-info-value">${data.EmployeeName}</div>
    </div>
    <div class="employee-info-item">
        <div class="employee-info-label">Employee Role:</div>
        <div class="employee-info-value">${data.EmployeeRole}</div>
    </div>
    <div class="employee-info-item">
        <div class="employee-info-label">Employee ID:</div>
        <div class="employee-info-value">${data.EmployeeID}</div>
    </div>
    <div class="employee-info-item">
        <div class="employee-info-label">Phone Number:</div>
        <div class="employee-info-value">${data.PhoneNumber}</div>
    </div>
    <div class="employee-info-item">
        <div class="employee-info-label">Username:</div>
        <div class="employee-info-value">${data.Username}</div>
    </div>
    
    
</div>
    <br><br>
    <div class="employee-info-item">
        <div class="employee-info-label">Salary Details:</div>
    </div>
    <div class="employee-info">
    <div class="employee-info-item">
        <div class="employee-info-label">Salary:</div>
        <div class="employee-info-value"> ${data.Salary} Lakhs</div>
    </div>
    <div class="employee-info-item">
        <div class="employee-info-label">House Rent Allowance:</div>
        <div class="employee-info-value">${data.HouseRentAllowance} Lakhs</div>
    </div>
    <div class="employee-info-item">
        <div class="employee-info-label"> Medical Insurance:</div>
        <div class="employee-info-value">${data.MedicalInsurance} Lakhs</div>
    </div>
    <div class="employee-info-item">
        <div class="employee-info-label">Provident Fund:</div>
        <div class="employee-info-value">${data.ProvidentFund} Lakhs</div>
    </div>
    <a href="projects">check projects</a>

       ${data.ProjectName}
       ${data.ProjectID}
     
    <h1>Project Details</h1>
    <table border="1">
        <tr>
            <th>Project ID</th>
            <th>Project Name</th>
            <!-- Add more columns if needed -->
        </tr>
        <c:forEach items="${projects}" var="projects">
            <tr>
                <td>${projects.ProjectID}</td>
                <td>${projects.ProjectName}</td>
                <!-- Display more project details as needed -->
            </tr>
        </c:forEach>
    </table>

    
</div>
</body>
</html>
