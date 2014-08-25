<%@page import="com.aleykoteretpro.packages.*,java.util.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%
List workOrderList = (List) request.getAttribute("workOrderList");
List clientList= (List) request.getAttribute("clientList"); 
List timlolList= (List) request.getAttribute("timlolList"); 
List transList= (List) request.getAttribute("transList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Create New Work Order List</title>
<link rel="stylesheet" href="../view/css/bootstrap.css">
<link href="../view/css/dashboard.css" rel="stylesheet">
<script	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script	type="text/javascript" src="../view/js/bootstrap-select.js"></script>
<link rel="stylesheet" type="text/css" href="../view/css/bootstrap-select.css">
<link rel="stylesheet" type="text/css" href="../view/css/main.css">
<!-- 3.0 -->
<script src="../view/js/bootstrap.min.js"></script>
<!-- Clock Style needs to be in another library -->
</head>
<body>
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
				</ul>
			</div>
		</div>
	</div>

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
						String currentUser = new String(request.getParameter(("Username")));
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
				<li><a href="../controller/CreateNewWorkOrder">New Work Order</a></li>
			</ul>
		</div>
	</div>
	<!-- Sidebar Ends -->

	<!-- Main Window -->
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<div class="col-md-6">
			<div class="thumbnail" style="background-color: aqua; border-color: black;">
            <form class="form-signin" action="http://10.0.0.11:8080/VEF_CRM/controller/viewWorkOrder" method="get">
        <h2 align = "center" class="form-signin-heading">Add/Update WorkOrders Form</h2>
        <input type="text" class="form-control"  name="OrderID" style="height:35px" 
        value= <%out.print(workOrderList.size()+1); %> >
        <input type="date" class="form-control" placeholder="Start Date" required name="StartDate" style="height:35px" value=datepicker.setDate>
         <input type="date" class="form-control" placeholder="Finish Date" required name="FinishDate" style="height:35px">
           <input type="text" class="form-control" placeholder="Job Name" name="nameOfJob" style="height:35px" required>
           <select class="selectpicker" data-width="100%" name="Client" required>
       		 <optgroup label="Select Client">
        		<option>Select Client</option>
        		 <%	//dispalying on screen
        	 for(int i=0; i<clientList.size(); i++)
        	{
        		Client cl=(Client)clientList.get(i);
        		%>
        		<option><% out.print(cl.getCompanyName()); %></option>
        		<%} %>
   	  			</optgroup>
     		 </select>
         <select class="selectpicker" multiple name="Job" data-width="100%" required>
        <optgroup label="Job">
      <option>Doc Tranlation</option>
      <option>Movie Tranlation</option>
      <option>Voice Over</option>
      <option>Digitization To DVD</option>
      <option>Digitization To Computer</option>
      <option>Transcribe Only</option>
      <option>Translation Only/option>
      <option>File To Beta</option>
      <option>File To DVCAM</option>
   	  </optgroup>
      </select>
                   <select class="selectpicker" data-width="100%" name="Lang1" required>
       		 <optgroup label="Source Language">
        		<option>English</option>
     				 <option>Hebrew</option>
   	  					</optgroup>
     		 </select>
                       <select class="selectpicker" data-width="100%"name="Lang2" required>
        <optgroup label="Destenation Language">
      <option>Hebrew</option>
      <option>English</option>
   	  </optgroup>
      </select>
          <input type="number" class="form-control" placeholder="Lengh" name="Length" style="height:35px" required>
           			 <select class="selectpicker" data-width="100%" name="Translator">
       		 <optgroup label="Select Translator">
        		<option>Select Translator</option>
        		 <%	//dispalying on screen
        	 for(int i=0; i<transList.size(); i++)
        	{
        		Trans tr=(Trans)transList.get(i);
        		%>
        		<option><% out.print(tr.getFirstName());out.print(" "); out.print(tr.getLastName()); %></option>
        		<%} %>
   	  			</optgroup>
     		 </select>
			 <select class="selectpicker" data-width="100%" name="Timlol" required>
       		 <optgroup label="Select Timlol">
        		<option>Select Timlol</option>
        		 <%	//dispalying on screen
        	 for(int i=0; i<timlolList.size(); i++)
        	{
        		Timlol tm=(Timlol)timlolList.get(i);
        		%>
        		<option><% out.print(tm.getFirstName());out.print(" "); out.print(tm.getLastName()); %></option>
        		<%} %>
   	  			</optgroup>
     		 </select>
        <select class="selectpicker" data-width="100%" name="Status" required>
       		 <optgroup label="Status">
        		     <option>Status</option>
     				 <option>Opened</option>
     				 <option>Translation</option>
     				 <option>Tizmon</option>
     				 <option>Client Review</option>
     				 <option>Recording</option>
     				 <option>Done For Client</option>
     				 <option>Invoice Issued</option>
   	  					</optgroup>
     		 </select>
     		         <select class="selectpicker" data-width="100%" name="ClientGet" multiple required>
       		 <optgroup label="Client Get">
        		     <option>DVD</option>
     				 <option>HD FILE</option>
     				 <option>SD FILE</option>
     				 <option>DOC</option>
     				 <option>SRT</option>
     				 <option>BluRay</option>
     				 <option>MP4</option>
     				 <option>WMV</option>
     				 <option>Voice Over Mp3</option>
     				 <option>Voice Over Wav</option>
   	  					</optgroup>
     		 </select>
     		 <input type="number" class="form-control" placeholder="Price" name="Price" style="height:35px" required>
     		  <input type="text" class="form-control" placeholder="Notifications" name="Notifications" style="height:35px" required>
              <input class="btn-primary" type="submit" name="action1" value="Create New" onclick="alert('Creating a new Work Order'); return true" />
              <input class="btn-primary" type="submit" name="action1" value="Update" onclick="alert('Updating Work Order'); return true" />
      	<input class="btn-primary" type="submit" name="action1" value="Delete" onclick="alert('Deleting Work Order'); return true" />
      <input name= "Username" value=<%out.print(currentUser);%> hidden >
      </form>
     
		</div>
		</div>
		</div>
		
		
		
		
		
	<!-- Bottom Navigation Bar -->
	<div class="container" src="/view/Test.jsp">
		<div class="navbar navbar-inverse navbar-fixed-bottom">
			<div class="row">
				<div class="col-lg-10">
					<p class="text-info">Copyright &copy; Koby Riskovich</p>
				</div>
			</div>
		</div>
	</div>
	<!-- JavaScript -->
      <script type="text/javascript">	$(window).on('load', function() {
		$('.selectpicker').selectpicker({
			'selectedText' : 'cat'
		});
	});
</script>
        
</body>
</html>
