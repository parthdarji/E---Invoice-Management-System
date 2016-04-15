<%-- 
    Document   : ListCustomer
    Created on : Apr 15, 2016, 3:33:29 PM
    Author     : parth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Customer</title>
    </head>
    <body>
        <!-- Customer Updated Message    -->
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
        <!-- Customer Updated Message End    -->
        <!-- Customer List  -->
        <table id="example2" class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Serial No.</th>
                    <th>Customer Name</th>
                    <th>Customer Address</th>
                    <th colspan="2" style="text-align: center;">Action</th> 

                </tr>
            </thead>
            <tbody>
                <%int counter = 1;%>    
                <c:forEach var="c" items="${list}">
                    <tr>
                        <td><%=counter%></td>
                        <td id ="${c.id}.customer_name" value="${c.customer_name}">${c.customer_name}</td>
                        <td id="${c.id}.customer_address" value ="${c.customer_address}">${c.customer_address} </td>
                        <%counter++;%>
                        <td><input id="${c.id}" value="${c.id}" type="image" onClick="DeleteRowFunction(${c.id})" src="resource/dist/img/file_delete.png" alt="Delete" height="20" width="25" ></td>
                        <td><input id="${c.id}" value="${c.id}" type="image" onClick="EditRowFunction(${c.id})" src="resource/dist/img/edit-notes.png" alt="Edit" height="20" width="25" ></td>
                    </tr>

                </c:forEach>
            </tbody>
        </table>
        <!-- Customer List End -->
        <!-- Hidden tag to change the values -->
        <div class="modal">
            <div class="modal-dialog">
                <form id="frmSend" action="EditCustomer.html" method="POST">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">Update Product</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="form-group">
                                    <label>Customer Name</label>
                                    <input id="Customer_name1" type="text" class="form-control" name="customername" placeholder="Enter Name" required>

                                    <label>Customer Address</label>
                                    <input id="Customer_address1" type="text" class="form-control" name="customeraddress" placeholder="Enter Address" required>
                                    <input id="customer_id" type="hidden" name ="customer_id"/>
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
            // Delete Customer Script
            function DeleteRowFunction(customer_id) {
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

                            document.getElementById("viewcustomer").innerHTML = "";
                            document.getElementById("viewcustomer").innerHTML = xmlHttp.responseText;

                        }
                        else {
                            alert("fail");
                        }

                    }

                };

                xmlHttp.open("GET", "ListCustomer.html?id=" + customer_id, true);
                xmlHttp.send();
            }

            //Edit Customer Script
            function EditRowFunction(customer_id) {
                var c_name = customer_id + ".customer_name";
                var c_address = customer_id + ".customer_address";

                document.getElementById("Customer_name1").value = document.getElementById(c_name).innerHTML;
                document.getElementById("Customer_address1").value = document.getElementById(c_address).innerHTML;
                document.getElementById("customer_id").value = customer_id;
                $('.modal').modal();
            }


        </script>   
    </body>
</html>
