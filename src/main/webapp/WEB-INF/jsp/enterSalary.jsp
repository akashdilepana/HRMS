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

            .form-container {
                width: 600px;
                margin: auto;
                background: #fff;
                padding: 25px 30px;
                border-radius: 12px;
                box-shadow: 0 0 12px rgba(0,0,0,0.15);
            }
            h2 {
                text-align: center;
                color: #2a41e8;
                margin-bottom: 25px;
            }
            label {
                font-weight: bold;
                display: block;
                margin-top: 15px;
            }
            input[type="text"], input[type="number"] {
                width: 100%;
                padding: 10px;
                border-radius: 8px;
                border: 1px solid #ccc;
                margin-top: 5px;
            }
            input[readonly] {
                background-color: #f1f1f1;
            }
            button {
                margin-top: 25px;
                width: 100%;
                padding: 12px;
                font-size: 16px;
                background-color: #2a41e8;
                color: white;
                border: none;
                border-radius: 10px;
                cursor: pointer;
            }
            button:hover {
                background-color: #1e31b4;
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

                                            <script>
                                                function calculateSalary() {
                                                    let basic = parseFloat(document.getElementById("basic").value) || 0;
                                                    let allowance = parseFloat(document.getElementById("allowance").value) || 0;
                                                    let deduct = parseFloat(document.getElementById("deduct").value) || 0;

                                                    let total = basic + allowance;
                                                    let net = total - deduct;


                                                 document.getElementById("total").value = total.toFixed(2);
                                                 document.getElementById("net").value = net.toFixed(2);}
         
                                              function fetchEmployeeDetails() {
                                              const empId = document.getElementById("searchEmpId").value.trim();

                                               if (empId === "") {
                                                   alert("Please enter an Employee ID");
                                                    return;}

        // Example static data (replace with real AJAX call or DB data)
        const dummyDatabase = {
            "101": "Kamal Perera",
            "102": "Nimal Silva",
            "103": "Sunil Fernando"
        };

        const nameField = document.getElementById("employeeName");
        const detailsDiv = document.getElementById("employeeDetails");

        if (dummyDatabase[empId]) {
            nameField.value = dummyDatabase[empId];
            nameField.readOnly = true;
            detailsDiv.style.display = "block";
        } else {
            alert("Employee not found!");
            detailsDiv.style.display = "none";
        }
    }

    function enableEdit() {
        document.getElementById("employeeName").readOnly = false;
        document.getElementById("employeeName").focus();
    }



                                                    document.getElementById("total").value = total.toFixed(2);
                                                    document.getElementById("net").value = net.toFixed(2);
                                                }

                                            </script>


                                            <div class="form-container">
                                                <h2>Add Salary Details</h2>
                                            


                                                <hr style="margin: 20px 0;">

                                                <h6><b>🔍 Search Another Employee</b></h6>
                                                <div class="row-group">
                                                    
                                                        <label>Search by Employee ID</label>
                                                        <input type="text" id="searchEmpId" placeholder="Enter ID to search...">

                                                        
                                                            
                                                            </div>
                                                            <div style="flex: 1; display: flex; align-items: flex-direction: column; gap: 10px; width: fit-content; end;">
                                                                <button
                                                                    type="button" 
                                                                    onclick="fetchEmployeeDetails()"
                                                                    style="padding: 4px 8px; font-size: 14px; background-color: #008bff; color: white; border: none; border-radius: 4px; cursor: pointer; width: 100px;"
                                                                    >
                                                                    🔍 Search 
                                                                </button>
                                                                <br> 
                                                                <br>
                                                                <div style="flex: 2; display: flex; align-items: end;">
                                                                    <button
                                                                        type="button" 
                                                                        onclick="enableEdit()"
                                                                        style="padding: 4px 8px; font-size: 14px; background-color: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; width: 100px;"
                                                                        >
                                                                        ✏️ Edit

                                                                </div>
                                                            </div>
                                                            <br>

                                                            <hr style="margin: 20px 0;">

                                                            <h6><b>➕ Add New Employee</b></h6>
                                                            <br>


                                                            <div>
                                                                <div style="display: flex; justify-content: space-between; gap: 20px;">
                                                                    <div style="flex: 1;">
                                                                        <label>Added Date</label>
                                                                        <input type="date" name="addedDate" required style="width: 100%; padding: 10px; border-radius: 8px; border: 1px solid #ccc;">
                                                                    </div>

                                                                    <div style="flex: 1;">
                                                                        <label>Salary Year</label>
                                                                        <select name="year" required style="width: 100%; padding: 10px; border-radius: 8px; border: 1px solid #ccc;">
                                                                             <option value="select year">Select Year</option>
                                                                            <option value="2025">2025</option>
                                                                            <option value="2024">2024</option>
                                                                            <option value="2023">2023</option>
                                                                        </select>
                                                                    </div>

                                                                    <div style="flex: 1;">
                                                                        <label>Salary Month</label>
                                                                        <select name="month" required style="width: 100%; padding: 10px; border-radius: 8px; border: 1px solid #ccc;">
                                                                            <option value="select month">Select Month</option>
                                                                            <option value="January">January</option>
                                                                            <option value="February">February</option>
                                                                            <option value="March">March</option>
                                                                            <option value="April">April</option>
                                                                            <option value="May">May</option>
                                                                            <option value="June">June</option>
                                                                            <option value="July">July</option>
                                                                            <option value="August">August</option>
                                                                            <option value="September">September</option>
                                                                            <option value="October">October</option>
                                                                            <option value="November">November</option>
                                                                            <option value="December">December</option>
                                                                        </select>
                                                                    </div>
                                                                </div>


                                                                <form action="AddSalaryServlet" method="post">
                                                                    <label>Employee ID</label>
                                                                    <input type="text" name="empId" required>

                                                                    <label>Employee Name</label>
                                                                    <input type="text" name="empName" required>

                                                                    <label>Designation / Job Title</label>
                                                                    <input type="text" name="designation" required>

                                                                    <label>Basic Salary</label>
                                                                    <input type="number" name="basic" id="basic" oninput="calculateSalary()" required>

                                                                    <label>Allowances</label>
                                                                    <input type="number" name="allowance" id="allowance" oninput="calculateSalary()" required>

                                                                    <label>Total Salary</label>
                                                                    <input type="number" name="total" id="total" readonly>

                                                                    <label>Deductions</label>
                                                                    <input type="number" name="deduct" id="deduct" oninput="calculateSalary()">

                                                                    <label>Net Salary</label>
                                                                    <input type="number" name="net" id="net" readonly>

                                                                    <button type="submit">💾 Save Salary Entry</button>
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
        <%@include file="jspf/scripts.jspf" %>
        <script type="text/javascript" src="files/js/slimselect.js"></script>
        <script type="text/javascript" src="files/js/datatables.min.js"></script>
        <script type="text/javascript" src="files/js/sweetalert2.js"></script>
        <script type="text/javascript" src="files/js/func.js"></script>
        <script type="text/javascript" src="files/js/autoNumeric.js"></script>
        <script type="text/javascript" src="files/js/dataTables.responsive.min.js"></script>


    </body>
</html>