<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>
<%@page import="com.aleykoteretpro.packages.*" %>
<%@page import="java.lang.reflect.Field" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    <% List clientList= (List) request.getAttribute("clientList"); %>
    <% List timlolList= (List) request.getAttribute("timlolList"); %>
    <% List transList= (List) request.getAttribute("transList"); %>
    <% Field[] fields= (Field[]) request.getAttribute("workOrderFields"); %>
    <% List workOrderList= (List) request.getAttribute("workOrderList"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Work Order View</title>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script type="text/javascript" src="../view/js/bootstrap-select.js"></script>
		<link rel="stylesheet" type="text/css" href="../view/css/bootstrap-select.css">
		<link rel="stylesheet" href="../view/css/bootstrap.min.css">
		<script src="../view/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="../view/css/datatables.css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        
        <script src="../view/js/bootstrap.min.js"></script>
        <style>
            body {
                padding-bottom: 20px;
            }
        </style>
        <link rel="stylesheet" href="../view/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../view/css/main.css">
    
    
    <script type="text/javascript">
        $(window).on('load', function () {

            $('.selectpicker').selectpicker({
                'selectedText': 'cat'
            });

            // $('.selectpicker').selectpicker('hide');
        });
    </script>
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
     href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
	</head>
<body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a href="/VEF_CRM/controller/viewHome" class="navbar-brand">Aley Koteret Productions</a>
        </div>
             <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="http://www.aleykoteretpro.com/#!about/c1enr">About</a></li>
            <li><a href="http://www.aleykoteretpro.com/#!contact/con8">Contact</a></li>
            <li class="dropdown">
              <a href="/Jave_ee_FP/" class="dropdown-toggle" data-toggle="dropdown">Views <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li class="divider"></li>
                <li class="dropdown-header">Views</li>
                <li><a href="/VEF_CRM/controller/viewClient">Clients</a></li>
                <li><a href="/VEF_CRM/controller/viewTimlol">Transcribers</a></li>
                <li><a href="/VEF_CRM/controller/viewTrans">Translators</a></li>
                <li><a href="/VEF_CRM/controller/viewWorkOrder">Work Orders</a></li>
                 <li><a href="/VEF_CRM/controller/viewCoupons">Coupons</a></li>
              </ul>
            </li>
          </ul> 
        </div><!--/.navbar-collapse -->
      </div>
    </div>        <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>Java_EE Final Project!</h1>
        <p> Welcome To Aley Koteret Productions Inc</p>
      </div>
    </div>
    <br>
    <br>
    <br>
    <br>
 <h3 align="center">Work Orders List</h3>
			<div id="wrap">
			<div class="container">
				<table cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered">
					<thead>
					 <tr>
						<th>Work Order ID</th>
						<th>Client Name</th>
						<th>Job Name</th>
						<th>Job</th>
						<th>From Language</th>
						<th>To Language</th>
						<th>Lengh</th>
						<th>Translator Name</th>
						<th>Transcriber Name</th>
						<th> Status</th>
						<th>Start Date</th>
						<th>Finish Date</th>
						<th>Client Get</th>
						<th>Notifications</th>
          </tr>
        </thead>
        <tbody>
        <%	//dispalying on screen
        	
        	 for(int i=0; i<workOrderList.size(); i++)
        	{
        		WorkOrder wo=(WorkOrder)workOrderList.get(i);
        		%>
        	  <tr>
              <td><%out.print(wo.getId()); %></td>
              <td><%out.print(wo.getClient()); %> </td>
              <td><%out.print(wo.getNameOfJob()); %></td>
              <td><%out.print(wo.getJob()); %></td>
              <td><%out.print(wo.getLang1()); %></td>
              <td><%out.print(wo.getLang2()); %></td>
              <td><%out.print(wo.getLength()); %></td>
              <td><%out.print(wo.getTranslator()); %></td>
              <td><%out.print(wo.getTimlol()); %></td>
              <td><%out.print(wo.getStatus()); %></td>
              <td><%out.print(wo.getStartDate()); %></td>
              <td><%out.print(wo.getFinishDate()); %></td>
              <td><%out.print(wo.getClientGet()); %></td>
               <td><%out.print(wo.getNotifications()); %></td>
 			  </tr>
        	<%
        	 }
        %>
           </tbody>
        </table>
        </div>
        </div>
        <script src="../view/js/jquery.dataTables.min.js"></script>

		<script src="../view/js/datatables.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			$('.datatable').dataTable({
				"sPaginationType": "bs_full"
			});	
			$('.datatable').each(function(){
				var datatable = $(this);
				// SEARCH - Add the placeholder for Search and Turn this into in-line form control
				var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
				search_input.attr('placeholder', 'Search');
				search_input.addClass('form-control input-sm');
				// LENGTH - Inline-Form control
				var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
				length_sel.addClass('form-control input-sm');
			});
		});
		</script>
			<div class="container">
		      <div class="row-fluid">
            <form class="form-signin" action="http://10.0.0.11:8080/VEF_CRM/controller/TechUpdateWorkOrder" method="get">
        <h2 align = "center" class="form-signin-heading">Add/Update WorkOrders Form</h2>
        <input type="text" class="form-control" placeholder="OrderID" required name="OrderID" style="height:35px">
        <select class="selectpicker" data-width="100%" name="Status" multiple>
       		 <optgroup label="Source Language">
        		     <option>Status</option>
        		     <option>Work File Issued</option>
        		     <option>Sent To Translator</option>
        		     <option>Sent To Transcriber</option>
     				 <option>In Recording Process</option>
     				  <option>Waiting For Watch</option>
     				 <option>Sent To Client</option>
     				 <option>Done</option>
     				 <option>Invoice Issued</option>
   	  					</optgroup>
     		 </select>
     		 
     		  <input type="text" class="form-control" placeholder="Notifications" name="Notifications" style="height:35px">
     		  <input type="text" class="form-control" placeholder="Lengh" name="Length" style="height:35px" >
              <input class="btn-primary" type="submit" name="action1" value="Update" onclick="alert('Updating Work Order'); return true" />
      </form>
      </div>
      </div>
      <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.1.js"><\/script>')</script>
        <script src="../view/js/vendor/bootstrap.min.js"></script>
        <script src="../view/js/main.js"></script>
    <!--    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.js"></script> --> 
</body>
</html>