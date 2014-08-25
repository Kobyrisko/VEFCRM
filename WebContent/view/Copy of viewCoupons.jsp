<%@page import="org.hibernate.jdbc.Work"%>
<%@page import="com.aleykoteretpro.packages.*,java.util.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%WorkOrder i_CurrentWorkOrder= (WorkOrder)request.getAttribute("currentWorkOrder"); %>
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

<h1 class="page-header" align="left">View WorkOrder ID = <%out.print(i_CurrentWorkOrder.getId()); %></h1>
			<div class="container" align="left" style="width:250px" >
	 	    <div class="col-md-10">
       		<h1><%out.print(i_CurrentWorkOrder.getId()+" "+i_CurrentWorkOrder.getNameOfJob()); %></h1>
       		<h2><%out.print(i_CurrentWorkOrder.getStatus()); %></h2>
        	<h3><%out.print(i_CurrentWorkOrder.getStartDate());%></h3>
        	<h3><%out.print(i_CurrentWorkOrder.getFinishDate()); %></h3>
        	<h3><%out.print(i_CurrentWorkOrder.getClient());%></h3>
        	<h3><%out.print(i_CurrentWorkOrder.getPrice()); %></h3>
        	<h3><%out.print(i_CurrentWorkOrder.getJob()); %></h3>
        	<h3><%out.print(i_CurrentWorkOrder.getLang1()); %></h3>
        	<h3><%out.print(i_CurrentWorkOrder.getLang2()); %></h3>
        	<h3><%out.print(i_CurrentWorkOrder.getLength()); %></h3>
        	<h3><%out.print(i_CurrentWorkOrder.getTimlol()); %></h3>
        	<h3><%out.print(i_CurrentWorkOrder.getTranslator()); %></h3>
        	<h3><%out.print(i_CurrentWorkOrder.getClientGet()); %></h3>
        	<h3><%out.print(i_CurrentWorkOrder.getNotifications()); %></h3>
        	<h3><%out.print(i_CurrentWorkOrder.getPrice());%></h3>
        <a href="#" class="btn btn-primary" role="button">View</a> 
        <a href="#" class="btn btn-default" role="button">Update Status</a>
    </div>
  </div>
  </html>