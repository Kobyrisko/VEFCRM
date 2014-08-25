<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<title>Insert title here</title>
</head>
<body>
	<h1>help...</h1>
		<%String username = request.getParameter("Username");
		String password = request.getParameter("Password");
	out.println(username);
	out.println(password);
	%>
</body>
</html>
  <head>
    <link href="/Java_ee_FP/view/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
     href="/Java_ee_FP/view/css/bootstrap-datetimepicker.min.css">
  </head>