<%@page import="org.hibernate.jdbc.Work"%>
<%@page import="com.aleykoteretpro.packages.*,java.util.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%	List clientList = (List) request.getAttribute("clientList"); %>
<%	List timlolList = (List) request.getAttribute("timlolList"); %>
<%	List transList = (List) request.getAttribute("transList"); %>
<%	WorkOrder i_CurrentWorkOrder = (WorkOrder) request.getAttribute("currentWorkOrder"); %>

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
				<a class="navbar-brand" href="../controller/HomePageLoad?Username=<%out.print(request.getParameter("Username"));%>"
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
					String currentUser = new String(request.getParameter(("Username")));
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
					action="http://10.0.0.11:8080/VEF_CRM/controller/viewWorkOrder"
					method="get" align="center">
					<h1 align="center" class="form-signin-heading">Update Work
						Order Status</h1>
					<input type="text" class="form-control" name="OrderID" style="height: 35px"
						value="<%out.print(i_CurrentWorkOrder.getId());%>" readonly> 
						<input type="text" class="form-control"	value="<%out.print(i_CurrentWorkOrder.getStartDate());%>"
						name="StartDate" style="height: 35px" readonly> 
						<input type="date"
						class="form-control" placeholder="Finish Date" name="FinishDate"
						value="<%out.print(i_CurrentWorkOrder.getFinishDate());%>"
						style="height: 35px"> <input type="text"
						class="form-control" placeholder="Job Name" name="nameOfJob"
						value="<%out.print(i_CurrentWorkOrder.getNameOfJob());%>"
						style="height: 35px"> 
						<select class="selectpicker" data-width="100%" name="Client">
						<optgroup label="Select Client">
							<option>
								<%
									out.print(i_CurrentWorkOrder.getClient());
								%>
							</option>
							<%
								//dispalying on screen
								for (int i = 0; i < clientList.size(); i++) {
									Client cl = (Client) clientList.get(i);
							%>
							<option>
								<%
									out.print(cl.getCompanyName());
								%>
							</option>
							<%
								}
							%>
						</optgroup>
						
					</select> 
					
					<select class="selectpicker" name="Job" data-width="100%"
						title="<%out.print(i_CurrentWorkOrder.getJob());%>" multiple value= "<%out.print(i_CurrentWorkOrder.getJob());%>">
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
					</select> <select class="selectpicker" data-width="100%" name="Lang1"
						value="<%out.print(i_CurrentWorkOrder.getLang1());%>">
						<optgroup label="Source Language">
							<option>English</option>
							<option>Hebrew</option>
						</optgroup>
					</select> <select class="selectpicker" data-width="100%" name="Lang2"
						value="<%out.print(i_CurrentWorkOrder.getLang2());%>">
						<optgroup label="Destenation Language">
							<option>Hebrew</option>
							<option>English</option>
						</optgroup>
					</select> <input type="text" class="form-control" placeholder="Lengh"
						name="Length" style="height: 35px"
						value="<%out.print(i_CurrentWorkOrder.getLength());%>"> <select
						class="selectpicker" data-width="100%" name="Translator">
						<optgroup label="Select Translator">
							<option>
								<%
									out.print(i_CurrentWorkOrder.getTranslator());
								%>
							</option>
							<%
								//dispalying on screen
								for (int i = 0; i < transList.size(); i++) {
									Trans tr = (Trans) transList.get(i);
							%>
							<option>
								<%
									out.print(tr.getFirstName());
										out.print(" ");
										out.print(tr.getLastName());
								%>
							</option>
							<%
								}
							%>
						</optgroup>
					</select> <select class="selectpicker" data-width="100%" name="Timlol">
						<optgroup label="Select Timlol">
							<option>
								<%
									out.print(i_CurrentWorkOrder.getTimlol());
								%>
							</option>
							<%
								//dispalying on screen
								for (int i = 0; i < timlolList.size(); i++) {
									Timlol tm = (Timlol) timlolList.get(i);
							%>
							<option>
								<%
									out.print(tm.getFirstName());
										out.print(" ");
										out.print(tm.getLastName());
								%>
							</option>
							<%
								}
							%>
						</optgroup>
					</select> <select class="selectpicker" data-width="100%" name="Status">
						<optgroup label="Source Language">
							<option>
								<%
									out.print(i_CurrentWorkOrder.getStatus());
								%>
							</option>
							<option>Opened</option>
							<option>Translation</option>
							<option>Tizmon</option>
							<option>Client Review</option>
							<option>Recording</option>
							<option>Done For Client</option>
							<option>Invoice Issued</option>
						</optgroup>
					</select> <select class="selectpicker" data-width="100%" name="ClientGet"
						multiple
						title="<%out.print(i_CurrentWorkOrder.getClientGet());%>">
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
					</select> <input type="text" class="form-control" placeholder="Price"
						name="Price" style="height: 35px"
						value="<%out.print(i_CurrentWorkOrder.getPrice());%>"> <input
						type="text" class="form-control" placeholder="Notifications"
						name="Notifications" style="height: 35px"
						value="<%out.print(i_CurrentWorkOrder.getNotifications());%>">
					<input class="btn btn-default" type="submit" name="action1"
						value="Update" onclick="alert('Updating Work Order'); return true" />
						<input class="btn btn-default" type="submit" name="action1"
						value="Delete" onclick="return confirm('Delete Work Order?');" />
					<input name="Username" value="<%out.print(currentUser); %>" hidden/>
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
