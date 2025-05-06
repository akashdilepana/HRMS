<%-- 
    Document   : userDashboard
    Created on : Apr 4, 2025, 10:15:40 AM
    Author     : Banula


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="jspf/header.jspf" %>
        
        <!--Styles  -->
        
        <style>
        .profile-card {
            background-color: #1abc9c;
            color: white;
            padding: 20px;
            border-radius: 8px;
        }
        .section-box {
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 15px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }
        .profile-pic {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            border: 3px solid #fff;
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
                                            
                                            <!--USER DASHBOARD  -->
                                            <div class="container-fluid mt-4">
    <div class="row">
        <!-- Left Column -->
        <div class="col-md-3">
            <div class="section-box">
                <h5>Daily Quote</h5>
                <br>
                <p>"An eye for an eye only ends up making the whole world blind."<br><strong>- M.K. Gandhi -</strong></p>
            </div>
            <div class="section-box">
                <h5>My Suggestions </h5>
                <br>
                <form>
                    <div class="form-group">
                        <label>Idea</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Employee ID</label>
                        <input type="text" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-success btn-sm">+ Add</button>
                </form>
            </div>
            <div class="section-box">
                <h5>Intranet Links</h5>
                <br>
                <p>&lt;&gt;</p>
            </div>
        </div>

        <!-- Center Column -->
        <div class="col-md-6">
            <div class="profile-card text-center mb-3">
                <h3>Banula Thisera</h3>
                <p>Junior Executive - Cashier </p>
                <img src="files/images/PROFILE1.jpg" class="profile-pic mb-3" alt="User Image">
                <p><strong>Employee No:</strong> 0001</p>
                <p><strong>Mobile:</strong> 761574749</p>
                <p><strong>Email:</strong> banula@summitedge.lk</p>
                <p><strong>Address:</strong> No.9/5, Maharagama Road, Mampe, Piliyandala, Sri Lanka, Colombo, Western</p>
            </div>

            <div class="section-box">
                <h5>Welcome Aboard</h5>
                <br>
                <div class="d-flex align-items-center">
                    <div class="bg-info text-white rounded-circle d-flex align-items-center justify-content-center" style="width:50px; height:50px;">HK</div>
                    <div class="ml-3">
                        <strong>Hashan Kavishka</strong><br>
                        Executive - Credit Marketing<br>
                        <small>Joined Date: 3 April 2025</small>
                    </div>
                </div>
            </div>
             <div class="section-box">
                <h5>Vision & Mission</h5>
                <br>
                <div class="d-flex align-items-center">
                    <div class="ml-3">
                        <h6>Vission</h6>
                        <p>...........</p>
                        <h6>Mission</h6>
                        <p>...........</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column -->
        <div class="col-md-3">
            <div class="section-box">
                <h5>My Workflow Items</h5>
                <br>
                <p>You don't have any pending approvals for now</p>
            </div>
            <div class="section-box">
                <h5>Company News</h5>
                <br>
                <ul class="list-unstyled">
                    <li><strong>11 DEC 2024</strong><br>summit - New High Impact Goals<br><small>We're broadening our perspective... <a href="#">More</a></small></li>
                    <hr>
                    <li><strong>01 MAY 2025</strong><br>summit High Impact Goals<br><small>Goal 01 is to reduce carbon... <a href="#">More</a></small></li>
                    <hr>
                    <li><strong>01 MAY 2025</strong><br>summit Core Values<br><small>Our customers need to trust us... <a href="#">More</a></small></li>
                </ul>
            </div>
            <div class="section-box">
                <h5>Employee Directory</h5>
                <br>
                <input type="text" class="form-control" placeholder="Search by name, role, or ID">
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
--%>
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
        
        <!--Styles  -->
        <style>
        .profile-card {
            background-color: #3e549b; /* Changed from #1abc9c */
            color: white;
            padding: 20px;
            border-radius: 8px;
        }
        .section-box {
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 15px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }
        .profile-pic {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            border: 3px solid #fff;
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
                                            
                                            <!--USER DASHBOARD  -->
                                            <div class="container-fluid mt-4">
    <div class="row">
        <!-- Left Column -->
        <div class="col-md-3">
            <div class="section-box">
                <h5>Daily Quote</h5>
                <br>
                <p>"An eye for an eye only ends up making the whole world blind."<br><strong>- M.K. Gandhi -</strong></p>
            </div>
            <div class="section-box">
                <h5>My Suggestions </h5>
                <br>
                <form>
                    <div class="form-group">
                        <label>Idea</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Employee ID</label>
                        <input type="text" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-success btn-sm">+ Add</button>
                </form>
            </div>
            <div class="section-box">
                <h5>Intranet Links</h5>
                <br>
                <p>&lt;&gt;</p>
            </div>
        </div>

        <!-- Center Column -->
        <div class="col-md-6">
            <div class="profile-card text-center mb-3">
                <h3>Banula Thisera</h3>
                <p>Junior Executive - Cashier </p>
                <img src="files/images/PROFILE1.jpg" class="profile-pic mb-3" alt="User Image">
                <p><strong>Employee No:</strong> 0001</p>
                <p><strong>Mobile:</strong> 761574749</p>
                <p><strong>Email:</strong> banula@summitedge.lk</p>
                <p><strong>Address:</strong> No.9/5, Maharagama Road, Mampe, Piliyandala, Sri Lanka, Colombo, Western</p>
            </div>

            <div class="section-box">
                <h5>Welcome Aboard</h5>
                <br>
                <div class="d-flex align-items-center">
                    <div class="bg-info text-white rounded-circle d-flex align-items-center justify-content-center" style="width:50px; height:50px;">HK</div>
                    <div class="ml-3">
                        <strong>Hashan Kavishka</strong><br>
                        Executive - Credit Marketing<br>
                        <small>Joined Date: 3 April 2025</small>
                    </div>
                </div>
            </div>

            <div class="section-box">
                <h5>Vision & Mission</h5>
                <br>
                <div class="d-flex align-items-center">
                    <div class="ml-3">
                        <h6>Vision</h6>
                        <p>To be the most beloved dining destination, known for exceptional flavors, warm hospitality, and culinary innovation.</p>
                        <h6>Mission</h6>
                        <p>To consistently deliver delightful food experiences made with fresh ingredients, served with heart, in a welcoming environment for every guest.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column -->
        <div class="col-md-3">
            <div class="section-box">
                <h5>My Workflow Items</h5>
                <br>
                <p>You don't have any pending approvals for now</p>
            </div>
            <div class="section-box">
                <h5>Company News</h5>
                <br>
                <ul class="list-unstyled">
                    <li><strong>11 DEC 2024</strong><br>summit - New High Impact Goals<br><small>We're broadening our perspective... <a href="#">More</a></small></li>
                    <hr>
                    <li><strong>01 MAY 2025</strong><br>summit High Impact Goals<br><small>Goal 01 is to reduce carbon... <a href="#">More</a></small></li>
                    <hr>
                    <li><strong>01 MAY 2025</strong><br>summit Core Values<br><small>Our customers need to trust us... <a href="#">More</a></small></li>
                </ul>
            </div>
            <div class="section-box">
                <h5>Employee Directory</h5>
                <br>
                <input type="text" class="form-control" placeholder="Search by name, role, or ID">
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
