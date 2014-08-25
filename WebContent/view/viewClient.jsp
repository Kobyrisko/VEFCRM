<%@page import="com.aleykoteretpro.packages.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>
<%@page import="java.lang.reflect.Field" %>
<% List clientList= (List) request.getAttribute("clientList"); %>
<% List workOrderList = (List) request.getAttribute("workOrderList");
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
	

</body>
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
				<li><a href="../controller/viewCoupons">Coupons</a></li>
				<li><a href="../controller/CreateNewWorkOrder?Username=<%out.print(currentUser);%>">New Work Order</a></li>
			</ul>
		</div>
	</div>
	<!-- Sidebar Ends -->
	
    <!--Clients Table -->
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header-fixed">Clients Table</h1>
		<div class="col-md-15">
		<table class="datatable table table-striped table-bordered" border="5px">
		<thead>
		 <tr>
              <th>Client ID</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Phone Number</th>
              <th>Email</th>
              <th>Address</th>
              <th>Company Name</th>
              <th>Company Code</th>
          </tr>
          
        </thead>
        <tbody>
        
        <%	//Dispalying rows on Table
        	
        	 for(int i=0; i<clientList.size(); i++)
        	{
        		Client cl=(Client)clientList.get(i);
        		%>
        	  <tr>
              <td><%out.print(cl.getId()); %></td>
              <td><%out.print(cl.getFirstName()); %>
              <td><%out.print(cl.getLastName()); %></td>
              <td><%out.print(cl.getPhone()); %></td>
              <td><%out.print(cl.getEmail()); %></td>
              <td><%out.print(cl.getAdress()); %></td>
              <td><%out.print(cl.getCompanyName()); %></td>
              <td><%out.print(cl.getCompanyCode()); %></td>
 			  </tr>
        	<%
        	 }
        %>
           </tbody>
        </table>
        </div>
        
        <!-- Form -->
        <form align= "center" class="form-signin" action="http://10.0.0.11:8080/VEF_CRM/controller/viewClient" method="get">
        <h2 align = "center" class="form-signin-heading">Add/Update Client Form</h2>
        <input type="text" class="form-control" placeholder="Client ID" required name="Clientid">
        <input type="text" class="form-control" placeholder="Company Code"  name="companyCode">
        <input type="text" class="form-control" placeholder="Company Name"   name="companyName">
         <input type="text" class="form-control" placeholder="Contact First Name" name="firstName">
          <input type="text" class="form-control" placeholder="Contact Last Name" name="lastName">
            <input type="text" class="form-control" placeholder="Phone Number"   name="phone">
			 <input type="text" class="form-control" placeholder="Email" name="email">
              <input type="text" class="form-control" placeholder="Address"   name="adress">
              <input class="btn-primary" type="submit" name="action1" value="Create New" onclick="alert('Creating New Client'); return true" />
              <input class="btn-primary" type="submit" name="action1" value="Update" onclick="alert('Updating Client'); return true;location.href='http://10.0.0.11:8080/VEF_CRM/controller/viewClient'" />
      </form>
        </div>
        <!-- Main Ends -->
        
        	<!-- Bottom Navigation Bar -->
		<div class="navbar navbar-inverse navbar-fixed-bottom">
			<div class="row">
				<div class="col-lg-10">
					<p class="text-info">Copyright &copy; Koby Riskovich</p>
				</div>
			</div>
		</div>

</html>
