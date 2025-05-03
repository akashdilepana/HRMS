<%-- 
    Document   : userDashboard
    Created on : Apr 4, 2025, 10:15:40 AM
    Author     : rusir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="jspf/header.jspf" %>
        <title>HRMS Attendance Calendar</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .calendar {
                display: grid;
                grid-template-columns: repeat(7, 1fr);
                gap: 1px;
                margin-top: 20px;
            }
            .day {
                padding: 20px;
                border: 1px solid #ddd;
                height: 100px;
                text-align: center;
                cursor: pointer;
            }
            .day:hover {
                background-color: #f0f0f0;
            }
            .header {
                font-weight: bold;
                text-align: center;
                padding: 10px;
                background-color: #007bff;
                color: white;
            }
        </style>
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
                                            <div class="container">
                                                <h2 class="text-center mt-4">HRMS Attendance Calendar - April 2025</h2>
                                                <div class="calendar mt-4">
                                                    <div class="header">Sun</div>
                                                    <div class="header">Mon</div>
                                                    <div class="header">Tue</div>
                                                    <div class="header">Wed</div>
                                                    <div class="header">Thu</div>
                                                    <div class="header">Fri</div>
                                                    <div class="header">Sat</div>

                                                    <!-- Blank spaces for first day alignment (example: April 2025 starts on a Tuesday) -->
                                                    <div></div><div></div>

                                                    <!-- Days of the month -->
                                                    <!-- You can loop and generate this dynamically using JS or a backend language -->
                                                    <!-- For now we show 30 days manually -->
                                                    <!-- Click event added to each day -->
                                                    <!-- Use data-date attribute to pass selected date -->
                                                    <!-- Adjust day start and end as per actual month -->
                                                    <!-- Assuming April 2025 starts on a Tuesday -->
                                                    <!-- So 2 blank divs before day 1 -->

                                                    <!-- Days -->
                                                    <!-- Example shown till 30 -->
                                                    <!-- Adjust according to month -->
                                                    <!-- Add data-date for reference in modal -->

                                                    <!-- Use JS to generate this dynamically if needed -->

                                                    <!-- Calendar days -->
                                                    <script>
                                                        let html = "";
                                                        for (let i = 1; i <= 30; i++) {
                                                            html += `<div class="day" onclick="openModal(${i})" data-date="2025-04-${String(i).padStart(2, '0')}">${i}</div>`;
                                                        }
                                                        document.write(html);
                                                    </script>
                                                </div>
                                            </div>

                                            <!-- Attendance Modal -->
                                            <div class="modal fade" id="attendanceModal" tabindex="-1" aria-labelledby="attendanceModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <form id="attendanceForm">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">Mark Attendance</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p id="selectedDate" class="fw-bold text-primary"></p>
                                                                <div class="mb-3">
                                                                    <label for="inTime" class="form-label">IN Time</label>
                                                                    <input type="time" class="form-control" id="inTime" required>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="outTime" class="form-label">OUT Time</label>
                                                                    <input type="time" class="form-control" id="outTime" required>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary">Save Attendance</button>
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                            </div>
                                                        </div>
                                                    </form>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                                        let selectedDay = "";

                                                        function openModal(day) {
                                                            selectedDay = `2025-04-${String(day).padStart(2, '0')}`;
                                                            document.getElementById("selectedDate").textContent = `Date: ${selectedDay}`;
                                                            new bootstrap.Modal(document.getElementById('attendanceModal')).show();
                                                        }

                                                        document.getElementById("attendanceForm").addEventListener("submit", function (e) {
                                                            e.preventDefault();
                                                            const inTime = document.getElementById("inTime").value;
                                                            const outTime = document.getElementById("outTime").value;
                                                            alert(`Attendance for ${selectedDay}:\nIN: ${inTime}\nOUT: ${outTime}`);
                                                            bootstrap.Modal.getInstance(document.getElementById('attendanceModal')).hide();
                                                            // You can send this data via AJAX to your server
                                                        });
        </script>
    </body>
</html>
