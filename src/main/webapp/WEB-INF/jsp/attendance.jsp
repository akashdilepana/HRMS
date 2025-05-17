<%-- 
    Document   : adminDashboard
    Created on : Apr 3, 2025, 1:55:34 PM
    Author     : rusir
--%>

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
                                            
                                                        
                                                   hiiiii

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
