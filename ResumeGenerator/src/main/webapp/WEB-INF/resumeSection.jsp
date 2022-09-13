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
<title>Dashboard</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body class="LRpage_setup">
<ul class="topnav">
        <li><a href="/">Home</a></li>
        <li><a class="active" href="/create">Resume Generator</a></li>
        <c:choose>
        	<c:when test="${user.firstname != null}"><li class="right"><a href="/logout">Logout</a></li></c:when>
        	<c:otherwise>
        	<c:redirect url="/login_user"></c:redirect>
        	</c:otherwise>
        </c:choose>
      </ul>
		<h1>Welcome ${user.firstname}</h1>
	<h3>Header Information</h3>
	<c:forEach items="${allheaderinfos}" var="headerinfo"><p>${headerinfo.firstname} ${headerinfo.middlename} ${headerinfo.lastname}  ${headerinfo.email} </p></c:forEach>
	<h3>Educations</h3>
	<c:forEach items="${alleducations}" var="education"><p>${education.name}  ${education.graduationyear} </p></c:forEach>
	<h3>Skills</h3>
	<c:forEach items="${allskills}" var="skill"><p>${skill.name}</p></c:forEach>
	<h3>Experiences</h3>
	<c:forEach items="${allexperiances}" var="experiance"><p>${experiance.name}  ${experiance.rolename} </p><a href="experiance_edit.jsp"><button></button></a></c:forEach>
	<h3>Projects</h3>
	<c:forEach items="${allprojects}" var="project"><p>${project.name}</p></c:forEach>
	<h3>Honors</h3>
	<c:forEach items="${allhonors}" var="honor"><p>${honor.name}  ${honor.yearawarded} </p></c:forEach>
		<c:choose>
        	<c:when test="${user.firstname != null}"><a href="/create"><button>Create Resume</button></a></c:when>
        </c:choose>
	</div>
</body>
</html>