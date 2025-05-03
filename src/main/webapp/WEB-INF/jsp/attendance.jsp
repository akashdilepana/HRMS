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
                                            <div class="col-lg-10 offset-lg-1 col-xl-12 offset-xl-0 col-12">
                                                <div class="card">
                                                    <div class="card-block p-b-0">
                                                        <div id='calendar'></div>
                                                    </div>
                                                </div>
                                            </div>

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

                                                                <!-- Toggle -->
                                                                <div class="mb-3">
                                                                    <label class="form-label">Select Type</label><br>
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" type="radio" name="entryType" id="attendanceOption" value="attendance" checked>
                                                                        <label class="form-check-label" for="attendanceOption">Attendance</label>
                                                                    </div>
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" type="radio" name="entryType" id="leaveOption" value="leave">
                                                                        <label class="form-check-label" for="leaveOption">Leave</label>
                                                                    </div>
                                                                </div>

                                                                <!-- Attendance Section -->
                                                                <div id="attendanceSection">
                                                                    <div class="mb-3">
                                                                        <label for="inTime" class="form-label">IN Time</label>
                                                                        <input type="time" class="form-control" id="inTime" name="inTime">
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label for="outTime" class="form-label">OUT Time</label>
                                                                        <input type="time" class="form-control" id="outTime" name="outTime">
                                                                    </div>
                                                                </div>

                                                                <!-- Leave Section -->
                                                                <div id="leaveSection" style="display: none;">
                                                                    <div class="mb-3">
                                                                        <label for="leaveType" class="form-label">Leave Type</label>
                                                                        <select class="form-control" id="leaveType" name="leaveType">
                                                                            <option value="Sick Leave">Sick Leave</option>
                                                                            <option value="Casual Leave">Casual Leave</option>
                                                                            <option value="Vacation">Vacation</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label for="leaveReason" class="form-label">Reason</label>
                                                                        <textarea class="form-control" id="leaveReason" name="leaveReason" rows="3"></textarea>
                                                                    </div>
                                                                </div>

                                                                <input type="hidden" id="dateInput" name="date">
                                                            </div>

                                                            <div class="modal-footer">
                                                                <button id="saveBtn" type="submit" class="btn btn-primary">Save</button>
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
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.17/index.global.min.js'></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>

            document.addEventListener('DOMContentLoaded', function () {
                // ... your existing FullCalendar init code ...

                // Toggle between Attendance and Leave
                document.getElementById('attendanceOption').addEventListener('change', toggleEntryType);
                document.getElementById('leaveOption').addEventListener('change', toggleEntryType);

                function toggleEntryType() {
                    const isLeave = document.getElementById('leaveOption').checked;
                    document.getElementById('leaveSection').style.display = isLeave ? 'block' : 'none';
                    document.getElementById('attendanceSection').style.display = isLeave ? 'none' : 'block';
                }
            });



            let selectedDate = "";

            document.addEventListener('DOMContentLoaded', function () {
                const calendarEl = document.getElementById('calendar');

                const calendar = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'dayGridMonth',
                    selectable: true,
                    eventDisplay: 'block',
                    events: '/hrms/attendance/list',

                    dateClick: function (info) {
                        selectedDate = info.dateStr;
                        document.getElementById("selectedDate").textContent = `Date: ${selectedDate}`;
                        document.getElementById("dateInput").value = selectedDate;

                        const myModal = new bootstrap.Modal(document.getElementById('attendanceModal'));
                        myModal.show();
                    },

//                    eventContent: function (arg) {
//                        const title = arg.event.title || '';
//
//                        // Split IN and OUT times
//                        const [inText, outText] = title.split('|').map(text => text.trim());
//
//                        // Create wrapper
//                        const wrapper = document.createElement('div');
//                        wrapper.style.padding = "4px";
//                        wrapper.style.fontSize = "12px";
//                        wrapper.style.lineHeight = "1.2";
//
//                        // IN badge
//                        const inDiv = document.createElement('div');
//                        inDiv.innerHTML = `<span style="background:#d4edda;color:#155724;padding:2px 6px;border-radius:4px;font-weight:bold">IN</span> 
//                       <span>${inText.replace('IN:', '').trim()}</span>`;
//
//                        // OUT badge
//                        const outDiv = document.createElement('div');
//                        outDiv.innerHTML = `<span style="background:#f8d7da;color:#721c24;padding:2px 6px;border-radius:4px;font-weight:bold">OUT</span> 
//                        <span>${outText.replace('OUT:', '').trim()}</span>`;
//
//                        wrapper.appendChild(inDiv);
//                        wrapper.appendChild(outDiv);
//
//                        return {domNodes: [wrapper]};
//                    }


                    eventContent: function (arg) {
                        // Split the title string
                        const title = arg.event.title || '';
                        const [inText, outText] = title.split('|').map(text => text.trim());

                        // Create IN time element
                        const inDiv = document.createElement('div');
                        inDiv.style.color = 'green';
                        inDiv.style.fontWeight = 'bold';
                        inDiv.textContent = inText;

                        // Create OUT time element
                        const outDiv = document.createElement('div');
                        outDiv.style.color = 'red';
                        outDiv.style.fontWeight = 'bold';
                        outDiv.textContent = outText;

                        return {domNodes: [inDiv, outDiv]};
                    }
                });

                calendar.render();


                document.getElementById("attendanceForm").addEventListener("submit", function (e) {
                    e.preventDefault();

                    const selectedType = document.querySelector('input[name="entryType"]:checked').value;
                    const date = document.getElementById("dateInput").value;
                    const formData = new FormData();
                    formData.append("date", date);
                    formData.append("type", selectedType); // Pass type to backend

                    // Attendance Mode
                    if (selectedType === "attendance") {
                        const inTime = document.getElementById("inTime").value.trim();
                        const outTime = document.getElementById("outTime").value.trim();

                        if (!inTime || !outTime) {
                            Swal.fire("Missing Fields", "Please fill in both IN and OUT time!", "warning");
                            return;
                        }

                        formData.append("intime", inTime);
                        formData.append("outtime", outTime);
                    }

                    // Leave Mode
                    if (selectedType === "leave") {
                        const leaveType = document.getElementById("leaveType").value.trim();
                        const leaveReason = document.getElementById("leaveReason").value.trim();

                        if (!leaveType || !leaveReason) {
                            Swal.fire("Missing Fields", "Please select a leave type and provide a reason!", "warning");
                            return;
                        }

                        formData.append("leaveType", leaveType);
                        formData.append("leaveReason", leaveReason);
                    }

                    Swal.fire({
                        title: 'Are you sure?',
                        text: selectedType === 'leave' ? "Leave request will be submitted!" : "Attendance will be saved!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, save it!',
                        showLoaderOnConfirm: true,
                        preConfirm: () => {
                            return fetch('attendance/save', {
                                method: 'POST',
                                body: formData
                            }).then(response => {
                                if (!response.ok) {
                                    throw new Error(response.statusText);
                                }
                                return response.json();
                            }).catch(error => {
                                Swal.showValidationMessage('Request failed: ' + error);
                            });
                        },
                        allowOutsideClick: () => !Swal.isLoading()
                    }).then((result) => {
                        if (result.value) {
                            if (result.value.status !== 200) {
                                Swal.fire('Error!', result.value.msg, 'error');
                            } else {
                                Swal.fire('Success!', selectedType === 'leave' ? 'Leave has been submitted.' : 'Attendance has been saved.', 'success');
                                bootstrap.Modal.getInstance(document.getElementById('attendanceModal')).hide();
                            }
                        }
                    });
                });



                // Handle form submission
//                document.getElementById("attendanceForm").addEventListener("submit", function (e) {
//                    e.preventDefault();
//
//                    const inTime = document.getElementById("inTime").value.trim();
//                    const outTime = document.getElementById("outTime").value.trim();
//                    const date = document.getElementById("dateInput").value;
//
//                    if (!inTime || !outTime) {
//                        Swal.fire("Missing Fields", "Please fill in both IN and OUT time!", "warning");
//                        return;
//                    }
//
//                    const formData = new FormData();
//                    formData.append("date", date);
//                    formData.append("intime", inTime);
//                    formData.append("outtime", outTime);
//
//                    Swal.fire({
//                        title: 'Are you sure?',
//                        text: "Attendance will be saved!",
//                        icon: 'warning',
//                        showCancelButton: true,
//                        confirmButtonColor: '#3085d6',
//                        cancelButtonColor: '#d33',
//                        confirmButtonText: 'Yes, save it!',
//                        showLoaderOnConfirm: true,
//                        preConfirm: () => {
//                            return fetch('attendance/save', {
//                                method: 'POST',
//                                body: formData
//                            }).then(response => {
//                                if (!response.ok) {
//                                    throw new Error(response.statusText);
//                                }
//                                return response.json();
//                            }).catch(error => {
//                                Swal.showValidationMessage('Request failed: ' + error);
//                            });
//                        },
//                        allowOutsideClick: () => !Swal.isLoading()
//                    }).then((result) => {
//                        if (result.value) {
//                            if (result.value.status !== 200) {
//                                Swal.fire('Error!', result.value.msg, 'error');
//                            } else {
//                                Swal.fire('Success!', 'Attendance has been saved.', 'success');
//                                bootstrap.Modal.getInstance(document.getElementById('attendanceModal')).hide();
//                            }
//                        }
//                    });
//                });
            });

        </script>
    </body>
</html>
