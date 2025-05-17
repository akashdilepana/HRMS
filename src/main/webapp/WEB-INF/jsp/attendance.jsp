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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">


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
            #attendanceModal {
            display: none;
            position: fixed;
            z-index: 10;
            left: 0; top: 0; width: 100%; height: 100%;
            background-color: rgba(0,0,0,0.5);
        }

        #modalContent {
            background-color: white;
            margin: 10% auto;
            padding: 20px;
            width: 300px;
            border-radius: 8px;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input[type=text] {
            width: 100%;
            padding: 5px;
            font-size: 14px;
            cursor: pointer;
        }

        /* Button Styles */
        #submitBtn {
            background-color: #008080;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            padding: 8px 12px;
            cursor: pointer;
            margin-top: 15px;
        }

        #cancelBtn {
            background-color: #FA8072;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            padding: 8px 12px;
            cursor: pointer;
            margin-top: 15px;
        }

        .fc {
            max-width: 80%;
            margin: 0 auto;
        }

        .fc-toolbar-title {
            font-size: 20px;
        }

        .fc-toolbar-chunk select {
            padding: 4px;
            font-size: 16px;
        }

        .fc-col-header-cell-cushion {
            color: #009D94;
        }

        h2 {
            font-size: 28px;
            text-align: center;
            color: #008080; /* ✅ Updated title color */
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
                                            
                                                        
                                                  <h2>Mark Attendance</h2><br>

                                                  <div id="calendar"></div>

                                                  <!-- Attendance Modal -->
                                                  <div id="attendanceModal">
                                                      <div id="modalContent">
                                                          <h3>Mark Attendance for <span id="selectedDateDisplay"></span></h3>

                                                          <label for="inTime">IN Time:</label>
                                                          <input type="text" id="inTime" class="clockpicker" placeholder="Select IN time" readonly>

                                                          <label for="outTime">OUT Time:</label>
                                                          <input type="text" id="outTime" class="clockpicker" placeholder="Select OUT time" readonly>

                                                          <button id="submitBtn" onclick="submitAttendance()">Submit</button>
                                                          <button id="cancelBtn" onclick="closeModal()">Cancel</button>
                                                      </div>
                                                  </div>
                                                  <%--

                                                  <!-- JS dependencies -->
                                                  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js"></script>
                                                  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

                                                  <!-- Bootstrap JS (required for ClockPicker) -->
                                                  <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"></script>

                                                  <!-- ClockPicker JS -->
                                                  <script src="https://cdnjs.cloudflare.com/ajax/libs/clockpicker/0.0.7/bootstrap-clockpicker.min.js"></script>
                                                  
                                                  --%>
                                                  <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
                                                  <script>
                                                      flatpickr("#inTime", { enableTime: true, noCalendar: true, dateFormat: "H:i" });
                                                      flatpickr("#outTime", { enableTime: true, noCalendar: true, dateFormat: "H:i" });
                                                  </script>

                                                  

                                                  <script>
                                                      let calendar;
                                                      let selectedDate;
                                                      let attendanceRecords = [];

                                                      document.addEventListener('DOMContentLoaded', function() {
                                                          let calendarEl = document.getElementById('calendar');
                                                          calendar = new FullCalendar.Calendar(calendarEl, {
                                                              initialView: 'dayGridMonth',
                                                              selectable: true,
                                                              headerToolbar: {
                                                                  left: 'prev,next today',
                                                                  center: 'title',
                                                                  right: 'dayGridMonth,dayGridYear'
                                                              },
                                                              dateClick: function(info) {
                                                                  selectedDate = info.dateStr;
                                                                  openModal(selectedDate);
                                                              },
                                                              events: function(fetchInfo, successCallback) {
                                                                  let events = attendanceRecords.map(record => ({
                                                                      title: `IN: ${record.inTime} OUT: ${record.outTime}`,
                                                                      start: record.date,
                                                                      allDay: true
                                                                  }));
                                                                  successCallback(events);
                                                              }
                                                          });
                                                          calendar.render();

                                                          $('.clockpicker').clockpicker({
                                                              autoclose: true,
                                                              donetext: 'Done'
                                                          });
                                                      });

                                                      function openModal(date) {
                                                          document.getElementById('selectedDateDisplay').textContent = date;
                                                          document.getElementById('inTime').value = '';
                                                          document.getElementById('outTime').value = '';
                                                          document.getElementById('attendanceModal').style.display = 'block';
                                                      }

                                                      function closeModal() {
                                                          document.getElementById('attendanceModal').style.display = 'none';
                                                      }

                                                      function submitAttendance() {
                                                          let inTime = document.getElementById('inTime').value;
                                                          let outTime = document.getElementById('outTime').value;

                                                          if (!inTime || !outTime) {
                                                              alert("Please select both IN and OUT times!");
                                                              return;
                                                          }

                                                          attendanceRecords.push({ date: selectedDate, inTime, outTime });
                                                          closeModal();
                                                          calendar.refetchEvents();

                                                          alert(`Attendance added for ${selectedDate}\nIN: ${inTime}\nOUT: ${outTime}`);
                                                      }
                                                  </script>

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
