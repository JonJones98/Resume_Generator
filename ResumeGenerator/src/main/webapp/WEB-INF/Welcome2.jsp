<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body class="LRpage_setup">
<ul class="topnav">
        <li><a class="active" href="/">Home</a></li>
        <li><a href="/create">Resume Generator</a></li>
        <c:choose>
        	<c:when test="${user.firstname != null}"><li class="right"><a href="/logout">Logout</a></li></c:when>
        	<c:otherwise>
        	<li class="right"><a href="/login_user">Login/ register</a></li>
        	</c:otherwise>
        </c:choose>
      </ul>
<section class="showcase">
	<header>
		<h2 class="logo">Welcome</h2>
		<div class="toggle"></div>
	</header>
	<video src="/img/3.mp4" muted loop autoplay></video>
	<div class=text>
	<h3>Welcome</h3>
	<p>Looking for to save time and need help with laying out your resume? This free to use online 
	resume generator will help you create your desired resume fast and simple in just 6 steps.</p>
	<a href="#">Get Started</a>
	</div>
</section>
</body>
</html>