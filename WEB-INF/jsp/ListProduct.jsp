<%-- 
    Document   : ListProduct
    Created on : Apr 13, 2016, 2:38:49 PM
    Author     : parth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Product</title>

    </head>
    <body>
        <!-- Success Message -->
        <%
            String successmsg = null;
            try {
                successmsg = (String) session.getAttribute("successmsg");
                session.removeAttribute("successmsg");
            } catch (Exception e) {
            }
            if (successmsg != null) {
        %>
        <div id="div121" style="font-size: 14px;color:#00e765;"><%=successmsg%></div>
        <%
                session.removeAttribute("successmsg");
            }
        %>  
        <!-- Success Message End  -->
        <!-- Product List -->
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
        <!-- Product List End -->
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

            //  Delete Product Script
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

//Product Edit Script 

            function EditRowFunction(product_id) {
                var pname = product_id + ".product_name";
                var ptype = product_id + ".Product_type";
                document.getElementById("Product_type1").value = document.getElementById(ptype).innerHTML;
                document.getElementById("Product_name1").value = document.getElementById(pname).innerHTML;
                document.getElementById("product_id").value = product_id;
                $('.modal').modal();
            }
        </script>
    </body>
</html>
