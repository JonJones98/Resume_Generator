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

		<c:choose>
			<c:when test="${user.firstname != null}">
				<li class="right">
				<div class="w3-dropdown-hover">
      				<button class="w3-button">Dropdown</button>
					<div class="w3-dropdown-content w3-bar-block w3-card-4">
						<a href="/logout" class="w3-bar-item w3-button">Logout</a> 
						<a href="/logout" class="w3-bar-item w3-button">Logout</a> 
						<a href="/logout" class="w3-bar-item w3-button">Logout</a>
					</div>
					</div>
				</li>
				
			</c:when>
			<c:otherwise>
				<li class="right"><a href="/login_user">Login/User</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
	<div>
		<h1>Resume Information Form</h1>
	</div>
	<div>
		<div>
				<div class="Form_setup">
					<div class="SubForm_setup">
						<div>
							<p>Personal Info</p>
						</div>
						<p value = "{$headerinfo.fisrtname}"/>
						<form:form action="/hdr/new" method="post" modelAttribute="headerinfo"
							class="error ">
							<div class="Form_position">
								<form:label path="firstname">First Name:</form:label>
								<form:input type="text" path="firstname" />
							</div>
							<div class="Form_position">
								<form:label path="middlename">Middle Initial:</form:label>
								<form:input type="text" path="middlename" />
							</div>
							<div class="Form_position">
								<form:label path="lastname">Last Name:</form:label>
								<form:input type="text" path="lastname" />
							</div>
							<div class="Form_position">
								<form:label path="email">Email:</form:label>
								<form:input type="text" path="email" />
							</div>
							<div class="Form_position">
								<form:label path="linkedin">Linkedin Link:</form:label>
								<form:input type="text" path="linkedin" />
							</div>
							<div class="Form_position">
								<form:label path="github">Github Link:</form:label>
								<form:input type="text" path="github" />
							</div>
							<form:input type="hidden" path="resume" value="${resume.id}" />
							<input type="submit" value="Add" class="submit" />
						</form:form>
						
					</div>
					<div class="SubForm_setup">
						<div>
							<p>Education</p>
						</div>
						<p value = "{$education.name}"/>
						<form:form action="/edu/new" method="post" modelAttribute="education"
							class="error ">
							<div class="Form_position">
								<form:label path="name">School Name:</form:label>
								<form:input type="text" path="name" />
							</div>
							<div class="Form_position">
								<form:label path="city">School City:</form:label>
								<form:input type="text" path="city" />
							</div>
							<div class="Form_position">
								<form:label path="state">School State:</form:label>
								<form:input type="text" path="state" />
							</div>
							<div class="Form_position">
								<form:label path="degreetype">Degree type:</form:label>
								<form:input type="text" path="degreetype" />
							</div>
							<div class="Form_position">
								<form:label path="major">Major:</form:label>
								<form:input type="text" path="major" />
							</div>
							<div class="Form_position">
								<form:label path="enrolledyear">Enrolled Year:</form:label>
								<form:input type="text" path="enrolledyear" />
							</div>
							<div class="Form_position">
								<form:label path="graduationyear">Graduation Year:</form:label>
								<form:input type="text" path="graduationyear" />
							</div>
							<form:input type="hidden" path="resume" value="${resume.id}" />
							<input type="submit" value="Add" class="submit" />
						</form:form>
					</div>
					<div class="SubForm_setup">
						<div>
							<p>Experiance</p>
						</div>
						<form:form action="/exp/new" method="post" modelAttribute="experiance"
							class="error ">
							<div class="Form_position">
								<form:label path="name">Company Name:</form:label>
								<form:input type="text" path="name" />
							</div>
							<div class="Form_position">
								<form:label path="city">Company City:</form:label>
								<form:input type="text" path="city" />
							</div>
							<div class="Form_position">
								<form:label path="state">Company State:</form:label>
								<form:input type="text" path="state" />
							</div>
							<div class="Form_position">
								<form:label path="startyear">Start Year:</form:label>
								<form:input type="text" path="startyear" />
							</div>
							<div class="Form_position">
								<form:label path="endyear">End Year:</form:label>
								<form:input type="text" path="endyear" />
							</div>
							<div class="Form_position">
								<form:label path="decription">Description:</form:label>
								<form:input type="text" path="decription" />
							</div>
							<form:input type="hidden" path="resume" value="${resume.id}" />
							<input type="submit" value="Add" class="submit" />
						</form:form>
					</div>
					<div class="SubForm_setup">
						<div>
							<p>Skills</p>
						</div>
						<form:form action="/skl/new" method="post" modelAttribute="skills"
							class="error ">
							<div class="Form_position">
								<form:label path="skill">Skills:</form:label>
								<form:input type="text" path="skill" />
							</div>
							<input type="submit" value="Add" class="submit" />
						</form:form>
					</div>
					<div class="SubForm_setup">
						<div>
							<p>Projects</p>
						</div>
						<form:form action="/prj/new" method="post" modelAttribute="projects"
							class="error ">
							<div class="Form_position">
								<form:label path="name">Project Name:</form:label>
								<form:input type="text" path="name" />
							</div>
							<div class="Form_position">
								<form:label path="startyear">Year Started:</form:label>
								<form:input type="text" path="startyear" />
							</div>
							<div class="Form_position">
								<form:label path="endyear">Year Completed:</form:label>
								<form:input type="text" path="endyear" />
							</div>
							<div class="Form_position">
								<form:label path="description">Description:</form:label>
								<form:input type="text" path="description" />
							</div>
							<input type="submit" value="Add" class="submit" />
						</form:form>
					</div>
					<div class="SubForm_setup">
						<div>
							<p>Activities & Honors</p>
						</div>
						<form:form action="/hrs/new" method="post" modelAttribute="honors"
							class="error ">
							<div class="Form_position">
								<form:label path="name">Name of Activity/Honor:</form:label>
								<form:input type="text" path="name" />
							</div>

							<div class="Form_position">
								<form:label path="yearawarded">Year Received:</form:label>
								<form:input type="text" path="yearawarded" />
							</div>
							<input type="submit" value="Add" class="submit" />
						</form:form>
					</div>
				</div>
				
		</div>
	</div>
</body>
</html>