<%-- Document : addfunds Created on : Apr 19, 2024, 11:26:11 PM Author : sandi --%>
  
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <html>

        <head>
            <title>Add Funds</title>
            <style>
                h1 {
                    font-family: Georgia, serif;
                }

                .container {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 99vh;
                    width: 80%;
                    text-align: center;
                    font-family: Georgia, serif;
                    font-size: large;
                    margin-left: auto;
                    margin-right: auto;
                    margin-top: -50px;
                }

                .employee-details {
                    padding: 50px;
                    margin: 2%;
                    background-color: #1c82d646;
                    border-radius: 10px;
                    width: 60%;
                    border-style: outset;
                    font-family: 'Lato';
                }

                .form-field {
                    display: flex;
                    justify-content: flex-start;
                    /* Align the contents to the start */
                    align-items: center;
                    margin-bottom: 20px;
                    margin-right: 170px;
                }

                .form-field label {
                    flex: 1;
                    text-align: right;
                    margin-right: 10px;
                }

                .form-field input,
                .form-field textarea {
                    flex: 2;
                    height: 30px;
                    width: 100%;
                    /* Adjust this value to change the width */
                }

                .custom-btn {
                    width: 130px;
                    height: 40px;
                    color: #fff;
                    border-radius: 5px;
                    padding: 10px 25px;
                    font-family: 'Lato', sans-serif;
                    font-weight: 500;
                    background: transparent;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    position: relative;
                    display: inline-block;
                    box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
                        7px 7px 20px 0px rgba(0, 0, 0, .1),
                        4px 4px 5px 0px rgba(0, 0, 0, .1);
                    outline: none;
                }

                .btn-6 {
                    background: rgb(247, 150, 192);
                    background: radial-gradient(circle, rgba(247, 150, 192, 1) 0%, rgba(118, 174, 241, 1) 100%);
                    line-height: 42px;
                    padding: 0;
                    border: none;
                }

                .btn-6 span {
                    position: relative;
                    display: block;
                    width: 100%;
                    height: 100%;
                }

                .btn-6:before,
                .btn-6:after {
                    position: absolute;
                    content: "";
                    height: 0%;
                    width: 1px;
                    box-shadow:
                        -1px -1px 20px 0px rgba(255, 255, 255, 1),
                        -4px -4px 5px 0px rgba(255, 255, 255, 1),
                        7px 7px 20px 0px rgba(0, 0, 0, .4),
                        4px 4px 5px 0px rgba(0, 0, 0, .3);
                }

                .btn-6:before {
                    right: 0;
                    top: 0;
                    transition: all 500ms ease;
                }

                .btn-6:after {
                    left: 0;
                    bottom: 0;
                    transition: all 500ms ease;
                }

                .btn-6:hover {
                    color: #ab1acc;
                    /* Change the text color on hover */
                    background: transparent;
                    box-shadow: none;
                    border: 2px solid #4f69de9e;
                    /* Add a border on hover */
                }

                .btn-6:hover:before {
                    transition: all 500ms ease;
                    height: 100%;
                }

                .btn-6:hover:after {
                    transition: all 500ms ease;
                    height: 100%;
                }

                .btn-6 span:before,
                .btn-6 span:after {
                    position: absolute;
                    content: "";
                    box-shadow:
                        -1px -1px 20px 0px rgba(255, 255, 255, 1),
                        -4px -4px 5px 0px rgba(255, 255, 255, 1),
                        7px 7px 20px 0px rgba(0, 0, 0, .4),
                        4px 4px 5px 0px rgba(0, 0, 0, .3);
                }

                .btn-6 span:before {
                    left: 0;
                    top: 0;
                    width: 0%;
                    height: .5px;
                    transition: all 500ms ease;
                }

                .btn-6 span:after {
                    right: 0;
                    bottom: 0;
                    width: 0%;
                    height: .5px;
                    transition: all 500ms ease;
                }

                .btn-6 span:hover:before {
                    width: 100%;
                }

                .btn-6 span:hover:after {
                    width: 100%;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="employee-details">
                    <h1>Add Funds</h1>
                    <form method="post" action="/addfunds">
                        <div class="form-field">
                        <label for="transactionID">Transaction ID:</label>
                        <input type="text" id="transactionID" name="transactionID" required><br>
                        </div>
                        <div class="form-field">
                        <label for="InvestorName">Investor Name:</label>
                        <input type="text" id="InvestorName" name="InvestorName" required><br>
                        </div>
                        <div class="form-field">
                        <label for="amount">Amount:</label>
                        <input type="number" id="amount" name="amount" required><br>
                        </div>
                        <input type="submit" value="Add Funds" class="custom-btn btn-6">
                    </form>
                </div>
            </div>
        </body>

        </html>