<!DOCTYPE html>
<html>

<head>
    <title>Admin Control Suite</title>
    <!-- Include Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Include your compiled CSS here -->
    <style>
        /* Insert your compiled CSS here */
        @import url(https://fonts.googleapis.com/css?family=Quicksand:300,400,700);
        @import url(https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css);

        body {
            margin: 0;
            /* Add this line */
            padding: 0;
            /* Add this line */
            background: #d0d0d3a4;
            font-family: 'Quicksand', sans-serif;
        }

        .left-menu {
            background: #40a4f081;
            width: 300px;
            height: 99.8vh;
            /* Add this line */
            top: 0;
            bottom: 0;
            z-index: 9999;
            border-radius: 15px;
            /* Add this line */
        }

        .accordion {
            color: #ffffff;
            /* width: 100%; */
            box-sizing: border-box;

        }

        .accordion .section {
            /* width: 100%; */
            box-sizing: border-box;

        }

        .accordion .section input[type='radio'] {
            display: none;
        }

        .accordion .section input[type='radio']:checked+label {
            background: #5f7486;
        }

        .accordion .section input[type='radio']:checked+label:before {
            content: " ";
            position: absolute;
            border-left: 3px solid #5f0bf1;
            height: 100%;
            left: 0;
        }

        .accordion .section input[type='radio']:checked~.content {
            max-height: 300px;
            opacity: 1;
            z-index: 10;
            overflow-y: auto;

        }

        .accordion .section label {
            position: relative;
            cursor: pointer;
            padding: 10px 20px;
            display: table;
            background: #1d6bcfda;
            width: 100%;
            transition: background 0.3s ease-in-out;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            -o-user-select: none;
            user-select: none;
            box-sizing: border-box;
        }

        .accordion .section label:before {
            content: " ";
            width: 100%;
            position: absolute;
            left: 0;
            top: 0;
            height: 1px;
            border-top: 1px solid #383838;
        }

        .accordion .section label:hover {
            background: #6868da;
        }

        .accordion .section label span {
            display: table-cell;
            vertical-align: middle;
        }

        .accordion .section:last-of-type {
            border-bottom: 1px solid #4c90e2;
        }

        .accordion .section .content {
            max-height: 0;
            transition: all 0.4s;
            opacity: 0;
            position: relative;
            overflow-y: hidden;
        }

        ul {
            width: 100%;
            padding: 0;
            margin: 0;
            list-style: none;
        }

        ul li {
            padding: 10px;
        }

        ul li i {
            font-size: 13px;
            width: 15px;
            margin-right: 15px;
        }

        ul li:hover {
            cursor: pointer;
        }

        ul li:hover i {
            color: #275967;
        }

        .logo {
            padding: 30px 10px;
            width: 200px;
            text-align: center;
            color: #FFF;
            font-size: 20px;
        }

        .logo i {
            font-size: 70px;
            color: #fffffffc;
        }

        .left-menu .accordion .section .content ul li a {
            color: #eae9f1;
            /* Original color */
        }

        .left-menu .accordion .section .content ul li a:hover {
            color: #ddd;
            /* Lighter color when hovered */
        }

        .logo {
            margin-top: 20px;
            margin-left: 25px;
            /* Adjust this value as needed */
        }
    </style>
</head>

<body>
    <!-- Insert your navigation code here -->
    <div class="main-content" style="display: flex;">
        <div class="left-menu">
            <div class="logo">
                <i class="fa fa-align-justify"></i>
                <div>Admin Control Suite</div>
            </div>
            <div class="accordion">
                <div class="section">
                    <input type="radio" name="accordion-1" id="section-0" checked>
                    <label for="section-0">
                        <span>Home</span>
                    </label>
                    <div class="content">
                        <ul>
                            <li>
                                <i class="fas fa-sign-out-alt"></i>
                                <a href="/">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="section">
                    <input type="radio" name="accordion-1" id="section-1" value="toggle">
                    <label for="section-1">
                        <span>Employee Management</span>
                    </label>
                    <div class="content">
                        <ul>
                            <li>
                                <i class="fas fa-user-plus"></i>
                                <a href="/newuser">Add Employee</a>
                            </li>
                            <li>
                                <i class="fas fa-user-edit"></i>
                                <a href="/UpdateEmployee">Update Employee Details</a>
                            </li>
                            <li>
                                <i class="fas fa-user-minus"></i>
                                <a href="/showEmployees">Remove Employee</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="section">
                    <input type="radio" name="accordion-1" id="section-2" value="toggle">
                    <label for="section-2">
                        <span>Project Management</span>
                    </label>
                    <div class="content">
                        <ul>
                            <li>
                                <i class="fas fa-plus-circle"></i>
                                <a href="/addempproj">Add Project</a>
                            </li>
                            <li>
                                <i class="fas fa-edit"></i>
                                <a href="/UpdateProjectStatus">Update Project</a>
                            </li>
                            <li>
                                <i class="fas fa-user-plus"></i>
                                <a href="/UpdateProjEmployee">Add Employee to Project</a>
                            </li>
                            <li>
                                <i class="fas fa-dollar-sign"></i>
                                <a href="/addfunds">Add Fundings</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="section">
                    <input type="radio" name="accordion-1" id="section-3" value="toggle">
                    <label for="section-3">
                        <span>Financial Management</span>
                    </label>
                    <div class="content">
                        <ul>
                            <li>
                                <i class="fas fa-file-invoice-dollar"></i>
                                <a href="/addextraexpense">Add Miscellaneous Expenditure</a>
                            </li>
                            <li>
                                <i class="fas fa-shopping-cart"></i>
                                <a href="/addsale">Add Sales</a>
                            </li>
                            <li>
                                <i class="fas fa-chart-line"></i>
                                <a href="/netexpense">Get Report for Net Expenditure</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <iframe id="content-frame" style="width: calc(100% - 300px); height: 100vh; position: absolute; left: 300px; border: none;" src=""></iframe>
    </div>
    <!-- Rest of your HTML content goes here -->
</body>
<script>
         // Get all the links in the accordion
var links = document.querySelectorAll('.accordion .section .content ul li a');

// Add a click event listener to each link
for (var i = 0; i < links.length; i++) {
    links[i].addEventListener('click', function(event) {
        // Prevent the default action
        event.preventDefault();

        // Get the href of the clicked link
        var href = this.getAttribute('href');

        // Check if the href is '/main.jsp'
        if (href === '/') {
            // Change the window location to the href of the clicked link
            window.location.href = href;
        } else {
            // Set the src of the iframe to the href of the clicked link
            document.getElementById('content-frame').src = href;
        }
    });
}

</script>

</html>