<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>User Administration List Page</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<body class="container">
	
	<div class="container row">
			<div class="well bs-component">
			<div>
				<form class="form-horizontal" name="getAllCompanies" action="getAllCompanies"
					method="GET">
					
					<button id="deleteButton" type="submit"
												class="btn btn-danger btn-xs" 
												>
												<span class="glyphicon glyphicon-remove"
													aria-hidden="true"></span>
					</button>
					
				</form>
				"${result}"
				</div>
				
			</div>
		</div>
		
	
	
</body>
</html>