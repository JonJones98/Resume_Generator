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
<script>
function myFunction() {
	window.open("/export/${resume.id}", 'Download');
	
}
</script>
</head>

<body class="LRpage_setup">
	<ul class="topnav">
		<li><a href="/">Home</a></li>
		<li><a class="active">Resume Generator</a></li>
<li class="right"><a href="/logout">Logout</a></li>
	</ul>
	<div class="LR_body">
	<div class="page_size2">
		<div class="header_section">
			<c:forEach items="${allheaderinfos}" var="headerinfo">
				<div class="name">
					<h1 class="he1"><a href="/resume/${resume.id}/edit/1">${headerinfo.firstname} ${headerinfo.middlename} ${headerinfo.lastname}</a></h1>
				</div>
				<div class="contact_info">
					<p class="word">${headerinfo.email}</p>
					<p class="word">${headerinfo.linkedin}</p>
					<p class="word"><a href="${headerinfo.github}">${headerinfo.github}</a></p>
				</div>
			</c:forEach>
		</div>
		<div class="education_section">
			<div class="title">
				<h2 class="he2"><a href="/resume/${resume.id}/edit/2">Education</a></h2>
			</div>
			<box></box>
			<c:forEach items="${alleducations}" var="education">
				<div class="sub">
					<div class="sub_right">
						<p class="word">${education.name}</p>
						<p class="word">${education.degreetype}${education.major}</p>
					</div>
					<div class="sub_left">
						<p class="word">${education.city}, ${education.state}</p>
						<p class="word">${education.graduationyear}</p>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="skill_section">
			<div class="title">
				<h2 class="he2"><a href="/resume/${resume.id}/edit/3">Skills</a></h2>
			</div>
			<box></box>
			<div class="sub_skill">
			<c:forEach items="${allskills}" var="skill">
				<div class="sub_left">
					<p class="word">${skill.name} |</p>
				</div>
			</c:forEach>
			</div>
		</div>
		<div class="experiance_section">
			<div class="title">
				<h2 class="he2"><a href="/resume/${resume.id}/edit/4">Professional Experience</a></h2>
			</div>
			<box></box>
			<c:forEach items="${allexperiances}" var="experiance">
				<div class="sub">
					<div class="sub_right">
						<p class="word">${experiance.name}</p>
					</div>
					<div class="sub_left">
						<p class="word">${experiance.city}, ${experiance.state}</p>
						<p class="word">${experiance.startyear}-${experiance.endyear}</p>
					</div>
				</div>
			<div class="sub_bottom">
				<p class="paragraph">• ${experiance.decription}</p>
			</div>
		</c:forEach>
		</div>
		<div class="project_section">
			<div class="title">
				<h2 class="he2"><a href="/resume/${resume.id}/edit/5">Projects</a></h2>
			</div>
			<box></box>
			<c:forEach items="${allprojects}" var="project">
			<div class="sub">
				<div class="sub_right">
					<p class="word">${project.name}</p>
					<p class="paragraph">• ${project.description}</p>
				</div>
				<div class="sub_left">
					<p class="word">${project.startyear} - ${project.endyear}</p>
				</div>
			</div>
			</c:forEach>
		</div>
		<div class="honor_section">
			<div class="title">
				<h2 class="he2"><a href="/resume/${resume.id}/edit/6">Activities & Honors</a></h2>
			</div>
			<box></box>
			<div class="sub_skill">
			<c:forEach items="${allhonors}" var="honor">
			<div class="sub_left">
				<p class="word">${honor.name}(${honor.yearawarded}) | </p>
			</div>
			</c:forEach>
			</div>
		</div>
	</div>
	<div>
	<div>
	</div>
	<a ><button onclick="myFunction()">Download Resume</button></a>
	</div>
	</div>
	
</body>
</html>