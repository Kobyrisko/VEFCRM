<%@page import="org.hibernate.jdbc.Work"%>
<%@page import="com.aleykoteretpro.packages.*,java.util.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%	List clientList = (List) request.getAttribute("clientList"); %>
<%	List timlolList = (List) request.getAttribute("timlolList"); %>
<%	List transList = (List) request.getAttribute("transList");
String currentUser = new String(request.getParameter(("Username")));
%>
<%	JobRequest i_JobRequest = (JobRequest) request.getAttribute("currentJobRequest"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>HomePage</title>
<script	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="../view/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../view/js/bootstrap-select.js"></script>
<script src="../view/js/bootstrap.min.js"></script>
<script	src="/VEF_CRM/view/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="/VEF_CRM/view/js/admin.js"></script>
<script>
$("#submit").prop('disabled', true);​
</script>
<script type="text/javascript">
	$(window).on('load', function() {

		$('.selectpicker').selectpicker({
			'selectedText' : 'cat'
		});
	});
</script>
<link href="../view/css/bootstrap.css" rel="stylesheet">
<link href="../view/css/dashboard.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../view/css/bootstrap-select.css">
<style>
body {
	padding-bottom: 20px;
}
</style>

<!-- Select Picker Resources -->
</head>


<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="../controller/HomePageLoad?Username=<%out.print(currentUser);%>"
					id="Username" value="Admin2">Aley Koteret Productions</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="http://www.aleykoteretpro.com/#!about/c1enr">About</a></li>
				<li><a href="http://www.aleykoteretpro.com/#!contact/con8">Contact</a></li>
			</ul>
		</div>
	</div>
	<br>
	<br>
	<br>

	<!-- Side Bar -->
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
						<div class="clockcenter" align="center">
							<digiclock>12:45:25</digiclock>
						</div>
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
		</ul>
	</div>
	
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<div class="col-md-6">
			<div class="thumbnail" style="background-color: aqua; border-color: black;">
				<form class="form-signin"
					action="http://10.0.0.11:8080/VEF_CRM/controller/viewJobRequest"
					method="get" align="center">
					<h1 align="center" class="form-signin-heading">Update Job Request</h1>
					
					<input type="text" class="form-control" name="jobRequestID" style="height: 35px"
						value="<%out.print(i_JobRequest.getId());%>" readonly>
						<h4>Work Order ID</h4> 
						<input type="text" class="form-control" name="jobRequestWorkOrderID" value="<%out.print(i_JobRequest.getWorkOrderID());%>">
						<h4>FreelancerName</h4> 
						<input type="text" class="form-control" name="jobRequestFreeLancerName" value= <%out.print(i_JobRequest.getFreeLancerName()); %> readOnly>
						<h4>Finish Date</h4> 
						<input type="date" class="form-control" name="jobRequestFinishDate"  value= <%out.print(i_JobRequest.getFinishDate()); %>>
						<h4>Set Price</h4> 
						<input type="number" class="form-control" name="jobRequestPrice" value= <%out.print(i_JobRequest.getPrice()); %>>
						<h4>Set Month Of Payment</h4> 
						<input type="number" class="form-control" name="jobRequestMonth" value= <%out.print(i_JobRequest.getMonth()); %>>
						<h4>Name Of Job</h4> 
						<input type="text" class="form-control" name="jobRequestNameOfJob" value= <%out.print(i_JobRequest.getNameOfJob()); %>>
						<h4>Comments</h4> 
						<input type="text" class="form-control" name="jobRequestComments" value= <%out.print(i_JobRequest.getComments()); %>>
						<h4>Status</h4> 
						<select class="selectpicker" data-width="100%" name="jobRequestStatus">
       					<optgroup label="Status">
        		     	<option><%out.print(i_JobRequest.getStatus()); %></option>
        		     	<option>Opened</option>
        		     	<option>Done</option>
        		     	<option>Paid</option>
						<input name="Username" value="<%out.print(currentUser);%>" hidden/>
						<input class="btn-primary" type="submit" name="action1" value="Update" onclick="alert('Updating Work Order'); return true" />
				</form>
			</div>
		</div>
		</div>

	<!-- Bottom Navigation Bar -->
	<div class="footer">
		<div class="container">
			<div class="navbar navbar-inverse navbar-fixed-bottom"
				role="navigation">
				<div class="col-lg-10">
					<p class="text-info">Copyright &copy; Koby Riskovich</p>
				</div>
			</div>
		</div>
	</div>
<script>
document.setElementById("Username").innerHTML=Admin;
</script>

	<script>
		window.jQuery
				|| document
						.write('<script src="js/vendor/jquery-1.10.1.js"><\/script>')
	</script>
	<script src="../view/js/vendor/bootstrap.min.js"></script>
	<script src="../view/js/main.js"></script>
</body>
</html>
