<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Management Application</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body>
        <header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: blue">
                    <div>
                          <a href="https://github.com/essgineer"             class="navbar-brand"> Customer Management App</a>
                    </div>
                    <ul class="navbar-nav">
                        <li><a href="<%=request.getContextPath()%>/"  class="nav-link">Customer List</a></li>
                    </ul>
                </nav>
       </header>
          <br>
            <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">List of Customers</h3>
                    <hr>
                    <div class="container text-left">
                        <a href="/user-form.jsp" class="btn btn-success">Add New Customer</a>
                    </div>
                    <br>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>FirstName</th>
                                <th>LastName</th>
                                <th>Email</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   for (Todo todo: todos) {  -->
                            <c:forEach var="Customer" items="${listCustomer}">
                                <tr>
                                    <td>
                                        <c:out value="${Customer.id}" />
                                    </td>
                                    <td>
                                        <c:out value="${Customer.fname}" />
                                    </td>
                                    <td>
                                        <c:out value="${Customer.lname}" />
                                    </td>
                                    <td>
                                        <c:out value="${Customer.email}" />
                                    </td>
                                    <td><a href="/user-form.jsp?id=<c:out value='${Customer.id}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="deleteCustomer?id=<c:out value='${Customer.id}' />">Delete</a></td>
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>

                    </table>
                </div>
            </div>

</body>
</html>