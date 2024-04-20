<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <!DOCTYPE html>
            <html>

            <head>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
                <style>
                    .container {
                        display: center;
                        justify-content: center;
                        align-items: center;
                        height: 50%;
                        text-align: center;
                        box-shadow: #275d93cb;
                        font-family: 'Lato';
                    }

                    .employee-details {
                        
                        padding: 50px;
                        margin: 2%;
                        background-color: #20182620;
                        /* light grey background */
                        border-radius: 10px;
                        /* rounded edges */
                        width: 90%;
                        /* adjust as needed */
                        border-style: outset;
                        font-family: 'Lato';

                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                        text-align: center;
                    }

                    th, td {
                        border: 4px solid black;
                        padding: 40px;
                        text-align: center;
                        border-style: outset;
                        font-size: 1.2rem;
                        font-size: large;
                    }
                    
                    .custom-btn {
                        width: 200px;
                        height: 50px;
                        color: #1c7688;
                        border-radius: 5px;
                        padding: 10px 25px;
                        font-family: 'Lato', sans-serif;
                        font-weight: 500;
                        background: transparent;
                        cursor: pointer;
                        transition: all 0.3s ease;
                        position: relative;
                        top: 180px;
                        left: 500px;
                        margin-right: 10%;
                        display: inline-block;
                        box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
                            7px 7px 20px 0px rgba(77, 67, 207, 0.51),
                            4px 4px 5px 0px rgba(0, 0, 0, .1);
                        outline: none;
                        text-align: center;
                    }

                    .btn-15:after {
                        position: absolute;
                        content: "";
                        width: 0;
                        height: 100%;
                        top: 0;
                        right: 0;
                        z-index: -1;
                        background-color: #9fafe2;
                        border-radius: 5px;
                        box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
                            7px 7px 20px 0px rgba(0, 0, 0, .1),
                            4px 4px 5px 0px rgba(0, 0, 0, .1);
                        transition: all 0.3s ease;
                    }

                    .btn-15:hover {
                        color: #fff;
                    }

                    .btn-15:hover:after {
                        left: 0;
                        width: 100%;
                    }

                    .btn-15:active {
                        position: relative;
                        top: 160px;
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

            <body>
                <nav class="navbar navbar-expand-lg" style="background-color: #487fc2a6;">
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="index.jsp" style="color: white;">
                                        <i class="fas fa-home"></i> Home
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="container">
                    <div class="employee-details">
                        <h2>Employee Details</h2>
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
                </div>


                </div>
                <br><br>
                </div>




                <a href="empproj?username=<%= request.getSession().getAttribute(" username")" %><button
                        class="custom-btn btn-15">View
                        Projects</button></a>

                <a href="empsal?username=<%= request.getSession().getAttribute(" username") %><button
                        class="custom-btn btn-15">View Salary</button></a>



                </div>
            </body>

            </html>