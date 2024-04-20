<!DOCTYPE html>
<html>
    <head>
        <title>Employee and Project Management</title>
        <!-- Include Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <!-- Optionally, you can include custom stylesheets here -->
        <style>
            /* Add your custom styles here */
        </style>
    </head>
    <body>
        <h1>Employee Management</h1>
        <a href="/newuser"><button><i class="fas fa-user-plus"></i> Add Employee</button></a>

        <div>
            <a href="/UpdateEmployee"><button><i class="fas fa-user-edit"></i> Update Employee Details</button></a>
        </div>
        <div>
            <a href="/showEmployees"><button><i class="fas fa-user-minus"></i> Remove Employee</button></a>
        </div>

        <h1>Project Management</h1>
        <div>
            <a href="/addempproj"><button><i class="fas fa-plus-circle"></i> Add Project</button></a>
        </div>
        <div>
            <a href="/UpdateProjectStatus"><button><i class="fas fa-edit"></i> Update Project</button></a>
        </div>
        <div><a href="/UpdateProjEmployee"><button><i class="fas fa-user-plus"></i> Add Employee to Project</button></a>
</div>
        <div>
            <a href="/addfunds"><button><i class="fas fa-dollar-sign"></i> Add Fundings</button></a>
        </div>

        <h1>Financial Management</h1>
        <div>
            <a href="/addextraexpense"><button><i class="fas fa-file-invoice-dollar"></i> Add Miscellaneous Expenditure</button></a>
        </div>
        <div>
            <a href="/addsale"><button><i class="fas fa-shopping-cart"></i> Add Sales</button></a>
        </div>
        <div>
            <a href="/netexpense"><button><i class="fas fa-chart-line"></i> Get Report for Net Expenditure</button></a>
        </div>

        <!-- Include JS frameworks or custom scripts here -->
    </body>
</html>
