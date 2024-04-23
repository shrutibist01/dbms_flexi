<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Net Expense</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>

        <style>
            h2,h1 {
                text-align: center;
            }

            body {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                margin: 0;
                padding: 0;
                min-height: 100vh;
                /* Change this line */
            }

            .content {
                width: 80%;
                /* Adjust this value as needed */
            }


            table,
            p {
                margin: 0.5em 0;
                /* Adjust this value as needed */
                padding: 0;
            }

            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 80%;
                margin: 1em auto;
                /* Adjust this value as needed */
            }

            td,
            th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            thead {
                background: #e9e9f0;
                color: #727272;
                border-bottom: solid 2px #c2c2c2;
            }

            tfoot {
                background: #e9f0e9;
                font-weight: 600;
                color: #727272;
                border-top: solid 2px #c2c2c2;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            p {
                text-align: center;
                /* This centers the text within the p elements */
                margin: 0.5em 0;
                /* Adjust this value as needed */
            }

            .highlight {
                font-size: 1.5em;
                /* Increase the font size */
                color: rgb(218, 129, 5);
                /* Change the text color */
                font-weight: bold;
                /* Make the text bold */
            }

            button.print-button {
                width: 100px;
                height: 100px;
            }

            span.print-icon,
            span.print-icon::before,
            span.print-icon::after,
            button.print-button:hover .print-icon::after {
                border: solid 4px #333;
            }

            span.print-icon::after {
                border-width: 2px;
            }

            button.print-button {
                position: relative;
                padding: 0;
                border: 0;

                border: none;
                background: transparent;
            }

            span.print-icon,
            span.print-icon::before,
            span.print-icon::after,
            button.print-button:hover .print-icon::after {
                box-sizing: border-box;
                background-color: #fff;
            }

            span.print-icon {
                position: relative;
                display: inline-block;
                padding: 0;
                margin-top: 20%;

                width: 60%;
                height: 35%;
                background: #fff;
                border-radius: 20% 20% 0 0;
            }

            span.print-icon::before {
                content: "";
                position: absolute;
                bottom: 100%;
                left: 12%;
                right: 12%;
                height: 110%;

                transition: height .2s .15s;
            }

            span.print-icon::after {
                content: "";
                position: absolute;
                top: 55%;
                left: 12%;
                right: 12%;
                height: 0%;
                background: #fff;
                background-repeat: no-repeat;
                background-size: 70% 90%;
                background-position: center;
                background-image: linear-gradient(to top,
                    #fff 0, #fff 14%,
                    #333 14%, #333 28%,
                    #fff 28%, #fff 42%,
                    #333 42%, #333 56%,
                    #fff 56%, #fff 70%,
                    #333 70%, #333 84%,
                    #fff 84%, #fff 100%);

                transition: height .2s, border-width 0s .2s, width 0s .2s;
            }

            button.print-button:hover {
                cursor: pointer;
            }

            button.print-button:hover .print-icon::before {
                height: 0px;
                transition: height .2s;
            }

            button.print-button:hover .print-icon::after {
                height: 120%;
                transition: height .2s .15s, border-width 0s .16s;
            }
        </style>
    </head>

    <body>
        <div class="content">
            <h1>Net Expense Data</h1>

            <h2>Employees Data</h2>
            <table border="1">
                <tr>
                    <th>Employee ID</th>
                    <th>Employee Name</th>
                    <th>Salary</th>
                </tr>
                <c:forEach items="${employeesData}" var="employee">
                    <tr>
                        <td>${employee.EmployeeID}</td>
                        <td>${employee.EmployeeName}</td>
                        <td>${employee.Salary} Lakhs</td>
                    </tr>
                </c:forEach>
            </table>
            <p>Subtotal: ${subtotals.employee} Lakhs</p>

            <h2>Projects Data</h2>
            <table border="1">
                <tr>
                    <th>Project ID</th>
                    <th>Project Name</th>
                    <th>Expenses</th>
                </tr>
                <c:forEach items="${projectData}" var="project">
                    <tr>
                        <td>${project.PID}</td>
                        <td>${project.Pname}</td>
                        <td>${project.expenses} Lakhs</td>
                    </tr>
                </c:forEach>
            </table>
            <p>Subtotal: ${subtotals.project} Lakhs</p>

            <h2>Funds Data</h2>
            <table border="1">
                <tr>
                    <th>Transaction ID</th>
                    <th>Investor Name</th>
                    <th>Amount</th>
                </tr>
                <c:forEach items="${fundsData}" var="fund">
                    <tr>
                        <td>${fund.TransactionID}</td>
                        <td>${fund.InvestorName}</td>
                        <td>${fund.Amount} Lakhs</td>
                    </tr>
                </c:forEach>
            </table>
            <p>Subtotal: ${subtotals.funds} Lakhs</p>

            <h2>Marketing Data</h2>
            <table border="1">
                <tr>
                    <th>Marketing ID</th>
                    <th>Name</th>
                    <th>Amount</th>
                </tr>
                <c:forEach items="${marketingData}" var="marketing">
                    <tr>
                        <td>${marketing.MarketingID}</td>
                        <td>${marketing.Name}</td>
                        <td>${marketing.Amount} Lakhs</td>
                    </tr>
                </c:forEach>
            </table>
            <p>Subtotal: ${subtotals.marketing} Lakhs</p>

            <h2>Extra Expenses Data</h2>
            <table border="1">
                <tr>
                    <th>Expense ID</th>
                    <th>Purpose</th>
                    <th>Amount</th>
                </tr>
                <c:forEach items="${extraExpenseData}" var="expense">
                    <tr>
                        <td>${expense.ExpenseID}</td>
                        <td>${expense.Purpose}</td>
                        <td>${expense.Amount} Lakhs</td>
                    </tr>
                </c:forEach>
            </table>
            <p>Subtotal: ${subtotals.extra} Lakhs</p>

            <h2>Sales Data</h2>
            <table border="1">
                <tr>
                    <th>Sale ID</th>
                    <th>Profit</th>
                </tr>
                <c:forEach items="${salesData}" var="sale">
                    <tr>
                        <td>${sale.SaleID}</td>
                        <td>${sale.profit} Lakhs</td>
                    </tr>
                </c:forEach>
            </table>
            <p>Subtotal: ${subtotals.sales} Lakhs</p>
            <p class="highlight">Net Profit/Loss: ${result} Lakhs</p>
        </div>
        <button onclick="printPDF()" class="print-button"><span class="print-icon">Print</span></button>

        <script>
            function printPDF() {
                const element = document.body; // Choose the element you want to print

                html2pdf()
                        .from(element)
                        .save('document.pdf');
            }
        </script>

    </body>

</html>