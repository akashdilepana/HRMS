<%-- 
    Document   : sallarySheet
    Created on : May 8, 2025, 11:44:00 AM
    Author     : gayat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="jspf/header.jspf" %>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Modern Salary Sheet</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body>
        <style>
            :root {
                --primary: #4361ee;
                --primary-light: #eef2ff;
                --secondary: #3f37c9;
                --dark: #1e293b;
                --light: #f8fafc;
                --gray: #94a3b8;
                --success: #10b981;
                --danger: #ef4444;
                --warning: #f59e0b;
            }

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }



            .container {
                max-width: 1200px;
                margin: 0 auto;
            }

            .header {
                text-align: center;
                margin-bottom: 2.5rem;
                position: relative;
            }

            .header::after {
                content: '';
                position: absolute;
                bottom: -1rem;
                left: 50%;
                transform: translateX(-50%);
                width: 120px;
                height: 4px;
                background: linear-gradient(90deg, var(--primary), var(--secondary));
                border-radius: 2px;
            }

            .title {
                font-size: 2.5rem;
                font-weight: 700;
                color: var(--dark);
                margin-bottom: 0.5rem;
                background: linear-gradient(90deg, var(--primary), var(--secondary));
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                display: inline-block;
            }

            .company-name {
                font-size: 1.25rem;
                font-weight: 600;
                color: var(--primary);
                background-color: var(--primary-light);
                padding: 0.75rem 2rem;
                border-radius: 50px;
                display: inline-block;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            }

            .controls {
                display: flex;
                flex-wrap: wrap;
                gap: 1rem;
                margin-bottom: 2rem;
                padding: 1rem;
                background-color: white;
                border-radius: 12px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            }

            .btn {
                padding: 0.75rem 1.5rem;
                border: none;
                border-radius: 8px;
                font-weight: 500;
                cursor: pointer;
                transition: all 0.2s ease;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
            }

            .btn-primary {
                background-color: var(--primary);
                color: white;
            }

            .btn-primary:hover {
                background-color: var(--secondary);
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(67, 97, 238, 0.2);
            }

            .btn-success {
                background-color: var(--success);
                color: white;
            }

            .btn-success:hover {
                background-color: #0d9e6f;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(16, 185, 129, 0.2);
            }

            .btn-danger {
                background-color: var(--danger);
                color: white;
            }

            .btn-danger:hover {
                background-color: #dc2626;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(239, 68, 68, 0.2);
            }

            .date-controls {
                display: flex;
                align-items: center;
                gap: 1rem;
                margin-left: auto;
            }

            .date-controls label {
                font-weight: 500;
                color: var(--dark);
            }

            .select-month, .select-year, .input-date {
                padding: 0.5rem 1rem;
                border: 1px solid #e2e8f0;
                border-radius: 8px;
                font-family: 'Inter', sans-serif;
                background-color: white;
                transition: all 0.2s;
            }

            .select-month:focus, .select-year:focus, .input-date:focus {
                outline: none;
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1);
            }

            .salary-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                background-color: white;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            }

            .salary-table thead {
                background-color: var(--primary);
                color: white;
            }

            .salary-table th {
                padding: 1rem;
                text-align: left;
                font-weight: 500;
            }

            .salary-table th:first-child {
                border-top-left-radius: 12px;
            }

            .salary-table th:last-child {
                border-top-right-radius: 12px;
            }

            .salary-table tbody tr {
                transition: all 0.2s;
            }

            .salary-table tbody tr:hover {
                background-color: var(--primary-light);
            }

            .salary-table td {
                padding: 1rem;
                border-bottom: 1px solid #e2e8f0;
            }

            .salary-table tr:last-child td {
                border-bottom: none;
            }

            .input-field {
                width: 100%;
                padding: 0.5rem;
                border: 1px solid #e2e8f0;
                border-radius: 6px;
                font-family: 'Inter', sans-serif;
                transition: all 0.2s;
            }

            .input-field:focus {
                outline: none;
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1);
            }

            .input-field[readonly] {
                background-color: #f8fafc;
                border-color: #e2e8f0;
                color: var(--dark);
                font-weight: 500;
            }

            .sn-column {
                width: 50px;
                text-align: center;
                color: var(--gray);
            }

            .id-column {
                width: 100px;
            }

            .name-column {
                min-width: 200px;
            }

            .amount-column {
                min-width: 120px;
            }

            .print-hide {
                display: flex;
                gap: 1rem;
                flex-wrap: wrap;
            }

            .action-buttons {
                display: flex;
                gap: 0.5rem;
            }

            .btn-icon {
                padding: 0.5rem;
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.2s;
                background: none;
                border: none;
                color: var(--gray);
            }

            .btn-icon:hover {
                background-color: #f1f5f9;
                color: var(--primary);
            }

            .search-container {
                position: relative;
                display: flex;
                align-items: center;
            }

            .search-input {
                padding: 0.75rem 1rem 0.75rem 2.5rem;
                border: 1px solid #e2e8f0;
                border-radius: 8px;
                font-family: 'Inter', sans-serif;
                width: 250px;
                transition: all 0.2s;
            }

            .search-input:focus {
                outline: none;
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1);
            }

            .search-icon {
                position: absolute;
                left: 1rem;
                color: var(--gray);
            }

            .btn-add {
                background-color: var(--primary);
                color: white;
            }

            .btn-add:hover {
                background-color: var(--secondary);
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(67, 97, 238, 0.2);
            }

            @media print {
                .print-hide {
                    display: none;
                }
                body {
                    padding: 0;
                    background-color: white;
                }
                .salary-table {
                    box-shadow: none;
                }
            }

            @media (max-width: 768px) {
                body {
                    padding: 1rem;
                }
                .controls {
                    flex-direction: column;
                }
                .date-controls {
                    margin-left: 0;
                    flex-wrap: wrap;
                }
                .salary-table {
                    display: block;
                    overflow-x: auto;
                }
                .search-input {
                    width: 100%;
                }
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

                                            <div class="container">
                                                <!--                                                <div class="header">
                                                                                                    <h1 class="title">Salary Statement</h1>
                                                                                                    <div class="company-name">ABC Corporation Ltd.</div>
                                                                                                </div>-->

                                                <div class="print-hide controls">
                                                    <div class="search-container">
                                                        <i class="fas fa-search search-icon"></i>
                                                        <input type="text" class="search-input" placeholder="Search employee..." id="searchInput">
                                                    </div>

                                                    <div class="action-buttons">
                                                        <button class="btn btn-success" onclick="calculateAll()">
                                                            <i class="fas fa-calculator"></i> Calculate All
                                                        </button>
                                                        <button class="btn btn-danger" onclick="window.print()">
                                                            <i class="fas fa-print"></i> Print Sheet
                                                        </button>
                                                    </div>

                                                    <div class="date-controls">
                                                        <div>
                                                            <label for="yearSelect"><i class="fas fa-calendar"></i> Year:</label>
                                                            <select id="yearSelect" class="select-year">
                                                                <option value="">Select Year</option>
                                                                <option>2023</option>
                                                                <option>2024</option>
                                                                <option selected>2025</option>
                                                                <option>2026</option>
                                                                <option>2027</option>
                                                            </select>
                                                        </div>
                                                        <div>
                                                            <label for="monthSelect"><i class="fas fa-calendar-alt"></i> Month:</label>
                                                            <select id="monthSelect" class="select-month">
                                                                <option value="">Select Month</option>
                                                                <option>January</option><option>February</option><option>March</option>
                                                                <option>April</option><option>May</option><option>June</option>
                                                                <option>July</option><option>August</option><option>September</option>
                                                                <option>October</option><option>November</option><option>December</option>
                                                            </select>
                                                        </div>
                                                        <div>
                                                            <label for="dateInput"><i class="fas fa-calendar-day"></i> Date:</label>
                                                            <input type="date" id="dateInput" class="input-date">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row" id="tableSection">
                                                    <div class="col-lg-10 offset-lg-1 col-xl-12 offset-xl-0 col-12">
                                                        <div class="card">
                                                            <div class="card-header">
                                                                <h6>Salary</h6>
                                                                <div class="card-header-right">
                                                                    <ul class="list-unstyled card-option">
                                                                        <li><i class="feather icon-maximize full-card"></i></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <div class="card-block p-b-0">
                                                                <div class="table-responsive">
                                                                    <table class="table table-hover table-bordered m-b-0" id="tbll">
                                                                        <thead>
                                                                            <tr>
                                                                                <th class="sn-column">Id</th>
                                                                                <th class="id-column">Employee No</th>
                                                                                <th class="name-column">Employee Name</th>
                                                                                <th class="amount-column">Basic Salary</th>
                                                                                <th class="amount-column">Allowances</th>
                                                                                <th class="amount-column">Total Salary</th>
                                                                                <th class="amount-column">Deductions</th>
                                                                                <th class="amount-column">Net Salary</th>
                                                                                <th class="print-hide">Actions</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="salaryTableBody">

                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

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
        <script>
                                                            $.fn.dataTable.ext.errMode = 'none';

                                                            var dtable = $('#tbll').DataTable({
                                                                "aLengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]],
                                                                "pageLength": 5,
                                                                "ordering": true,
                                                                "autoWidth": false,
                                                                "processing": true,
                                                                "serverSide": true,
                                                                "order": [[0, "desc"]],
                                                                "searchHighlight": true,
                                                                "searchDelay": 350,
                                                                "ajax": {
                                                                    "url": "salary/getsheet",
                                                                    "contentType": "application/json",
                                                                    "type": "POST",
                                                                    "data": function (d) {
                                                                        return JSON.stringify(d);
                                                                    },
                                                                    error: function (xhr, error, code) {
                                                                        console.log(xhr);
                                                                        console.log(code);
                                                                    }
                                                                },
                                                                "columns": [
                                                                    {"data": "id", className: "text-right", "visible": false},
                                                                    {"data": "empNo"},
                                                                    {"data": "empName"},
                                                                    {"data": "basicSalary"},
                                                                    {"data": "allowances"},
                                                                    {"data": "tolSalary"},
                                                                    {"data": "deduction"},
                                                                    {"data": "netSalary"}
                                                                ], "language": {
                                                                    'loadingRecords': '&nbsp;',
                                                                    'processing': '<div class="loader2"></div>'
                                                                }, "createdRow": function (row, data) {
                                                                    let action_td = document.createElement('td');

                                                                }
                                                            });
        </script>
    </body>
</html>
