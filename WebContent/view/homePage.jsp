<%@page import="com.aleykoteretpro.packages.*,java.util.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%	List workOrderList = (List) request.getAttribute("workOrderList");
	List allJobRequestList = (List) request.getAttribute("allJobRequestList");
	
	String currentUser = request.getParameter(("Username"));
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>HomePage</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description" content="">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="../view/css/bootstrap.min.css">
<link rel="stylesheet" href="../view/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../view/css/main.css">
<script src="/VEF_CRM/view/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="/VEF_CRM/view/js/admin.js"></script>
<link href="../view/css/dashboard.css" rel="stylesheet">
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

	<!-- Main Window -->
	<div class="col-sm-12 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header-fixed">Open Work Orders</h1>
		<div class="row placeholders">
			<%
				for (int i = 0; i < workOrderList.size(); i++) {
					WorkOrder i_CurrentWorkOrder = (WorkOrder) workOrderList.get(i);
			%>
			<div class="col-md-3">
				<div class="thumbnail" style="border-color: blue; border-width: 5px; size: " >
					<%
						if (i_CurrentWorkOrder.getJob().contains("Movie")) {
					%>
					<img src="../view/image_icons/Movie.jpg" class="img-responsive"
						alt="Generic placeholder thumbnail">
					<%
						}
							if (i_CurrentWorkOrder.getJob().contains("Doc")) {
					%>
					<img src="../view/image_icons/Docs.jpg" class="img-responsive"
						alt="Generic placeholder thumbnail">
					<%
						}
							if (!i_CurrentWorkOrder.getJob().contains("Doc")
									&& !i_CurrentWorkOrder.getJob().contains("Movie")) {
					%>
					<img src="../view/image_icons/Voiceover.jpg" class="img-responsive"
						alt="Generic placeholder thumbnail">
					<%
						}
					%>
					<h4>
						<%
							out.print(i_CurrentWorkOrder.getNameOfJob());
						%>
					</h4>
					<h4>
					Job ID:
					<%
					out.print(i_CurrentWorkOrder.getId());
					
					%>
					
					</h4>
					<h3>
						<%
							out.print(i_CurrentWorkOrder.getStatus());
						%>
					</h3>
					<h5>
						<%
							out.print(i_CurrentWorkOrder.getStartDate());
						%>
					</h5>
					<h5>
						Required Date: 
						<%
							out.print(i_CurrentWorkOrder.getFinishDate());
						%>
					</h5>
					<h5>
					Client Name: 
						<%
							out.print(i_CurrentWorkOrder.getClient());
						%>
					</h5>
					<a href="../controller/currentWorkOrderView?currentWorkOrderID=<%out.print(i);%>&Username=<%out.print(currentUser);%>"
						class="btn btn-primary" role="button">View</a>
					<!-- Glimpse -->
				</div>
			</div>

			<%
				}
			%>
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
	<script src="js/jquery-1.10.2.js"></script>
	<script src="js/bootstrap.js"></script>
	<!-- /container -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/vendor/jquery-1.10.1.js"><\/script>')
	</script>
	<script src="../view/js/vendor/bootstrap.min.js"></script>
	<script src="../view/js/main.js"></script>
</body>
</html>
