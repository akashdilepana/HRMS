<%-- 
    Document   : salary
    Created on : May 3, 2025, 9:58:08 PM
    Author     : rusir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Salary Slip - May 2025</title>
        <%@include file="jspf/header.jspf" %>

    </head>
    <body>
        <style>
            /*            body {
                            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                            background: #f0f4f8;
                            margin: 0;
                            padding: 20px;
                            color: #333;
                        }*/
            .container {
                background: white;
                max-width: 900px;
                margin: auto;
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0 8px 24px rgba(0,0,0,0.1);
            }
            .header {
                display: flex;
                align-items: center;
                margin-bottom: 30px;
                border-bottom: 2px solid #e0e0e0;
                padding-bottom: 15px;
            }
            .header img {
                border-radius: 50%;
                width: 100px;
                height: 100px;
                margin-right: 20px;
                border: 4px solid #007bff;
            }
            .header h2 {
                margin: 0;
                font-size: 24px;
                color: #007bff;
            }
            .tags span {
                background: #e3f2fd;
                color: #007bff;
                padding: 5px 12px;
                border-radius: 20px;
                margin-right: 5px;
                font-size: 12px;
                display: inline-block;
                margin-top: 5px;
            }
            .box {
                display: flex;
                justify-content: space-between;
                background: #fafafa;
                padding: 15px;
                margin: 15px 0;
                border-radius: 8px;
                border: 1px solid #e0e0e0;
            }
            .box div {
                flex: 1;
                padding: 0 10px;
            }
            .box div strong {
                color: #555;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 30px;
            }
            th {
                background: #007bff;
                color: white;
                text-align: left;
                padding: 12px;
                font-size: 14px;
            }
            td {
                text-align: left;
                padding: 12px;
                border-bottom: 1px solid #eee;
                font-size: 14px;
            }
            tr:hover {
                background: #f9f9f9;
            }
            .footer {
                margin-top: 30px;
                font-size: 13px;
                color: #555;
            }
            .footer ul {
                margin: 10px 0 0 20px;
                padding: 0;
            }
            .print-btn {
                background: #28a745;
                color: white;
                border: none;
                padding: 12px 25px;
                border-radius: 30px;
                cursor: pointer;
                margin-top: 20px;
                font-size: 16px;
                box-shadow: 0 4px 10px rgba(0,0,0,0.1);
                transition: background 0.3s;
            }
            .print-btn:hover {
                background: #218838;
            }
            .qr {
                text-align: right;
                margin-top: 20px;
            }
            .qr img {
                border: 4px solid #e0e0e0;
                border-radius: 10px;
            }

            .container {
                width: 500px;
                margin: 60px auto;
                padding: 30px;
                background: #ffffff;
                box-shadow: 0 0 15px rgba(0,0,0,0.2);
                border-radius: 12px;
            }
            h2 {
                text-align: center;
                color: #007bff;
                margin-bottom: 20px;
            }
            label {
                display: block;
                margin-top: 12px;
                font-weight: bold;
            }
            input[type="text"], input[type="number"] {
                width: 100%;
                padding: 10px;
                margin-top: 6px;
                border: 1px solid #ccc;
                border-radius: 6px;
                box-sizing: border-box;
                font-size: 14px;
            }
            input[type="submit"] {
                margin-top: 20px;
                width: 100%;
                padding: 12px;
                background: #007bff;
                color: white;
                border: none;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                border-radius: 8px;
            }
            input[type="submit"]:hover {
                background: #0056b3;
            }

        </style>
        <%@include file="jspf/loader.jspf" %>
        <div id="pcoded" class="pcoded">
            <div class="pcoded-overlay-box"></div>
            <div class="pcoded-container navbar-wrapper">
                <%@include file="jspf/navbar.jspf" %>
                <div class="pcoded-main-container">
                    <div class="pcoded-wrapper">
                        <%@include file="jspf/sidenav.jspf"%>
                        <div class="pcoded-content">
                            <div class="pcoded-inner-content">
                                <div class="main-body">
                                    <div class="page-wrapper">
                                        <div class="page-body">
                                            <%-- dont edit above lines--%>
                                            <div class="container">
                                                <h2>Salary Entry Sheet</h2>
                                                <form action="AddSalaryServlet" method="post">
                                                    <label for="empId">Employee ID:</label>
                                                    <input type="text" id="empId" name="empId" required>

                                                    <label for="empName">Employee Name:</label>
                                                    <input type="text" id="empName" name="empName" required>

                                                    <label for="designation">Designation:</label>
                                                    <input type="text" id="designation" name="designation" required>

                                                    <label for="basicSalary">Basic Salary:</label>
                                                    <input type="number" id="basicSalary" name="basicSalary" required>

                                                    <label for="allowance">Allowance:</label>
                                                    <input type="number" id="allowance" name="allowance" required>

                                                    <label for="deductions">Deductions:</label>
                                                    <input type="number" id="deductions" name="deductions" required>

                                                    <input type="submit" value="Add Salary">
                                                </form>
                                            </div>



                                            <%-- dont edit below lines--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="jspf/scripts.jspf" %>
        <script type="text/javascript" src="files/js/slimselect.js"></script>
        <script type="text/javascript" src="files/js/datatables.min.js"></script>
        <script type="text/javascript" src="files/js/sweetalert2.js"></script>
        <script type="text/javascript" src="files/js/func.js"></script>
        <script type="text/javascript" src="files/js/autoNumeric.js"></script>
        <script type="text/javascript" src="files/js/dataTables.responsive.min.js"></script>


    </body>
</html>
