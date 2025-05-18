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
/*            .placeholder {
                display: inline-block;
                min-height: 1em;
                vertical-align: middle;
                cursor: wait;
                background-color: none !important;
                opacity: .5;
            }*/
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

            .leave-container {
                display: flex;
                gap: 20px;
            }
            .leave-form {
                flex: 2;
            }
            .leave-balance {
                flex: 1;
                background-color: #f8f9fa;
                padding: 15px;
                border-radius: 8px;
            }
            label {
                font-weight: bold;
                margin-top: 10px;
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

                                            <!-- leave page -->
                                            <h2>Leave Application</h2>
                                            <div class="leave-container">
                                                <div class="leave-form" id="formSection">
                                                    <div class="mb-3">
                                                        <label for="leaveYear">Leave Year</label>
                                                        <select id="leaveYear" class="form-control">
                                                            <option value="2025">2025</option>
                                                            <option value="2024">2024</option>
                                                            <option value="2023">2023</option>
                                                        </select>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="leaveType">Leave Type</label>
                                                        <select id="leaveType" class="form-control">
                                                            <option value="Annual Leave">Annual Leave</option>
                                                            <option value="Casual Leave">Casual Leave</option>
                                                            <option value="Duty Out of Office">Duty Out of Office</option>
                                                            <option value="Lieu Leave">Lieu Leave</option>
                                                            <option value="Sick/Medical Leave">Sick/Medical Leave</option>
                                                        </select>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label>From Date</label>
                                                        <input id="from" type="date" class="form-control">
                                                    </div>

                                                    <div class="mb-3">
                                                        <label>To Date</label>
                                                        <input id="to" type="date" class="form-control">
                                                    </div>

                                                    <div class="mb-3">
                                                        <label>Comments</label>
                                                        <textarea id="comment" class="form-control"></textarea>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label>Approver</label>
                                                        <select id="emp" name="emp" class="" required autocomplete="off">
                                                        </select>
                                                    </div>

                                                    <button id="saveBtn" class="btn btn-success">Apply</button>
                                                    <button type="reset" class="btn btn-secondary">Reset</button>
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
        <script>
            var emp = new SlimSelect({
                select: '#emp',
                placeholder: "Select a Emplyoee",
                searchHighlight: true,

                ajax: function (search, callback) {
                    fetch('admin/search-emp', {
                        method: 'POST',
                        body: new URLSearchParams({search: search || ''})
                    }).then(res => res.json()).then((data) => {
                        callback(data);
                    });
                },
                allowDeselect: true,
                deselectLabel: '<span class="red">✖</span>'
            });

            function clearForm() {
                $('#formSection').find('input[type!=search]').val('');
                $('#formSection').find('textarea[type!=search]').val('');
                $('#formSection').find('select').each(function () {
                    if ($(this).data('select')) {
                        if ($(this).data('select').ajax) {
                            $(this).data('select').data.data = [];
                        }
                        $(this).data('select').set('');
                    }
                });
            }
            $('#saveBtn').click(function () {
//                if ($('#name').val().trim() === '') {
//                    Swal.fire("Empty Name!", "Please Enter a Valid Name!", "warning");
//                    return;
//                }
//                if ($('#username').val().trim() === '') {
//                    Swal.fire("Empty Username!", "Please Enter a Valid Username!", "warning");
//                    return;
//                }
//                if ($('#add').val().trim() === '') {
//                    Swal.fire("Empty addresss!", "Please Enter Address!", "warning");
//                    return;
//                }
//                if ($('#email').val().trim() === '') {
//                    Swal.fire("Empty Email!", "Please Enter valid Email!", "warning");
//                    return;
//                }
//                if ($('#tpno').val() === '') {
//                    Swal.fire("Empty contact!", "Please Enter valid mobile number!", "warning");
//                    return;
//                }
//                if ($('#pw').val().trim() === '') {
//                    Swal.fire("Empty password!", "Please Enter valid mobile password!", "warning");
//                    return;
//                }
//                if ($('#emp').val() === '') {
//                    Swal.fire("Empty employeeNumber!", "Please Enter Employee number!", "warning");
//                    return;
//                }
                if ($('#emp').val() === null) {
                    Swal.fire("Approver not Selected!", "Please Select a Approver!", "warning");
                    return;
                }
//                if ($('#user_designation').val() === null) {
//                    Swal.fire("UserDesignation not Selected!", "Please Select a UserDesignation!", "warning");
//                    return;
//                }

                const formData = new FormData();

                formData.append('leaveYear', $('#leaveYear').val().trim());
                formData.append('leaveType', $('#leaveType').val().trim());
                formData.append('from', $('#from').val());
                formData.append('to', $('#to').val());
                formData.append('comment', $('#comment').val());
                formData.append('emp', $('#emp').val());

                Swal.fire({
                    title: 'Are you sure?',
                    text: "Leve Form Will be Saved !",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Continue!',
                    showLoaderOnConfirm: true,
                    searchHighlight: true,
                    preConfirm: () => {
                        return fetch('admin/save-leave', {
                            method: 'POST',
                            body: formData
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error(response.statusText);
                            }
                            return response.json();
                        }).catch(error => {
                            Swal.showValidationMessage('Request failed:' + error);
                        });
                    },
                    allowOutsideClick: () => !Swal.isLoading()

                }).then((result) => {
                    if (result.value) {
                        if (result.value.status !== 200) {
                            Swal.fire('Error!', result.value.msg, 'error');
                        } else {
                            Swal.fire('Successfull!', 'Leave Form has been updated.', 'success');
                            clearForm();
                        }
                    }
                });
            });
        </script>




    </body>
</html>
