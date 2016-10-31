<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Monitor Stock Price</title>

    <!-- Bootstrap Core CSS -->
    <spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCss" />

    <!-- Custom CSS -->
    <spring:url value="/resources/css/sb-admin.css" var="mainCss" />

    <!-- Custom Fonts -->
    <spring:url value="/resources/font-awesome/css/font-awesome.min.css" var="fontJs" />
    
	<link href="${bootstrapCss}" rel="stylesheet" />
	<link href="${mainCss}" rel="stylesheet" />
    <script src="${fontJs}"></script>
    	
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--></head>
<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="getAllCompanies">Stock Monitor</a>
            </div>
            <!-- Top Menu Items -->
            
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    
                    <li class="active">
                        <a><i class="fa fa-fw fa-file"></i>List Of Stocks</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Stocks
                            <small></small>
                        </h1>
                        
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                <form class="form-horizontal" name="addCompany" action="addCompany" method="GET">
                <div class="col-lg-4">
                
                <input class="form-control" name="symbol" style="text-transform: uppercase;" placeholder="Add company to the system">
                
                </div>
                <div class="col-lg-2">
                <button type="submit" class="btn btn-default">Add Company</button>
                </div>
                </form>
                </div>
                <br>
                <div class="row">
                <h2>${resultOfGetCompany}</h2>
                    <div class="col-lg-6">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Company ticker symbol</th>
                                        <th>Company name</th>
                                        <th>Current price</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <c:forEach items="${result}" var="stockObject" varStatus="stock">
                                <tbody>
                                    <tr>
                                        <td style="text-transform: uppercase;"><c:out value="${stockObject.symbol}" /></td>
                                        <td><c:out value="${stockObject.companyName}" /></td>
                                        <td><c:out value="${stockObject.price}" /></td>
                                        <td>
                                        <form class="form-horizontal" name="deleteCompany" action="deleteCompany" method="GET">
                                        <button type="submit" name="IdToDelete" value ="<c:out value="${stockObject.symbol}" />" class="btn btn-danger">
								          <span class="glyphicon glyphicon-remove"></span>
								        </button>
								        </form>
								        </td>
								        <td>
                                        <form class="form-horizontal" name="getCompany" action="getCompany" method="GET">
                                        <button type="submit" name="IdToShow" value ="<c:out value="${stockObject.symbol}" />" class="btn btn-info">
								          <span class="glyphicon glyphicon-list-alt"></span>
								        </button>
								        </form>
								        </td>
                                    </tr>
                                 </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

	

</body>

</html>
