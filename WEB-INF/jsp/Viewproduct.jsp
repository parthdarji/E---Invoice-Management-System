<%-- 
    Document   : Addproduct.jsp
    Created on : Apr 6, 2016, 12:04:00 PM
    Author     : parth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>View Product Details</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.5 -->
        <link rel="stylesheet" href="resource/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="resource/dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="resource/dist/css/skins/_all-skins.min.css">

        <!-- bootstrap wysihtml5 - text editor -->
        <link rel="stylesheet" href="resource/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="hold-transition skin-blue sidebar-mini">

        <div class="wrapper">
            <jsp:include page="header.jsp"></jsp:include>

                <!-- Left side column. contains the logo and sidebar -->
                <aside class="main-sidebar">
                    <!-- sidebar: style can be found in sidebar.less -->
                    <section class="sidebar">
                        <!-- Sidebar user panel -->
                        <div class="user-panel">
                            <div class="pull-left image">
                                <img src="resource/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                            </div>
                            <div class="pull-left info">
                                <p>Parth's GF</p>
                                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                            </div>
                        </div>
                        <!-- search form -->
                        <form action="#" method="get" class="sidebar-form">
                            <div class="input-group">
                                <input type="text" name="q" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                    <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
                                </span>
                            </div>
                        </form>
                        <!-- /.search form -->
                        <!-- sidebar menu: : style can be found in sidebar.less -->
                        <ul class="sidebar-menu">
                            <li class="treeview">
                                <a href="dashboard.html">
                                    <i class="fa fa-dashboard"></i> <span>Dashboard</span> 
                                </a>
                            </li>
                            <li class="active treeview">
                                <a href="#">
                                    <i class="fa fa-list-alt"></i> <span>Product</span> <i class="fa fa-angle-left pull-right"></i>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="addProduct.html"><i class="fa fa-circle-o"></i> Add Product</a></li>
                                    <li class="active"><a href="viewProduct.html"><i class="fa fa-circle-o"></i> View Product</a></li>
                                </ul>
                            </li>
                            <li class="treeview">
                                <a href="#">
                                    <i class="fa fa-files-o"></i>
                                    <span>Customer</span>
                                    <i class="fa fa-angle-left pull-right"></i>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="addCustomer.html"><i class="fa fa-circle-o"></i> Add Customer</a></li>
                                    <li ><a href="viewCustomer.html"><i class="fa fa-circle-o"></i> View Customer</a></li>
                                </ul>
                            </li>
                            <li class="treeview">
                                <a href="#">
                                    <i class="fa fa-pie-chart"></i>
                                    <span>Bill</span>
                                    <i class="fa fa-angle-left pull-right"></i>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="createBill.html"><i class="fa fa-circle-o"></i> Create Bill</a></li>
                                    <li><a href="billList.html"><i class="fa fa-circle-o"></i> Bill List</a></li>
                                </ul>
                            </li>   
                        </ul>
                    </section>
                    <!-- /.sidebar -->
                </aside>

                <div class="wrapper">
                    <!-- Content Wrapper. Contains page content -->
                    <div class="content-wrapper">
                        <!-- Content Header (Page header) -->
                        <section class="content-header">
                            <h1>
                                Product List
                            </h1>
                        </section>
                        <!-- Main content -->
                        <section class="content">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="box">
                                        <div  id="viewproduct" class="box-body">
                                            <!-- Product Updated Message    -->
                                        <%
                                            String successmsg = null;
                                            try {
                                                successmsg = (String) session.getAttribute("successmsg");
                                                session.removeAttribute("successmsg");
                                            } catch (Exception e) {
                                            }
                                            if (successmsg != null) {
                                        %>
                                        <div id="div121" style="font-size: 14px;color:#00e765;"><%=successmsg%>
                                        </div>
                                        <%
                                                session.removeAttribute("successmsg");
                                            }
                                        %>  
                                        <!-- Product Updated Message End    -->
                                        <table id="example2" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Serial No.</th>
                                                    <th>Product Type</th>
                                                    <th>Product Name</th>
                                                    <th colspan="2" style="text-align: center;">Action</th> 

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%int counter = 1;%>    
                                                <c:forEach var="p" items="${list}">
                                                    <tr>
                                                        <td><%=counter%></td>
                                                        <td id ="${p.id}.Product_type" value="${p.product_type}">${p.product_type}</td>
                                                        <td id="${p.id}.product_name" value ="${p.product_name}">${p.product_name} </td>
                                                        <%counter++;%>
                                                        <td><input id="${p.id}" value="${p.id}" type="image" onClick="DeleteRowFunction(${p.id})" src="resource/dist/img/file_delete.png" alt="Delete" height="20" width="25" ></td>
                                                        <td><input id="${p.id}" value="${p.id}" type="image" onClick="EditRowFunction(${p.id})" src="resource/dist/img/edit-notes.png" alt="Edit" height="20" width="25" ></td>
                                                    </tr>

                                                </c:forEach>
                                            </tbody>
                                        </table>

                                        <!-- Hidden tag to change the values -->
                                        <div class="modal">
                                            <div class="modal-dialog">
                                                <form id="frmSend" action="EditProduct.html" method="POST">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span></button>
                                                            <h4 class="modal-title">Update Product</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="container-fluid">
                                                                <div class="form-group">
                                                                    <label>Product Type</label>
                                                                    <select id = "Product_type1" class="form-control select2" name="producttype" style="width: 100%;">
                                                                        <option value="Web Application">Web Application</option>
                                                                        <option value="Mobile Application">Mobile Application</option>
                                                                        <option value="Desktop Application">Desktop Application</option>
                                                                        <option value="Other">Other</option>
                                                                    </select>

                                                                    <label for="ProductName">Product Name</label>
                                                                    <input id="Product_name1" type="text" class="form-control" name="productname" placeholder="Enter Product" required>
                                                                    <input id="product_id" type="hidden" name ="product_id"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button data-dismiss="modal" class="btn btn-default pull-left" type="button">Close</button>
                                                            <button class="btn btn-primary"  type="submit"  >Save Changes</button>
                                                        </div>
                                                    </div><!-- /.modal-content -->
                                                </form>
                                            </div>
                                        </div>

                                        <!-- Hidden tag finish -->
                                        <script>
                                            // Delete Product Script
                                            function DeleteRowFunction(product_id) {
                                                var xmlHttp;

                                                if (typeof XMLHttpRequest != "undefined") {
                                                    xmlHttp = new XMLHttpRequest();
                                                }
                                                else if (window.ActiveXObject) {
                                                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                                                }
                                                if (xmlHttp == null) {
                                                    alert("Browser does not support XMLHTTP Request");
                                                    return;
                                                }

                                                xmlHttp.onreadystatechange = function () {
                                                    if (xmlHttp.readyState == 4) {
                                                        if (xmlHttp.status == 200) {

                                                            document.getElementById("viewproduct").innerHTML = "";
                                                            document.getElementById("viewproduct").innerHTML = xmlHttp.responseText;

                                                        }
                                                        else {
                                                            alert("fail");
                                                        }

                                                    }

                                                };

                                                xmlHttp.open("GET", "ListProduct.html?id=" + product_id, true);
                                                xmlHttp.send();
                                            }

                                            //Edit Product Script
                                            function EditRowFunction(product_id) {
                                                var pname = product_id + ".product_name";
                                                var ptype = product_id + ".Product_type";

                                                document.getElementById("Product_type1").value = document.getElementById(ptype).innerHTML;
                                                document.getElementById("Product_name1").value = document.getElementById(pname).innerHTML;
                                                document.getElementById("product_id").value = product_id;
                                                $('.modal').modal();
                                            }

                                        </script>        
                                    </div><!-- /.box-body -->
                                </div><!-- /.box --> 
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </section><!-- /.content -->
                </div>
            </div>
        </div><!-- ./wrapper -->


        <!-- jQuery 2.1.4 -->
        <script src="resource/plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
                                            $.widget.bridge('uibutton', $.ui.button);
        </script>
        <!-- Bootstrap 3.3.5 -->
        <script src="resource/bootstrap/js/bootstrap.min.js"></script>
        <!-- Morris.js charts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="resource/plugins/morris/morris.min.js"></script>
        <!-- Sparkline -->
        <script src="resource/plugins/sparkline/jquery.sparkline.min.js"></script>
        <!-- jvectormap -->
        <script src="resource/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="resource/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <!-- jQuery Knob Chart -->
        <script src="resource/plugins/knob/jquery.knob.js"></script>
        <!-- daterangepicker -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
        <script src="resource/plugins/daterangepicker/daterangepicker.js"></script>
        <!-- datepicker -->
        <script src="resource/plugins/datepicker/bootstrap-datepicker.js"></script>
        <!-- Bootstrap WYSIHTML5 -->
        <script src="resource/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
        <!-- Slimscroll -->
        <script src="resource/plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="resource/plugins/fastclick/fastclick.min.js"></script>
        <!-- AdminLTE App -->
        <script src="resource/dist/js/app.min.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="resource/dist/js/pages/dashboard.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="resource/dist/js/demo.js"></script>
    </body>
</html>
