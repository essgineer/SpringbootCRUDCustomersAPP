<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
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
			        	<a href="https://github.com/essgineer" class="navbar-brand"> Customer Management App </a>
			       </div>
			       <ul class="navbar-nav">
			           <li><a href="/" class="nav-link">Customer List</a></li>
			       </ul>
		      </nav>
     </header>
     <br>
     <div class="container col-md-5">
       	 <div class="card">
        	<div class="card-body">
         		  <c:if test="${ param.id != null}">
          			  <form action="updateCustomer" method="post">
         		  </c:if>
         		  <c:if test="${ param.id == null}">
          			 <form action="addCustomer" method="post">
         		  </c:if>
		          <caption>
			           <h2>
				            <c:if test="${ param.id != null}">
				                          Edit Customer
				            </c:if>
				            <c:if test="${ param.id == null}">
				                          Add New Customer
				            </c:if>
			           </h2>
		           </caption>
                              
			       <c:if test="${ param.id != null}">
			       		<input type="hidden" name="id" value="<c:out value='${ param.id}' />" />
			       </c:if>
			       <c:if test="${param.id == null}">
						   <fieldset class="form-group">
								<label>Customer ID</label> <input type="number" value="<c:out value='${ param.id}' />" class="form-control" name="id" required="required">
						   </fieldset>
				   </c:if>
			       <fieldset class="form-group">
			       		      <label>Customer First Name</label> <input type="text" value="<c:out value='${customer.fname}' />" class="form-control" name="fname" required="required">
			       </fieldset>
			       <fieldset class="form-group">
			       		      <label>Customer Last Name</label> <input type="text" value="<c:out value='${customer.lname}' />" class="form-control" name="lname">
			       </fieldset>
			       <fieldset class="form-group">
			                  <label>Customer Email</label> <input type="text" value="<c:out value='${customer.email}' />" class="form-control" name="email">
			       </fieldset>
			       <button type="submit" class="btn btn-success">Save</button>
    			</form>
    		</div>
    	</div>
     </div>
</body>
</html>