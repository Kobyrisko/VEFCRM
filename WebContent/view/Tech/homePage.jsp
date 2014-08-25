<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>
<%@page import="com.aleykoteretpro.packages.*" %>
<%@page import="java.lang.reflect.Field" %>
    <% List clientList= (List) request.getAttribute("clientList"); %>
    <% List timlolList= (List) request.getAttribute("timlolList"); %>
    <% List transList= (List) request.getAttribute("transList"); %>
    <% Field[] fields= (Field[]) request.getAttribute("workOrderFields"); %>
    <% List workOrderList= (List) request.getAttribute("workOrderList"); %>

<html>
<head>
<meta charset="utf-8" />
<title>Koby Risko</title>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.2/jquery.mobile-1.1.2.min.css" />
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script src="http://code.jquery.com/mobile/1.1.2/jquery.mobile-1.1.2.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<style>
img.fullscreen
{
	max-height: 100%;
	max-width: 100%;	
}
</style>
</head>


<body>
<!--Page-->
<div data-role="page" id="home">
<header data-role="header">
<h1>
The New Magic
</h1>
</header>

<article data-role="content">
<ul data-role="listview" data-filter="true">
<li>
<h1>Doggie</h1>
<br />
<br />
<img src="images/Australia.png" alt="Min Pin" />
<p>Bla Bla Bla 1</p>
</a>

</li>
<li>
<a href="#dog2">
<h1>Doggie2</h1>
<br />
<br />
<img src="images/Cameroon.png" alt="Min Pin" />
<p>Bla Bla Bla 2</p>
</a>
</li>
</ul>
</article>


<footer data-role="footer" data-position="fixed">
<nav data-role="navbar">
<ul>
<li> <a href="#" data-icon="home">View all Opened</a></li>
<li> <a href="#" data-icon="grid">View all Done</a></li>
<li> <a href="#" data-icon="info">View Tech File</a></li>
<li> <a href="#" data-icon="info">Info</a></li>
<li> <a href="#" data-icon="info">Info</a></li>
</ul>
</nav>
</footer>
</div>
<!--end of page-->

<!--Page-->
<div data-role="page" id="dog">
<header data-role="header">
<h1>
Dog Page
</h1>
<a href="#home" data-icon="home">Home</a>
<img src="images/Australia.png" class="fullscreen" alt="Australia" />
</header>
</div>

<!--end of page-->

<!--Page-->
<div data-role="page" id="dog2">
<header data-role="header">
<h1>
Dog2 Page
</h1>
<a href="#home" data-icon="home">Home</a>
<img src="images/Cameroon.png" class="fullscreen" alt="Min Pin" />
</header>
</div>
<!--end of page-->
</body>
</html>
