<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>
<%@page import="com.aleykoteretpro.packages.*" %>
<%@page import="java.lang.reflect.Field" %>
<% List timlolList= (List) request.getAttribute("timlolList"); %>
<% Field[] fields= (Field[]) request.getAttribute("timlolFields");
List workOrderList = (List) request.getAttribute("workOrderList");
List allJobRequestList = (List) request.getAttribute("allJobRequestList");
String currentUser = request.getParameter("Username");

%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Clients View</title>
	<link rel="stylesheet" href="../view/css/bootstrap.min.css">
	<link rel="stylesheet" href="../view/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="../view/css/main.css">
	<script src="/VEF_CRM/view/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<script src="/VEF_CRM/view/js/admin.js"></script>
	<link href="../view/css/dashboard.css" rel="stylesheet">

	
	<!-- JQUERY -->
	<script src="../view/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script> window.jQuery || document.write('<script src="../view/js/vendor/jquery-1.10.1.js"><\/script>');</script>
	<script src="../view/js/main.js"></script>
	
	<!-- Data Tables -->
    <link rel="stylesheet" href="../view/css/datatables.css">
	<script src="../view/js/jquery.dataTables.min.js"></script>
	<script src="../view/js/datatables.js"></script>	
	</head>
<body>
<!-- Header Start -->
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand"
					href="../controller/HomePageLoad?Username=<%out.print(request.getParameter("Username"));%>"
					id="Username" value="Admin2">Aley Koteret Productions</a>
			</div>

			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="http://www.aleykoteretpro.com/#!about/c1enr">About</a></li>
					<li><a href="http://www.aleykoteretpro.com/#!contact/con8">Contact</a></li>
					<li><a href="#">Open Work Orders (<%out.print(workOrderList.size()); %>)</a></li>
					<li><a href="http://localhost:8080/VEF_CRM/controller/viewAllOpenedJobRequest?Username=<%out.print(currentUser);%>">
					Open Job Requests (<%out.print(allJobRequestList.size()); %>)</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Header Ends -->

	<br>
	<br>
	<br>
	
	<!-- Side Bar -->
	<div id="sidebar-wrapper">
		<div class="col-sm-3 col-md-2 sidebar">
			<div class="row">
				<div class="thumbnail">
					<img src="../view/images/Aley Koteret Logo.jpg" alt="...">
					<h3 align="center">
						Hi
						<%
						out.print(currentUser);
					%>
					</h3>
					<div class="panel panel-primary">
						<div class="panel-body">
							<clockcenter class="paragraph1">
							<div class="clockcenter" align="center">
								<digiclock>12:45:25</digiclock>
							</div>
							</clockcenter>
							<script src="/VEF_CRM/view/js/admin.js"></script>
						</div>
					</div>
				</div>
			</div>

			<ul class="nav nav-sidebar-fixed">
				<li><a href="../controller/viewClient">Clients</a></li>
				<li><a href="../controller/viewTimlol">Transcribers</a></li>
				<li><a href="../controller/viewTrans">Translators</a></li>
				<li><a href="../controller/viewWorkOrder">Work Orders</a></li>
				<li><a href="../controller/CreateNewWorkOrder?Username=<%out.print(currentUser);%>">New Work Order</a></li>
			</ul>
		</div>
	</div>
	<!-- Sidebar Ends -->
	
    <!--Clients Table -->
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header-fixed">Timlol Table</h1>
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
        
        
        
        
              		<!--Add/update/new Form-->
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
      </form>
      <br>
      <br>
        </div>
	</div>
	        	<!-- Bottom Navigation Bar -->
		<div class="navbar navbar-inverse navbar-fixed-bottom">
			<div class="row">
				<div class="col-lg-10">
					<p class="text-info">Copyright &copy; Koby Riskovich</p>
				</div>
			</div>
		</div>
		

</body>
</html>
