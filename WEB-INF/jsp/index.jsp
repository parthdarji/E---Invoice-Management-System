<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta charset="UTF-8">
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <title>Login</title>
        <link href="resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="resource/dist/css/font-awesome.min.css" rel="stylesheet" />
        <link href="resource/dist/css/AdminLTE.css" rel="stylesheet" />
        <link href="resource/dist/css/main.css" rel="stylesheet" />
        <link href="resource/plugins/iCheck/square/blue.css" rel="stylesheet" />
    </head>
    <body class="login-page">
        <div class="row" style="margin-top: 5em;">
            <div class="col-md-offset-4 col-md-4 col-sm-12 col-xs-12" >
                <div class="login-logo">
                    <a href="#"><b>Bill Management System</b><br>Login </a>
                </div><!-- /.login-logo -->
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-12 col-xs-12">
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12">
                <div class="login-box" style="margin-top:15px">
                    <div class="login-box-body">
                        <p class="login-box-msg">Sign in to Bill Management System</p>  
                        <%
                            String error = null;
                            try {
                                error = (String) session.getAttribute("error");
                            } catch (Exception e) {
                            }
                            if (error != null) {
                        %>
                        <div class="alert alert-danger alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <h4><i class="icon fa fa-ban"></i> Alert!</h4>
                            <%=error%>
                        </div>
                        <%
                                session.removeAttribute("error");
                            }
                        %>                                     
                        <form action="dashboard.html" method="post">
                            <div class="form-group has-feedback">
                                <input name="username" id="username" value="" placeholder="Username" class="form-control top" type="text" required>
                                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <input name="password" id="password" value="" placeholder="Password" class="form-control bottom" type="password" required>
                                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            </div>
                            <div class="row">
                                <div class="col-xs-8"></div>
                                <div class="col-xs-4">
                                    <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12">
            </div>            
        </div>
        <div class="footer" style="margin-top: 13em;">
            <div class="text-center">
                <footer style="background: #1f1f1f; padding: 17px 0 17px 0;">
                    <div class="footer-card" id="footer-card">
                        <p style="color:#fff;">Copyright © 2016 <a href="http://rudraautomation.com/" target="_blank">Rudra Automation Pvt. Ltd.</a> All rights reserved.</p>
                    </div>
                </footer>
            </div>
        </div>                               
        <script src="resource/plugins/jQuery/jQuery-2.1.3.min.js"></script>
        <script src="resource/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
