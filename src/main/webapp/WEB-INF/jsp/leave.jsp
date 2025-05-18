<%-- 
    Document   : adminDashboard
    Created on : Apr 3, 2025, 1:55:34 PM
    Author     : rusir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="jspf/header.jspf" %>

    </head>
    <body>
        <%@include file="jspf/loader.jspf" %>
        <style>
            .attendance-entry {
                background: #f8f9fa;
                border-left: 4px solid #007bff;
                padding: 5px 8px;
                border-radius: 6px;
                font-size: 12px;
                font-family: 'Segoe UI', sans-serif;
                box-shadow: 0 1px 4px rgba(0, 0, 0, 0.08);
            }

            .in-time {
                color: #198754;
                font-weight: 600;
            }

            .out-time {
                color: #dc3545;
                font-weight: 600;
            }

            .fc-day-today {
                background-color: #e6fffa !important;
                border: 1px solid #17a2b8 !important;
            }
             body { margin: 20px; font-family: Arial, sans-serif; }
        .leave-container { display: flex; gap: 20px; }
        .leave-form { flex: 2; }
        .leave-balance { flex: 1; background-color: #f8f9fa; padding: 15px; border-radius: 8px; }
        label { font-weight: bold; margin-top: 10px; }
        </style>
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
                                            
                                            <!-- leave page -->
                                            <h2>Leave Application</h2>
<div class="leave-container">
    <div class="leave-form">
        <form>
            <div class="mb-3">
                <label for="leaveYear">Leave Year</label>
                <select id="leaveYear" class="form-select">
                    <option value="2025">2025</option>
                    <option value="2024">2024</option>
                    <option value="2023">2023</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="leaveType">Leave Type</label>
                <select id="leaveType" class="form-select">
                    <option>Annual Leave</option>
                    <option>Casual Leave</option>
                    <option>Duty Out of Office</option>
                    <option>Lieu Leave</option>
                    <option>Sick/Medical Leave</option>
                </select>
            </div>

            <div class="mb-3">
                <label>From Date</label>
                <input type="date" class="form-control">
            </div>

            <div class="mb-3">
                <label>To Date</label>
                <input type="date" class="form-control">
            </div>

            <div class="mb-3">
                <label>Attachment</label>
                <input type="file" class="form-control">
            </div>

            <div class="mb-3">
                <label>Comments</label>
                <textarea class="form-control"></textarea>
            </div>

            <div class="mb-3">
                <label>Approver</label>
                <input type="text" class="form-control" placeholder="Enter Approver">
            </div>

            <button class="btn btn-success">Apply</button>
            <button type="reset" class="btn btn-secondary">Reset</button>
        </form>
    </div>

    <div class="leave-balance">
        <h4>Leave Balance</h4>
        <table class="table">
            <thead>
                <tr>
                    <th>Leave Type</th>
                    <th>Entitlement</th>
                    <th>Balance</th>
                    <th>Utilized</th>
                    <th>Pending Approval</th>
                </tr>
            </thead>
            <tbody>
                <tr><td>Annual Leave</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                <tr><td>Casual Leave</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                <tr><td>Duty Out of Office</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                <tr><td>Lieu Leave</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                <tr><td>Sick/Medical Leave</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                                            

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
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.17/index.global.min.js'></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        



    </body>
</html>
