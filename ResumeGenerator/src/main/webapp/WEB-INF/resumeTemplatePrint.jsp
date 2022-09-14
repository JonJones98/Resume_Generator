<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="application/msword"
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

<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">


h1 {
	font-family: Roboto;
	color: black;
}

h2 {
	font-family: Roboto;
	color: black;
}

#lab {
	color: black;;
}

#lab2 {
	color: #1f2833;
	border-left: solid #0b0c10 2px;
}

.header {
	display: flex;
	background-color: #05445E;
	justify-content: center;
	padding: 20px;
}

.dashheader {
	background-color: #05445E;
	display: flex;
	justify-content: space-between;
	padding: 20px;
	margin-left: 20px;
}

.LRpage_setup {
	display: flex;
	flex-direction: column;
	display: flex;
}

.LR_body {
	display: flex;
	margin-top: 20px;
	flex-direction: column;
	align-items: center;
}

.error {
	margin-left: 10px;
	display: flex;
	flex-direction: column;
}

.Form_setup {
	margin: 10px;
	width: max-content;
	display: flex;
	flex-direction: column;
	border: solid #0b0c10 4px;
}

.SubForm_setup {
	margin: 10px;
	width: max-content;
	display: flex;
	flex-direction: column;
}

.Subtitle_setup {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.table_width {
	display: flex;
	margin-top: 20px;
	flex-direction: column;
	align-items: center;
	width: max-content;
	height: max-content;
}

#table_setup {
	margin: 1%;
	border: solid #0b0c10 2px;
	padding: 1%;
}

.view_position {
	padding-left: 20px;
	padding-right: 20px;
	display: flex;
	flex-wrap: wrap;
	width: 350px;
	justify-content: space-between;
	display: flex;
	border-bottom: solid #0b0c10 2px;
}

input {
	width: 300px;
}

.Form_position {
	padding-left: 20px;
	display: flex;
	flex-direction: row;
	width: 500px;
	justify-content: space-between;
	display: flex;
	border-bottom: solid #0b0c10 2px;
}

.button-33 {
	border-radius: 2px;
	background-color: #D4F1F4;
}

.delete-33 {
	border-radius: 2px;
	background-color: #189AB4;
}

.delete {
	background-color: #D4F1F4;
	border-radius: 100px;
	box-shadow: rgba(44, 187, 99, .2) 0 -25px 18px -14px inset,
		rgba(44, 187, 99, .15) 0 1px 2px, rgba(44, 187, 99, .15) 0 2px 4px,
		rgba(44, 187, 99, .15) 0 4px 8px, rgba(44, 187, 99, .15) 0 8px 16px,
		rgba(44, 187, 99, .15) 0 16px 32px;
	color: #189AB4;
	cursor: pointer;
	display: inline-block;
	font-family: CerebriSans-Regular, -apple-system, system-ui, Roboto,
		sans-serif;
	padding: 1px 10px;
	text-align: center;
	text-decoration: none;
	transition: all 250ms;
	border: 0;
	font-size: 12px;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
	margin: 10px;
	width: 50px;
}

button {
	background-color: #D4F1F4;
	border-radius: 100px;
	box-shadow: rgba(44, 187, 99, .2) 0 -25px 18px -14px inset,
		rgba(44, 187, 99, .15) 0 1px 2px, rgba(44, 187, 99, .15) 0 2px 4px,
		rgba(44, 187, 99, .15) 0 4px 8px, rgba(44, 187, 99, .15) 0 8px 16px,
		rgba(44, 187, 99, .15) 0 16px 32px;
	color: #189AB4;
	cursor: pointer;
	display: inline-block;
	font-family: CerebriSans-Regular, -apple-system, system-ui, Roboto,
		sans-serif;
	padding: 1px 10px;
	text-align: center;
	text-decoration: none;
	transition: all 250ms;
	border: 0;
	font-size: 12px;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
	margin: 10px;
}

button:hover {
	box-shadow: #D4F1F4 0 -25px 18px -14px inset, rgba(44, 187, 99, .25) 0
		1px 2px, rgba(44, 187, 99, .25) 0 2px 4px, rgba(44, 187, 99, .25) 0
		4px 8px, rgba(44, 187, 99, .25) 0 8px 16px, rgba(44, 187, 99, .25) 0
		16px 32px;
	transform: scale(1.05) rotate(-1deg);
}

.delete:hover {
	box-shadow: red 0 -25px 18px -14px inset, #DF362D 0 1px 2px, red 0 2px
		4px, #FF4500 0 4px 8px, red 0 8px 16px, #DFE0E0 0 16px 32px;
	transform: scale(1.05) rotate(-1deg);
	color: black;
}

.submit:hover {
	box-shadow: rgba(44, 187, 99, .35) 0 -25px 18px -14px inset,
		rgba(44, 187, 99, .25) 0 1px 2px, rgba(44, 187, 99, .25) 0 2px 4px,
		rgba(44, 187, 99, .25) 0 4px 8px, rgba(44, 187, 99, .25) 0 8px 16px,
		rgba(44, 187, 99, .25) 0 16px 32px;
	transform: scale(1.05) rotate(-1deg);
}

.login:hover {
	box-shadow: rgba(44, 187, 99, .35) 0 -25px 18px -14px inset,
		rgba(44, 187, 99, .25) 0 1px 2px, rgba(44, 187, 99, .25) 0 2px 4px,
		rgba(44, 187, 99, .25) 0 4px 8px, rgba(44, 187, 99, .25) 0 8px 16px,
		rgba(44, 187, 99, .25) 0 16px 32px;
	transform: scale(1.05) rotate(-1deg);
}

.submit {
	background-color: #D4F1F4;
	border-radius: 100px;
	box-shadow: rgba(44, 187, 99, .2) 0 -25px 18px -14px inset,
		rgba(44, 187, 99, .15) 0 1px 2px, rgba(44, 187, 99, .15) 0 2px 4px,
		rgba(44, 187, 99, .15) 0 4px 8px, rgba(44, 187, 99, .15) 0 8px 16px,
		rgba(44, 187, 99, .15) 0 16px 32px;
	color: #189AB4;
	cursor: pointer;
	display: inline-block;
	font-family: CerebriSans-Regular, -apple-system, system-ui, Roboto,
		sans-serif;
	padding: 1px 20px;
	text-align: center;
	text-decoration: none;
	transition: all 250ms;
	border: 0;
	font-size: 16px;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
	margin-bottom: 20px;
	margin-top: 15px;
}

.login {
	background-color: #D4F1F4;
	border-radius: 100px;
	box-shadow: rgba(44, 187, 99, .2) 0 -25px 18px -14px inset,
		rgba(44, 187, 99, .15) 0 1px 2px, rgba(44, 187, 99, .15) 0 2px 4px,
		rgba(44, 187, 99, .15) 0 4px 8px, rgba(44, 187, 99, .15) 0 8px 16px,
		rgba(44, 187, 99, .15) 0 16px 32px;
	color: #189AB4;
	cursor: pointer;
	display: inline-block;
	font-family: CerebriSans-Regular, -apple-system, system-ui, Roboto,
		sans-serif;
	padding: 1px 20px;
	text-align: center;
	text-decoration: none;
	transition: all 250ms;
	border: 0;
	font-size: 16px;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
}

.layout {
	display: flex;
	flex-direction: row;
	margin-left: 10px;
}

ul.topnav {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #2c3531;
}

ul.topnav li {
	float: left;
}

ul.topnav li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

ul.topnav li a:hover:not(.active) {
	background-color: #111;
}

ul.topnav li a.active {
	background-color: #189AB4;
}

ul.topnav li.right {
	float: right;
}

@media screen and (max-width: 600px) {
	ul.topnav li.right, ul.topnav li {
		float: none;
	}
}

.header_section {
	display: flex;
	flex-direction: row;
	margin: .5% 0%;
}

.name {
	display: flex;
	width: 70%;
	justify-content: left;
	font-size: 30pt;
	font-family: Arial, Helvetica, sans-serif;
}

.contact_info {
	display: flex;
	width: 30%;
	padding: 1%;
	flex-direction: column;
	height:fit-content;
}

.education_section {
	display: flex;
	flex-direction: column;
	margin: .5% 0%;
	padding-left: 1%;
	height:fit-content;
	border: solid red 2px;
	
}

.title {
	display: flex;
	flex-direction: column;
	height:12%;
	justify-content:center;
}

.sub {
	display: flex;
	flex-direction: row;
	height:15%;
	margin-bottom:5%;
	justify-content:space-between;
	
	
}
.sub_skill {
	display: flex;
	flex-direction: row;
	height:15%;
	align-items:center;
	justify-content:left;
	
	
}
.sub_right {
	display: flex;
	flex-direction: column;
	height:5px;
	
	
	
}

.sub_left {
	display: flex;
	flex-direction: column;
	height:5px;
	
	
	
	
}

.sub_bottom {
	display: flex;
	flex-direction: column;
	height:1%;
	justify-content:center;
	  
}

.skill_section {
	display: flex;
	flex-direction: column;
	margin: .5% 0%;
	padding-left: 1%;
	height:fit-content;
	justify-content:center;
}

.experiance_section {
	display: flex;
	flex-direction: column;
	margin: .5% 0%;
	padding-left: 1%;
	height:fit-content;
}

.project_section {
	display: flex;
	flex-direction: column;
	margin: .5% 0%;
	padding-left: 1%;
	height:fit-content;
}

.honor_section {
	display: flex;
	flex-direction: column;
	margin: .5% 0%;
	padding-left: 1%;
	height:fit-content;
}

.page_size {
	display: flex;
	flex-direction: column;
	padding: 10px;
	width: 2550px;
	height: 3300px;
	border: solid black 2px;
}

.page_size2 {
	display: flex;
	flex-direction: column;
	padding: 20px;
	background-color: white;
	width: 500px;
	height: 700px;
	font-size: 1px;
	border: solid black 2px;
	margin-bottom: 3%;
}
box{
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-bottom:1%;
	margin-top:1%;
	border: solid black 2px;
	border-width: 1px;
	background-color: black;
	width: 100%;
}
hr {
	display: block;
	margin-left: auto;
	margin-right: auto;
	border: solid black 2px;
	border-width: 1px;
	background-color: black;
	width: 100%;
}
.paragraph{
	inline-size: 350px; 
  	overflow: break-word;
  	font-size: 6pt;
  	margin-bottom:4%;
	font-family: Arial, Helvetica, sans-serif;
}

a {
	text-decoration: none;
}
.word {
	font-size: 10pt;
	font-family: Arial, Helvetica, sans-serif;
	width: max-content;
	padding-top:1%;
	margin:1%;
	
	
}

.he1:hover {
	text-shadow: 0 0 15px #189AB4, 0 0 8px #189AB4, 0 0 10px #D4F1F4, 0 0
		30px #D4F1F4, 0 0 40px #D4F1F4, 0 0 50px #D4F1F4, 0 0 70px #D4F1F4;
	transform: scale(1.05) rotate(-1deg);
}

.he2:hover {
	text-shadow: 0 0 15px #189AB4, 0 0 8px #189AB4, 0 0 10px #D4F1F4, 0 0
		30px #D4F1F4, 0 0 40px #D4F1F4, 0 0 50px #D4F1F4, 0 0 70px #D4F1F4;
	transform: scale(1.05) rotate(-1deg);
}

.he3:hover {
	text-shadow: 0 0 15px #189AB4, 0 0 8px #189AB4, 0 0 10px #D4F1F4, 0 0
		30px #D4F1F4, 0 0 40px #D4F1F4, 0 0 50px #D4F1F4, 0 0 70px #D4F1F4;
	transform: scale(1.05) rotate(-1deg);
}

.he1 {
	font-size: 18pt;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: black;
}

.he2 {
	font-size: 14pt;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: black;
}

.he3 {
	font-size: 13pt;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: black;
}

@media print {
	.page_size {
		height: 70%;
	}
	.he1 {
		font-size: 10pt*.7727;
	}
	.he2 {
		font-size: 14pt*.7727;
	}
	.he3 {
		font-size: 14pt*.7727;
	}
	.word {
		font-size: 12pt*.7727;
	}
}
</style>
</head>

<body>
	<div class="page_size">
		<div class="header_section" style="">
			<c:forEach items="${allheaderinfos}" var="headerinfo">
				<div class="name">
					<h1 class="he1">${headerinfo.firstname} ${headerinfo.middlename} ${headerinfo.lastname}</h1>
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
				<h2 class="he2">Education</h2>
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
				<h2 class="he2">Skills</h2>
			</div>
			<box></box>
			<div class="sub_skill">
			<c:forEach items="${allskills}" var="skill">
				<div class="sub_left">
					<p class="word">${skill.name} | </p>
				</div>
			</c:forEach>
			</div>
		</div>
		<div class="experiance_section">
			<div class="title">
				<h2 class="he2">Professional Experience</h2>
			</div>
			<box></box>
			<c:forEach items="${allexperiances}" var="experiance">
				<div class="sub">
					<div class="sub_right">
						<p class="word">${experiance.name}</p>
					</div>
					<div class="sub_left">
						<p class="word">${experiance.city},${experiance.state}</p>
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
				<h2 class="he2">Projects</h2>
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
				<h2 class="he2">Activities & Honors</h2>
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
	</div>
	</div>
	
</body>
</html>