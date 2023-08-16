<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Employee Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand">
					Employee Management App </a>
			</div>
			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link"></a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Employee</h3>
			<hr>
			<div class="container text-left">
				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					New Employee</a><br />
			</div>

			<br>

			<table id="employee-table" class="table table-bordered">
				<thead>
					<tr>
						<th>Name</th>
						<th>Age</th>
						<th>Salary</th>
						<th>Joining Date</th>
						<th>Skills</th>
						<th>Actions</th>
					</tr>
				<tbody>	

					<c:forEach var="emp" items="${listemp}">
						<tr>
							<td><c:out value="${emp.name}" /></td>
							<td><c:out value="${emp.age}" /></td>
							<td><c:out value="${emp.salary}" /></td>
							<td><fmt:formatDate value="${emp.joiningdate}"
									pattern="yyyy-MM-dd" var="formattedDate" /> <c:out
									value="${formattedDate}" /></td>
							<td><c:forEach items="${emp.skills}" varStatus="loop">
							    ${emp.skills[loop.index]} 
							</c:forEach></td>
							
							<td><a href="edit?id=<c:out value='${emp.id}' />">Edit</a> <a
								 class="delete-link" data-id="<c:out value='${emp.id}' />">Delete</a></td>
						</tr>
					</c:forEach>

				</tbody>

			</table>
		</div>

	</div>

</body>
</html>

<script>
    $(document).ready(function() {
        // Your jQuery and AJAX code will go here
    	$(".delete-link").click(function(e) {
            e.preventDefault(); // Prevent the default link behavior

            var empId = $(this).data("id");
           console.log(empId);
           
           $.ajax({
        	    url: "/CrudAppUsingJsp/delete",
        	    type: "GET",
        	    headers: {
        	        "X-HTTP-Method-Override": "DELETE"
        	    },
        	    data: { id: empId },
        	    
        	    success: function(response) {
        	        // Reload the table content after a successful delete
        	        $("#employee-table").load(" #employee-table > *");
        	    },
        	    error: function(error) {
        	        console.log("Error:", error);
        	    }
        	});
          
        });
    });
</script>