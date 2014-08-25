<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>
<%@page import="com.aleykoteretpro.packages.*" %>
<%@page import="java.lang.reflect.Field" %>
<% List timlolList= (List) request.getAttribute("timlolList"); %>
<% Field[] fields= (Field[]) request.getAttribute("timlolFields"); %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Transcribers View</title>
		<link rel="stylesheet" href="../view/css/datatables.css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link rel="stylesheet" href="/VEF_CRM/view/css/bootstrap.min.css">
        <style>
        body
         {
                padding-bottom: 20px;
            }
        </style>
        <link rel="stylesheet" href="../view/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../view/css/main.css">

        <script src="../view/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
          <a href="../view/homePage.jsp"class="navbar-brand">Aley Koteret Productions</a>
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
                <li><a href="/VEF_CRM/controller/viewTimlol">Timlols</a></li>
                <li><a href="/VEF_CRM/controller/viewTrans">Translators</a></li>
                <li><a href="/VEF_CRM/controller/viewWorkOrder">Work Orders</a></li>
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
    <h3 align="center">Transcribers List</h3>
			<div id="wrap">
			<div class="container">
				<table cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered">
					<thead>
					 <tr>
						<th>Timlol ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Phone Number</th>
						<th>Email</th>
						<th>Adress</th>
						<th>Timlol Code</th>
						<th>Timlol Price</th>
						
          </tr>
        </thead>
        <tbody>
        <%	//Dispalying Rows on Table
        	
        	 for(int i=0; i<timlolList.size(); i++)
        	{
        		Timlol tm=(Timlol)timlolList.get(i);
        		%>
        	  <tr>
              <td><%out.print(tm.getId()); %></td>
              <td><%out.print(tm.getFirstName()); %></td>
              <td><%out.print(tm.getLastName()); %></td>
              <td><%out.print(tm.getPhone()); %></td>
              <td><%out.print(tm.getEmail()); %></td>
              <td><%out.print(tm.getAdress()); %></td>
              <td><%out.print(tm.getTimlolCode()); %></td>
              <td><%out.print(tm.getTimlolPrice()); %></td>
 			  </tr>
        	<%
        	 }
        %>
           </tbody>
        </table>
        </div>
        </div>
		<script src="../view/js/jquery.min.js"></script>
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
			 $('#example').dataTable( {
				  "oTableTools": {
			            "sRowSelect": "multi",
			            "aButtons": [
			                { "sExtends": "editor_create", "editor": editor },
			                { "sExtends": "editor_edit",   "editor": editor },
			                { "sExtends": "editor_remove", "editor": editor }
			                ]
			        
			}});
			
		});
		<!--Add/update/new Form-->
		</script>
		      <div class="container">
 <form class="form-signin" action="http://10.0.0.11:8080/VEF_CRM/controller/viewTimlol" method="get">
        <h2 align = "center" class="form-signin-heading">Add/Update Transcribers</h2>
        <input type="text" class="form-control" placeholder="Timlol ID" required name="Timlolid">
        <input type="text" class="form-control" placeholder="Timlol Code"  name="timlolCode">
        <input type="text" class="form-control" placeholder="Timlol Price"   name="timlolPrice">
         <input type="text" class="form-control" placeholder="Contact First Name" name="firstName">
          <input type="text" class="form-control" placeholder="Contact Last Name" name="lastName">
            <input type="text" class="form-control" placeholder="Phone Number"   name="phone">
			 <input type="text" class="form-control" placeholder="Email" name="email">
              <input type="text" class="form-control" placeholder="Address"   name="adress">
              <input class="btn-primary" type="submit" name="action1" value="Create New" onclick="alert('Creating New Transcriber'); return true" />
              <input class="btn-primary" type="submit" name="action1" value="Update" onclick="alert('Updating Transcriber'); return true" />
              <input class="btn-primary" type="submit" name="action1" value="Delete" onclick="alert('Deleting Transcriber'); return true" />
      </form>
      </div>
      <script>window.jQuery || document.write('<script src="../view/js/jquery-1.10.1.js"><\/script>')</script>
        <script src="../view/js/vendor/bootstrap.min.js"></script>
        <script src="../view/js/main.js"></script>
        
</body>
</html>
