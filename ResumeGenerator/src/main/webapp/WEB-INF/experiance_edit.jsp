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
<title>Resume Information Form</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="LRpage_setup">
	<ul class="topnav">
		<li><a href="/">Home</a></li>
		<li><a class="active">Resume Generator</a></li>
		<li class="right"><a href="/logout">Logout</a></li>
	</ul>
	<div class="LR_body">
		<h1>Resume Information Form</h1>
	</div>
	<div class="LR_body">
		<div>
			<div class="Form_setup">
				<div class="SubForm_setup">
					<div>
						<p>Experiance</p>
					</div>
					<c:forEach items="${allexperiances}" var="experiance">
						<p>${experiance.rolename}</p>
					
					<form:form action="/resume/${resume.id}/${experiance.id}/update_experiance" method="post"
						modelAttribute="experiance" class="error ">
						<input type="hidden" name="_method" value="put" />
						<form:errors path="name" class="text-danger" />
						<div class="Form_position">
							<form:label path="name">Company Name:</form:label>
							<form:input type="text" path="name" value="${experiance.name}"/>
						</div>
						<form:errors path="city" class="text-danger" />
						<div class="Form_position">
							<form:label path="city">Company City:</form:label>
							<form:input type="text" path="city" value="${experiance.city}"/>
						</div>
						<form:errors path="state" class="text-danger" />
						<div class="Form_position">
							<form:label path="state">Company State:</form:label>
							<form:input type="text" path="state" value="${experiance.state}"/>
						</div>
						<div class="Form_position">
							<form:label path="startyear">Start Year:</form:label>
							<form:select type="text" path="startyear">
								<c:forEach items="${allyears}" var="year">
									<c:choose>
										<c:when test="${year == experiance.startyear}">
											<option value="${year}" selected>${year}</option>
										</c:when>
										<c:otherwise>
											<option value="${year}">${year}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</form:select>
						</div>
						<div class="Form_position">
							<form:label path="endyear">End Year:</form:label>
							<form:select type="text" path="endyear">
								<c:forEach items="${allyears}" var="year">
									<c:choose>
										<c:when test="${year == experiance.endyear}">
											<option value="${year}" selected>${year}</option>
										</c:when>
										<c:otherwise>
											<option value="${year}">${year}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</form:select>
						</div>
						<form:errors path="rolename" class="text-danger" />
						<div class="Form_position">

							<form:label path="rolename">Position Title:</form:label>
							<form:input type="text" path="rolename" value="${experiance.rolename}"/>
						</div>
						<div class="Form_position">
							<form:errors path="decription" class="text-danger" />
							<form:label path="decription">Description:</form:label>
							<form:input type="text" path="decription" value="${experiance.decription}"/>
						</div>
						<form:input type="hidden" path="resume" value="${experiance.resume.id}" />

						<input type="submit" value="Update Experiance" class="submit" />
					</form:form>
					
					</c:forEach>
					<a href="/preview/${resume.id}"><button>Back to Resume</button></a>
				</div>
			</div>
		</div>
	</div>
</html>