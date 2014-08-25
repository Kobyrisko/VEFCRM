<%@page import="com.aleykoteretpro.packages.*,java.util.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>
<% List couponsList= (List) request.getAttribute("couponsList"); %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   
   
    <head>
   		<title>HomePage</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="../view/css/bootstrap.min.css">
        <link rel="stylesheet" href="../view/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../view/css/main.css">
        <script src="/VEF_CRM/view/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    
    
    <body>
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a href="../controller/HomePageLoad" class="navbar-brand">Aley Koteret Productions</a>
        </div>
        
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="http://www.aleykoteretpro.com/#!about/c1enr">About</a></li>
            <li><a href="http://www.aleykoteretpro.com/#!contact/con8">Contact</a></li>
            <li class="dropdown">
              <a href="" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Magic <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li class="dropdown-header">Magic</li>
                <li><a href="../controller/viewClient">Clients</a> </li>
                <li><a href="../controller/viewTimlol">Transcribers</a></li>
                <li><a href="../controller/viewTrans">Translators</a></li>
                <li><a href="../controller/TeiewWorkOrder">Work Orders</a></li>
              </ul>
            </li>
          </ul> 
        </div>
      </div>
    </div>
  <div class="container">
<br>
<br>
<br>
<center> <img src = "../view/images/Aley Koteret Logo.jpg"  align="absmiddle"
         alt = "Aley Koteret Logo"  /> 
<H2>Aley Koteret Productions New Magic </H2>
<p class="text-info">Please Choose From The Magic Menu</p>
</center>
            <div class="col-md-9">

                <div class="row carousel-holder">

                    <div class="col-md-12">
                        </div>
                    </div>

                </div>
                <br>
                <br>
                <br>
            </div>

<!-- Bottom Navigation Bar -->
    <div class="container">
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
    <!-- /container -->        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.1.js"><\/script>')</script>
        <script src="../view/js/vendor/bootstrap.min.js"></script>
        <script src="../view/js/main.js"></script>
</body>
</html>
