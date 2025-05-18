<%-- 
    Document   : adminDashboard
    Created on : Apr 3, 2025, 1:55:34 PM
    Author     : rusir


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="jspf/header.jspf" %>
    </head>
    <body>
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
                                            hi
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
--%>
<%-- 
    Document   : userDashboard
    Created on : Apr 4, 2025, 10:15:40 AM
    Author     : 
--%>

<%-- 
    Document   : adminDashboard
    Created on : May 9, 2025
    Author     : rusir
--%>

<%-- 
    Document   : adminDashboard
    Created on : May 9, 2025
    Author     : rusir
--%>

<%-- 
    Document   : adminDashboard
    Created on : May 9, 2025
    Author     : rusir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <%@include file="jspf/header.jspf" %>

        <style>
            .stat-box {
                border-radius: 15px;
                padding: 20px;
                color: #fff;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                text-align: center;
                display: flex;
                flex-direction: column;
                justify-content: center;
                height: 160px; /* Equal height for all boxes */
            }

            .stat-box h4 {
                margin-bottom: 10px;
                font-size: 16px;
            }

            .stat-box h3 {
                font-size: 24px;
                margin: 0;
            }

            .stat-box .icon {
                font-size: 30px;
                margin-bottom: 5px;
            }

            .bg-purple { background-color: #9b59b6; }
            .bg-teal { background-color: #1abc9c; }
            .bg-pink { background-color: #e74c3c; }
            .bg-blue { background-color: #3498db; }

            .section-box {
                background-color: #bee8fb;
                padding: 15px;
                border-radius: 8px;
                margin-bottom: 15px;
                box-shadow: 0 0 5px rgba(0,0,0,0.1);
                text-align: center;
                cursor: pointer;
                transition: transform 0.2s;
            }

            .section-box:hover {
                transform: scale(1.03);
            }
        </style>
    </head>
    <body class="bg-light">
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
                                            
                                            <!-- Stats Cards -->
<!-- First Row: 4 Stat Boxes -->
<div class="row mb-4">
    <div class="col-md-3 d-flex">
        <div class="stat-box bg-purple w-100">
            <div class="icon"><i class="fas fa-users"></i></div>
            <h4>Total Employment</h4>
            <h3>530</h3>
        </div>
    </div>
    <div class="col-md-3 d-flex">
        <div class="stat-box bg-teal w-100">
            <div class="icon"><i class="fas fa-user-plus"></i></div>
            <h4>New Employee</h4>
            <h3>36</h3>
        </div>
    </div>
    <div class="col-md-3 d-flex">
        <div class="stat-box bg-pink w-100">
            <div class="icon"><i class="fas fa-female"></i></div>
            <h4>Number of Female</h4>
            <h3>230</h3>
        </div>
    </div>
    <div class="col-md-3 d-flex">
        <div class="stat-box bg-blue w-100">
            <div class="icon"><i class="fas fa-male"></i></div>
            <h4>Number of Male</h4>
            <h3>247</h3>
        </div>
    </div>
</div>

<!-- Second Row: 3 Stat Boxes + Admin Info (With Different Colors) -->
<div class="row mb-4">
    <div class="col-md-3 d-flex">
        <div class="stat-box bg-success w-100">
            <div class="icon"><i class="fas fa-building"></i></div>
            <h4>All Branches</h4>
            <h3>3</h3>
        </div>
    </div>
    <div class="col-md-3 d-flex">
        <div class="stat-box bg-warning w-100 text-white">
            <div class="icon"><i class="fas fa-file-alt"></i></div>
            <h4>Job Applications</h4>
            <h3>4</h3>
        </div>
    </div>
    <div class="col-md-3 d-flex">
        <div class="stat-box bg-danger w-100">
            <div class="icon"><i class="fas fa-comment-dots"></i></div>
            <h4>Suggestions</h4>
            <h3>6</h3>
        </div>
    </div>
    <div class="col-md-3 d-flex">
        <div class="stat-box bg-dark w-100 text-white text-center">
            <div class="icon"><i class="fas fa-user-circle"></i></div>
            <h4>Admin</h4>
            <p>Name: <strong>Akash Dilepana</strong></p>
            <p>ID: <strong>EMP001</strong></p>
        </div>
    </div>
</div>





                                                <!-- Functional Blocks -->
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <div class="section-box" onclick="location.href='documents.jsp'">
                                                            <i class="fa fa-file"></i><br>
                                                            <strong>Documents</strong>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="section-box" onclick="location.href='sallary'">
                                                            <i class="fa fa-money"></i><br>
                                                            <strong>Salary</strong>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="section-box" onclick="location.href='addUser.jsp'">
                                                            <i class="fa fa-user-plus"></i><br>
                                                            <strong>Add User</strong>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="section-box" onclick="location.href='ticketChecking.jsp'">
                                                            <i class="fa fa-ticket"></i><br>
                                                            <strong>Suggestions</strong>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="section-box" onclick="location.href='newEmployees.jsp'">
                                                            <i class="fa fa-user"></i><br>
                                                            <strong>New Employees</strong>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="section-box" onclick="location.href='numOfDepts.jsp'">
                                                             <i class="fa fa-female"></i><br>
                                                            <strong>Number of Depts</strong>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mt-3">
                                                    <div class="col-md-2">
                                                        <div class="section-box" onclick="location.href='leave.jsp'">
                                                            <i class="fa fa-sign-out"></i><br>
                                                            <strong>Leave</strong>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="section-box" onclick="location.href='attendance.jsp'">
                                                            <i class="fa fa-calendar-check-o"></i><br>
                                                            <strong>Attendance</strong>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="section-box" onclick="location.href='showUsers.jsp'">
                                                            <i class="fa fa-users"></i><br>
                                                            <strong>Show Users</strong>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="section-box" onclick="location.href='approvals.jsp'">
                                                            <i class="fa fa-check-square-o"></i><br>
                                                            <strong>Approvals</strong>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="section-box" onclick="location.href='index'">
                                                            <i class="fa fa-male"></i><br>
                                                            <strong>Profile</strong>
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
    </body>
</html>

