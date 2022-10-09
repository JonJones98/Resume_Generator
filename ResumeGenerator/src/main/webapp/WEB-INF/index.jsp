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
<title>Login/Registration</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body class="LRpage_setup">
		<ul class="topnav">
		<c:choose>
        	<c:when test="${user.firstname != null}"><li class="right"><a href="/logout">Logout</a></li></c:when>
        	<c:otherwise><li></li></c:otherwise>
        </c:choose>
        <li><a href="/create">Resume Generator</a></li>
        <li class="right"><a class="active" href="/login_user">Login/User</a></li>
      </ul>
	
	<div class="LR_body">
		<div>
			<h2>Register</h2>
			
			
		</div>
		<div>
			<form:form action="/register" method ="POST" modelAttribute="newUser" class="error ">
			<form:errors path="email" class="text-danger" />
			<form:errors path="password" class="text-danger" />
			<form:errors path="confirm" class="text-danger" />
			<div class="Form_setup">
				<div class="Form_position">
					<form:label path="firstname" id="lab">First Name:</form:label>
					
					<form:input path="firstname" type="text" id="lab2" />
					
				</div>
				<div class="Form_position">
					<form:label path="middlename" id="lab">M.I.:</form:label>
					
					<form:input path="middlename" type="text" id="lab2" />
					
				</div>
				<div class="Form_position">
					<form:label path="lastname" id="lab">Last Name:</form:label>
					
					<form:input path="lastname" type="text" id="lab2" />
					
				</div>
				<div class="Form_position">
					
					<form:label path="email" id="lab">Email:</form:label>
					<form:input type="text" path="email" id="lab2" />
					
				</div>
				<div class="Form_position">
					
					<form:label path="password" id="lab">Password:</form:label>
					<form:input type="password" path="password" id="lab2" />
					
				</div>
				<div class="Form_position">
					
					<form:label path ="confirm" id="lab">Confirm Password:</form:label>
					<form:input type="password" path="confirm" id="lab2" />
					
				</div>
				</div>
				<input type="submit" value="Register" class="login"/>
				
			</form:form>
		</div>
		<div>
			<h2>Login</h2>
			
		</div>
		<div>
			<form:form action="/login" method ="POST" modelAttribute="newLogin" class="error ">
				<form:errors path="email" class="text-danger" />
			<form:errors path="password" class="text-danger" />
				<div class="Form_setup">
				<div class="Form_position">
					
					<form:label path="email" id="lab">Email:</form:label>
					<form:input type="text" path="email" id="lab2" />
					
				</div>
				<div class="Form_position">
					
					<form:label path="password" id="lab">Password:</form:label>
					<form:input type="password" path="password" id="lab2" />
					
				</div>
				</div>
				<input type="submit" value="Login" class="login"/>
				
			</form:form>
		</div>
	</div>
</body>
</html>