<%-- 
    Document   : index
    Created on : Apr 6, 2024, 11:20:46 PM
    Author     : sandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> TechPro Solutions </title>
    <style>
        /* Add your CSS styles here */
        * {
            box-sizing: border-box;
            margin: 0px;
            padding: 0px;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            margin: 10px;
            padding: 10px;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        .login-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .login-btn:hover {
            background-color: #0056b3;
        }
        .slider {
            position: relative;
            width: 60%;
            overflow: hidden;
            margin: 10px;
            padding: 10px;
        }
        .images {
            display: flex;
            width: 100%;
            margin: 10px;
            padding: 10px;
        }
        .images img {
            height: 400px;
            width: 100%;
            transition: all 0.15s ease;
        }
        .images input {
            display: none;
        }
        .dots {
            display: flex;
            justify-content: center;
            margin: 5px;
        }
        .dots label {
            height: 20px;
            width: 20px;
            border-radius: 50%;
            border: solid #fff 3px;
            cursor: pointer;
            transition: all 0.15s ease;
            margin: 5px;
        }
        .dots label:hover {background: #fff;}
        #img1:checked ~ .m1 {
            margin-left: 0;
        }
        #img2:checked ~ .m2 {
            margin-left: -100%;
        }
        #img3:checked ~ .m3 {
            margin-left: -200%;
        }
        #img4:checked ~ .m4 {
            margin-left: -300%;
        }
    </style>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <header>
        <h1>Welcome to TechPro Solutions</h1>
    </header>
    <button class="login-btn" onclick="window.location.href='login'">Login</button>
    <div class="slider">
        <div class="images">
            <input type="radio" name="slide" id="img1" checked>
            <input type="radio" name="slide" id="img2">
            <input type="radio" name="slide" id="img3">
            <input type="radio" name="slide" id="img4">

            <img src="./Users/shruti/dbms_project/src/main/resources/assets/w1.jpg" class="m1" alt="img1"> 
            <img src="./Users/shruti/dbms_project/src/main/resources/assets/w2.jpg" class="m2" alt="img2">
            <img src="./Users/shruti/dbms_project/src/main/resources/assets/w3.jpg" class="m3" alt="img3">
            <img src="./Users/shruti/dbms_project/src/main/resources/assets/w4.jpg" class="m4" alt="img4">
        </div>
        <div class="dots">
            <label for="img1"></label>
            <label for="img2"></label>
            <label for="img3"></label>
            <label for="img4"></label>
        </div>
    </div>
    <div class="container">
        <h2>About Us</h2>
        <p>At TechPro Solutions, we specialize in providing cutting-edge IT management solutions tailored to meet the evolving needs of modern businesses. With a relentless focus on innovation and efficiency, we empower organizations to optimize their IT infrastructure, streamline operations, and drive sustainable growth.
         
        Our comprehensive suite of services covers every aspect of IT management, from project planning and execution to resource allocation and expense tracking. Leveraging state-of-the-art technologies and industry best practices, we deliver robust solutions that enable our clients to stay ahead in today's fast-paced digital landscape.

        With a team of experienced professionals and a customer-centric approach, we pride ourselves on delivering exceptional value and exceeding expectations. Whether you're a small startup or a large enterprise, we're committed to providing personalized solutions that align with your unique business objectives.

        Partner with TechPro Solutions today and unlock the full potential of your IT resources. Let us be your trusted ally in navigating the complexities of the digital world and driving sustainable success for your business.</p>
    </div>
    
    <!-- Bootstrap scripts (jQuery and Popper.js required for Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Bootstrap footer -->
    <footer class="footer bg-dark text-white">
        <div class="container text-center">
            <span class="text-muted">&copy; 2024 TechPro Solutions. All rights reserved.</span>
        </div>
    </footer>
</body>
</html>
