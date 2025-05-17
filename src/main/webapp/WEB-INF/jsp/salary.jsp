<%-- 
    Document   : salary
    Created on : May 3, 2025, 9:58:08 PM
    Author     : rusir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

                                                <!-- Header -->
                                                <div class="header">
                                                    <img src="employee_avatar.png" alt="Employee Photo">
                                                    <div>
                                                        <h2>Tharushi Senanayake</h2>
                                                        <p>ID: 1001 | Director</p>
                                                        <p>Tax ID (TIN): 456789123V</p>
                                                        <div class="tags">
                                                            <span>Management</span>
                                                            <span>Full time</span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Period Info -->
                                                <div class="box">
                                                    <div>
                                                        <strong>Period Name:</strong><br> May 2025
                                                    </div>
                                                    <div>
                                                        <strong>Pay Date:</strong><br> May 10, 2025
                                                    </div>
                                                    <div>
                                                        <strong>Currency:</strong><br> Sri Lankan Rupees (LKR)
                                                    </div>
                                                </div>

                                                <!-- Bank Details -->
                                                <div class="box">
                                                    <div>
                                                        <strong>Bank Name:</strong><br> People's Bank
                                                    </div>
                                                    <div>
                                                        <strong>Account No:</strong><br> 123-456-7890
                                                    </div>
                                                    <div>
                                                        <strong>IFSC/Branch Code:</strong><br> PB1234
                                                    </div>
                                                </div>

                                                <!-- Earnings & Deductions -->
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <th>Earnings</th>
                                                            <th>Amount (LKR)</th>
                                                            <th>Deductions</th>
                                                            <th>Amount (LKR)</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Basic Pay</td>
                                                            <td>45,300.00</td>
                                                            <td>Professional Tax</td>
                                                            <td>200.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Dearness Allowance</td>
                                                            <td>11,325.00</td>
                                                            <td>Provident Fund</td>
                                                            <td>1,800.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td>House Rent Allowance</td>
                                                            <td>18,875.00</td>
                                                            <td>Other Deduction</td>
                                                            <td>5,931.00</td>
                                                        </tr>
                                                        <tr style="font-weight: bold; background: #f1f8e9;">
                                                            <td>Total Earnings</td>
                                                            <td>75,500.00</td>
                                                            <td>Total Deductions</td>
                                                            <td>7,931.00</td>
                                                        </tr>
                                                        <tr style="font-weight: bold; background: #d0f0c0;">
                                                            <td colspan="2">Net Pay (Rounded)</td>
                                                            <td colspan="2">67,569.00</td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                                <!-- Additional Notes -->
<!--                                                <div class="footer">
                                                    <p><strong>Notes:</strong></p>
                                                    <ul>
                                                        <li>Net pay has been rounded to the nearest whole number.</li>
                                                        <li>This salary slip is computer-generated and does not require a signature.</li>
                                                        <li>Taxes and deductions are as per government rules applicable for the period.</li>
                                                        <li>Bank account has been credited on pay date.</li>
                                                    </ul>
                                                </div>-->

                                                <!-- QR Code -->
                                                <div class="qr">
                                                    <img src="https://api.qrserver.com/v1/create-qr-code/?size=120x120&data=Tharushi1001May2025" alt="QR Code">
                                                </div>

                                                <!-- Print Button -->
                                                <button class="print-btn" onclick="window.print()">Print Salary Slip</button>

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
