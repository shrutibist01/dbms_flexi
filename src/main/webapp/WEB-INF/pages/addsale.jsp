<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--add sales-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Sale</title>
    <style>
        /* Universal box-sizing to avoid layout issues */
        * {
            box-sizing: border-box;
        }

        /* Background and font styles for the body */
        body {
            font-family: 'Open Sans', Helvetica, Arial, sans-serif;
            background: url(http://farm8.staticflickr.com/7064/6858179818_5d652f531c_h.jpg) no-repeat center center fixed; 
            background-size: cover;
        }

        /* Custom color variables */
        :root {
            --grey: #2a2a2a;
            --blue: #1fb5bf;
        }

        /* Centered container for the form */
        .log-form {
            width: 40%;
            min-width: 320px;
            max-width: 475px;
            background: #fff;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            box-shadow: 0px 2px 5px rgba(0, 0, 0, .25);
        }

        /* Responsive adjustments */
        @media (max-width: 40em) {
            .log-form {
                width: 95%;
                position: relative;
                margin: 2.5% auto 0 auto;
                left: 0%;
                transform: translate(0%, 0%);
            }
        }

        /* Form styles */
        .log-form form {
            padding: 2em;
            display: block;
            width: 100%;
        }

        /* Header styles */
        .log-form h2 {
            background: var(--grey);
            color: lighten(var(--grey), 20%);
            font-family: 'Open Sans Condensed';
            font-size: 1.35em;
            padding: .75em 1em;
            box-shadow: inset 0px 1px 1px rgba(255, 255, 255, 0.05);
            border: 1px solid darken(var(--grey), 5%);
            text-transform: uppercase;
            margin: 0;
            font-weight: 200;
        }

        /* Input styles */
        .log-form input {
            width: 100%;
            margin-bottom: 2em;
            padding: .5em 0;
            border-bottom: 1px solid #eaeaea;
            color: #757575;
            &:focus {
                outline: none;
            }
            color:black
        }

        /* Button styles with hover effect */
        .btn {
            display: inline-block;
            padding: .5em 2em;
            color: white;
            border: 1px solid darken(var(--blue), 5%);
            background-color: #0A6EBD; /* Default background color */
            transition: background-color 0.3s; /* Smooth transition on hover */
        }

        .btn:hover {
            background-color: #C4E4FF; /* Change color on hover */
            color: black; /* Change text color */
        }
    </style>
</head>
<body style="background-color: #6895D2;">
        
    <div class="log-form" style="background-color:rgba(255,255,255,0.5)">
       <h2 style="background-color: #0A6EBD; color: #F6F5F2; font-family: 'Inter UI', sans-serif; font-style: bold;">Add Sales</h2>
  
          <form action="/addsale" method="post">
              <label for="saleID">Sale ID:</label><br>
              <input type="text" id="saleID" name="saleID" style="background-color: #F6F5F2;"><br>
              <label for="projectID">Project ID:</label><br>
              <input type="text" id="projectID" name="projectID" style="background-color: #F6F5F2;"><br>
              <label for="profit">Profit:</label><br>
              <input type="text" id="profit" name="profit" style="background-color: #F6F5F2;"><br>
              <button type="submit" class="btn" ">Submit</button>
 
    </div>
    
    
    


</body>
</html>