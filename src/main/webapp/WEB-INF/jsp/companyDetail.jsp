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
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--></head>
    
    <script type="text/javascript">
     google.load('visualization', '1.0', {'packages':['corechart']});
    google.setOnLoadCallback(drawChart);
 
   function drawChart() {
	   var temp=document.getElementById("txt_temp");
	   var array = "${resultOfGetCompany}";
	   console.log(array);
	   for(var i = 0 ; i < "${resultOfGetCompany}".length ; i++){
		   console.log("${resultOfGetCompany}"[i]);
	   }
           
         
   }
 
 
  </script>
  
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
                    <li>
                        <a href="getAllCompanies"><i class="fa fa-fw fa-dashboard"></i> List Of Stocks</a>
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
                        <h2 class="page-header" >
                            Stock Price history - 
                            <small style="text-transform: uppercase;">${company}</small>
                        </h2>
                        
                    </div>
                </div>
                <!-- /.row -->
					
				<div class="row">
					 <div class="col-lg-6">
                        <div class="table-responsive">
							<table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Time</th>
                                        <th>Price</th>
                                        
                                    </tr>
                                </thead>
                                <c:forEach items="${resultOfGetCompany}" var="stockObject" varStatus="stock">
                                <tbody>
                                    <tr>
                                        <td><c:out value="${stockObject.lastUpdateTime}" /></td>
                                        <td><c:out value="${stockObject.lastTradePrice}" /></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                         </table>
                         </div>
                         </div>
                         </div>
                         
                         <input type="hidden" value="${resultOfGetCompany}" name="txt_temp" id="txt_temp"/>
    						<div id="chart_div"></div>
                                
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

	

</body>

</html>
