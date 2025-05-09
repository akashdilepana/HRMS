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

                                                <table class="salary-table">
                                                    <thead>
                                                        <tr>
                                                            <th class="sn-column">#</th>
                                                            <th class="id-column">Employee ID</th>
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
                                                        <!-- Rows will be added dynamically -->
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
        <%@include file="jspf/scripts.jspf" %>
        <script type="text/javascript" src="files/js/slimselect.js"></script>
        <script type="text/javascript" src="files/js/datatables.min.js"></script>
        <script type="text/javascript" src="files/js/sweetalert2.js"></script>
        <script type="text/javascript" src="files/js/func.js"></script>
        <script type="text/javascript" src="files/js/autoNumeric.js"></script>
        <script type="text/javascript" src="files/js/dataTables.responsive.min.js"></script>
        <script>
                                                            window.onload = function () {
                                                                // Set current date
                                                                const today = new Date();
                                                                document.getElementById('dateInput').valueAsDate = today;

                                                                // Set current month
                                                                const monthNames = ["January", "February", "March", "April", "May", "June",
                                                                    "July", "August", "September", "October", "November", "December"];
                                                                document.getElementById('monthSelect').value = monthNames[today.getMonth()];

                                                                // Add 3 sample rows
                                                                for (let i = 0; i < 3; i++) {
                                                                    addRow();
                                                                }

                                                                // Add search functionality
                                                                document.getElementById('searchInput').addEventListener('input', function () {
                                                                    const searchTerm = this.value.toLowerCase();
                                                                    const rows = document.querySelectorAll('#salaryTableBody tr');

                                                                    rows.forEach(row => {
                                                                        const name = row.querySelector('.employee-name').value.toLowerCase();
                                                                        const id = row.querySelector('.employee-id').value.toLowerCase();
                                                                        if (name.includes(searchTerm) || id.includes(searchTerm)) {
                                                                            row.style.display = '';
                                                                        } else {
                                                                            row.style.display = 'none';
                                                                        }
                                                                    });
                                                                });
                                                            };

                                                            let rowCount = 0;
                                                            let lastEmployeeId = 1000; // Starting employee ID

                                                            function addRow() {
                                                                rowCount++;
                                                                lastEmployeeId++;

                                                                const tbody = document.getElementById('salaryTableBody');
                                                                const row = document.createElement('tr');

                                                                // Generate a random employee name for demo purposes
                                                                const firstNames = ["John", "Sarah", "Michael", "Emily", "David", "Jessica", "Robert", "Jennifer"];
                                                                const lastNames = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Miller", "Davis", "Garcia"];
                                                                const randomName = ${firstNames[Math.floor(Math.random() * firstNames.length)]}
            ${lastNames[Math.floor(Math.random() * lastNames.length)]};
                                                                // Generate a random basic salary between 30000 and 80000
                                                                const randomSalary = Math.floor(Math.random() * 50000) + 30000;

                                                                // Generate employee ID
                                                                const employeeId = EMP${lastEmployeeId};

                                                                row.innerHTML = `
                    <td class="sn-column">${rowCount}</td>
                    <td><input type="text" class="input-field employee-id" placeholder="Employee ID" value="${employeeId}"></td>
                    <td><input type="text" class="input-field employee-name" placeholder="Employee Name" value="${randomName}"></td>
                    <td><input type="number" class="input-field basic-salary" placeholder="0" value="${randomSalary}"></td>
                    <td><input type="number" class="input-field allowances" placeholder="0" readonly></td>
                    <td><input type="number" class="input-field total-salary" placeholder="0" readonly></td>
                    <td><input type="number" class="input-field deductions" placeholder="0" readonly></td>
                    <td><input type="number" class="input-field net-salary" placeholder="0" readonly></td>
                    <td class="print-hide">
                        <button class="btn-icon" onclick="calculateRow(this.parentNode.parentNode)" title="Calculate">
                            <i class="fas fa-calculator"></i>
                        </button>
                        <button class="btn-icon" onclick="deleteRow(this)" title="Delete">
                            <i class="fas fa-trash"></i>
                        </button>
                    </td>
                `;

                                                                const basicInput = row.querySelector('.basic-salary');
                                                                basicInput.addEventListener('input', () => calculateRow(row));

                                                                tbody.appendChild(row);
                                                                calculateRow(row); // Calculate the new row immediately
                                                            }

                                                            function calculateRow(row) {
                                                                const basicSalary = parseFloat(row.querySelector('.basic-salary').value) || 0;

                                                                // Calculate allowances (example: 50% of basic salary)
                                                                const allowances = basicSalary * 0.5;

                                                                // Calculate total salary
                                                                const totalSalary = basicSalary + allowances;

                                                                // Calculate deductions (example: 12% of basic salary)
                                                                const deductions = basicSalary * 0.12;

                                                                // Calculate net salary
                                                                const netSalary = totalSalary - deductions;

                                                                row.querySelector('.allowances').value = allowances.toFixed(2);
                                                                row.querySelector('.total-salary').value = totalSalary.toFixed(2);
                                                                row.querySelector('.deductions').value = deductions.toFixed(2);
                                                                row.querySelector('.net-salary').value = netSalary.toFixed(2);
                                                            }

                                                            function calculateAll() {
                                                                const rows = document.querySelectorAll('#salaryTableBody tr');
                                                                rows.forEach(row => calculateRow(row));

                                                                // Show a temporary success message
                                                                const originalText = document.querySelector('.btn-success i').nextSibling.textContent;
                                                                const successBtn = document.querySelector('.btn-success');
                                                                successBtn.innerHTML = '<i class="fas fa-check"></i> Calculated!';

                                                                setTimeout(() => {
                                                                    successBtn.innerHTML = '<i class="fas fa-calculator"></i> ' + originalText;
                                                                }, 2000);
                                                            }

                                                            function deleteRow(button) {
                                                                const row = button.parentNode.parentNode;
                                                                row.parentNode.removeChild(row);

                                                                // Update serial numbers
                                                                const rows = document.querySelectorAll('#salaryTableBody tr');
                                                                rows.forEach((row, index) => {
                                                                    row.cells[0].textContent = index + 1;
                                                                });

                                                                rowCount = rows.length;
                                                            }

        </script>
    </body>
</html>
