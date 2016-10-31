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
    historyObject = new Object();
   function drawChart() {
	   var data = new google.visualization.DataTable();
	   var stockHistoryTime = new Array();
	   var stockHistoryPrice = new Array();
	   <c:forEach items="${resultOfGetCompany}" var="history"> 
	   		stockHistoryTime.push("${history.lastUpdateTime}");
	   		stockHistoryPrice.push("${history.lastTradePrice}")
	   </c:forEach> 
	  	data.addColumn('datetime', 'Time');
	  	data.addColumn('number', 'Stock price');
	  	var dataForTable = new Array();
	  	
	  	for(var i = 0 ; i < stockHistoryTime.length ; i++){
	  		var newDate = new Date(stockHistoryTime[i]); 
	  		var indivData = new Array();
	  		indivData.push(new Date(newDate.getFullYear(),newDate.getMonth()+1,newDate.getDay(),newDate.getHours(),newDate.getMinutes(),newDate.getSeconds()));
	  		indivData.push(parseFloat(stockHistoryPrice[i]));
	  		console.log(indivData);
	  		dataForTable.push(indivData);
	  		console.log(dataForTable);
	  	}
	  	var options = {
	            title: 'Historical stock trend',
	            width: 900,
	            height: 500,
	            hAxis: {
	              format: 'M/d/yy h:m',
	              gridlines: {count: 15}
	            },
	            vAxis: {
	              gridlines: {count: 15}
	            }
	          };
	  	data.addRows(dataForTable);
	  	var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
	  	chart.draw(data,options);
   }
   
   
 
   </script>
  <script type="text/javascript">
		  $.fn.pageMe = function(opts){
		    var $this = this,
		        defaults = {
		            perPage: 7,
		            showPrevNext: false,
		            hidePageNumbers: false
		        },
		        settings = $.extend(defaults, opts);
		    
		    var listElement = $this;
		    var perPage = settings.perPage; 
		    var children = listElement.children();
		    var pager = $('.pager');
		    
		    if (typeof settings.childSelector!="undefined") {
		        children = listElement.find(settings.childSelector);
		    }
		    
		    if (typeof settings.pagerSelector!="undefined") {
		        pager = $(settings.pagerSelector);
		    }
		    
		    var numItems = children.size();
		    var numPages = Math.ceil(numItems/perPage);
		
		    pager.data("curr",0);
		    
		    if (settings.showPrevNext){
		        $('<li><a href="#" class="prev_link">«</a></li>').appendTo(pager);
		    }
		    
		    var curr = 0;
		    while(numPages > curr && (settings.hidePageNumbers==false)){
		        $('<li><a href="#" class="page_link">'+(curr+1)+'</a></li>').appendTo(pager);
		        curr++;
		    }
		    
		    if (settings.showPrevNext){
		        $('<li><a href="#" class="next_link">»</a></li>').appendTo(pager);
		    }
		    
		    pager.find('.page_link:first').addClass('active');
		    pager.find('.prev_link').hide();
		    if (numPages<=1) {
		        pager.find('.next_link').hide();
		    }
		  	pager.children().eq(1).addClass("active");
		    
		    children.hide();
		    children.slice(0, perPage).show();
		    
		    pager.find('li .page_link').click(function(){
		        var clickedPage = $(this).html().valueOf()-1;
		        goTo(clickedPage,perPage);
		        return false;
		    });
		    pager.find('li .prev_link').click(function(){
		        previous();
		        return false;
		    });
		    pager.find('li .next_link').click(function(){
		        next();
		        return false;
		    });
		    
		    function previous(){
		        var goToPage = parseInt(pager.data("curr")) - 1;
		        goTo(goToPage);
		    }
		     
		    function next(){
		        goToPage = parseInt(pager.data("curr")) + 1;
		        goTo(goToPage);
		    }
		    
		    function goTo(page){
		        var startAt = page * perPage,
		            endOn = startAt + perPage;
		        
		        children.css('display','none').slice(startAt, endOn).show();
		        
		        if (page>=1) {
		            pager.find('.prev_link').show();
		        }
		        else {
		            pager.find('.prev_link').hide();
		        }
		        
		        if (page<(numPages-1)) {
		            pager.find('.next_link').show();
		        }
		        else {
		            pager.find('.next_link').hide();
		        }
		        
		        pager.data("curr",page);
		      	pager.children().removeClass("active");
		        pager.children().eq(page+1).addClass("active");
		    
		    }
		};
		
		$(document).ready(function(){
		    
		  $('#myTable').pageMe({pagerSelector:'#myPager',showPrevNext:true,hidePageNumbers:false,perPage:6});
		    
		});
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
                                
                                <tbody id="myTable">
                                <c:forEach items="${resultOfGetCompany}" var="stockObject" varStatus="stock">
                                    <tr>
                                        <td><c:out value="${stockObject.lastUpdateTime}" /></td>
                                        <td><c:out value="${stockObject.lastTradePrice}" /></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                         </table>
                         </div>
                         <div class="col-md-12 text-center">
					      <ul class="pagination pagination-lg pager" id="myPager"></ul>
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
