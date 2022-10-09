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
							<a href="/logout" class="w3-bar-item w3-button">Logout</a> <a
								href="/logout" class="w3-bar-item w3-button">Logout</a> <a
								href="/logout" class="w3-bar-item w3-button">Logout</a>
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
				<form:form action="/resume/${resume.id}/update" method="post"
					modelAttribute="education" class="error ">
					<div class="SubForm_setup">

						<div>
							<p>Personal Info</p>
						</div>
						<c:forEach items="${allheaderinfos}" var="headerinfo">
							<form:form action="/resume/${resume.id}/update" method="post"
								modelAttribute="headerinfo" class="error ">
								<input type="hidden" name="_method" value="put" />
								<div class="Form_position">
									<form:label path="firstname">First Name:</form:label>
									<form:input type="text" path="firstname"
										value="${headerinfo.firstname}" />
								</div>
								<div class="Form_position">
									<form:label path="middlename">Middle Initial:</form:label>
									<form:input type="text" path="middlename"
										value="${headerinfo.middlename}" />
								</div>
								<div class="Form_position">
									<form:label path="lastname">Last Name:</form:label>
									<form:input type="text" path="lastname"
										value="${headerinfo.lastname}" />
								</div>
								<div class="Form_position">
									<form:label path="email">Email:</form:label>
									<form:input type="text" path="email" value="${headeinfo.email}" />
								</div>
								<div class="Form_position">
									<form:label path="linkedin">Linkedin Link:</form:label>
									<form:input type="text" path="linkedin"
										value="${heardeinfo.linkedin}" />
								</div>
								<div class="Form_position">
									<form:label path="github">Github Link:</form:label>
									<form:input type="text" path="github"
										value="${headerinfo.github}" />
								</div>
								<input type="submit" value="Save edits" class="submit" />
							</form:form>
						</c:forEach>
					</div>
					<div class="SubForm_setup">
						<div>
							<p>Education</p>
						</div>
						<c:forEach items="${alleducations}" var="education">
							<form:form action="/resume/${resume.id}/update" method="post"
								modelAttribute="education" class="error ">
								<input type="hidden" name="_method" value="put" />
								<div>
									<p />
									<p />
									<p>${education.name}</p>
									<p />
								</div>
								<div class="Form_position">
									<form:label path="name">School Name:</form:label>
									<form:input type="text" path="name" value="${education.name}" />
								</div>
								<div class="Form_position">
									<form:label path="city">School City:</form:label>
									<form:input type="text" path="city" value="${education.city}" />
								</div>
								<div class="Form_position">
									<form:label path="state">School State:</form:label>
									<form:input type="text" path="state" value="${education.state}" />
								</div>
								<div class="Form_position">
									<form:label path="degreetype">Degree type:</form:label>
									<form:input type="text" path="degreetype"
										value="${education.degreetype}" />
								</div>
								<div class="Form_position">
									<form:label path="major">Major:</form:label>
									<form:input type="text" path="major" value="${education.major}" />
								</div>
								<form:errors path="enrolledyear" class="text-danger" />
								<div class="Form_position">
									<form:label path="enrolledyear">Enrolled Year:</form:label>
									<form:select type="text" path="enrolledyear">
										<c:forEach items="${allyears}" var="year">
											<c:choose>
												<c:when test="${year == education.enrolledyear}">
													<option value="${year}" selected>${year}</option>
												</c:when>
												<c:otherwise>
													<option value="${year}">${year}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</form:select>

								</div>
								<form:errors path="graduationyear" class="text-danger" />
								<div class="Form_position">
									<form:label path="graduationyear">Graduation Year:</form:label>
									<form:select type="text" path="graduationyear">
										<c:forEach items="${allyears}" var="year">
											<c:choose>
												<c:when test="${year == education.graduationyear}">
													<option value="${year}" selected>${year}</option>
												</c:when>
												<c:otherwise>
													<option value="${year}">${year}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</form:select>
								</div>
								<form:input type="hidden" path="resume" value="${resume.id}" />
								<input type="submit" value="Save edits" class="submit" />
							</form:form>
						</c:forEach>
					</div>
					<div class="SubForm_setup">
						<div>
							<p>Experience</p>
						</div>
						<c:forEach items="${allexperiances}" var="experiance">
							<form:form action="/resume/${resume.id}/update" method="post"
								modelAttribute="experiance" class="error ">
								<input type="hidden" name="_method" value="put" />
								<div>
									<p />
									<p />
									<p>${experiance.rolename}</p>
									<p />
								</div>
								<div class="Form_position">
									<form:label path="name">Company Name:</form:label>
									<form:input type="text" path="name" value="${experiance.name}" />
								</div>
								<div class="Form_position">
									<form:label path="city">Company City:</form:label>
									<form:input type="text" path="city" value="${experiance.city}" />
								</div>
								<div class="Form_position">
									<form:label path="state">Company State:</form:label>
									<form:input type="text" path="state"
										value="${experiance.state}" />
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
								<div class="Form_position">
									<form:label path="rolename">Postion Title:</form:label>
									<form:input type="text" path="rolename"
										value="${experiance.rolename}" />
								</div>
								<div class="Form_position">
									<form:label path="decription">Description:</form:label>
									<form:input type="text" path="decription"
										value="${experiance.decription}" />
								</div>
								<input type="submit" value="Save edits" class="submit" />
							</form:form>
						</c:forEach>
					</div>
					<div class="SubForm_setup">
						<div>
							<p>Skills</p>
						</div>
						<c:forEach items="${allskills}" var="skill">
							<form:form action="/resume/${resume.id}/update_skill"
								method="post" modelAttribute="skill" class="error ">
								<input type="hidden" name="_method" value="put" />
								<div>
									<p />
									<p />
									<p>${skill.name}</p>
									<p />
								</div>
								<div class="Form_position">
									<form:label path="name">Skills:</form:label>
									<form:input type="text" path="name" value="${skill.name}" />
								</div>
								<input type="submit" value="Save edits" class="submit" />
							</form:form>
						</c:forEach>
					</div>
					<div class="SubForm_setup">
						<div>
							<p>Projects</p>
						</div>
						<c:forEach items="${allprojects}" var="project">

							<form:form action="/resume/${resume.id}/update_project"
								method="post" modelAttribute="project" class="error ">
								<input type="hidden" name="_method" value="put" />
								<div>
									<p />
									<p />
									<p>${project.name}</p>
									<p />
								</div>
								<div class="Form_position">
									<form:label path="name">Project Name:</form:label>
									<form:input type="text" path="name" value="${project.name}" />
								</div>
								<div class="Form_position">
									<form:label path="startyear">Year Started:</form:label>
									<form:select type="text" path="startyear">
										<c:forEach items="${allyears}" var="year">
											<c:choose>
												<c:when test="${year == project.startyear}">
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
									<form:label path="endyear">Year Completed:</form:label>
									<form:select type="text" path="endyear">
										<c:forEach items="${allyears}" var="year">
											<c:choose>
												<c:when test="${year == project.startyear}">
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
									<form:label path="description">Description:</form:label>
									<form:input type="text" path="description"
										value="${project.description}" />
								</div>
								<input type="submit" value="Save edits" class="submit" />
							</form:form>
						</c:forEach>
					</div>
					<div class="SubForm_setup">
						<div>
							<p>Activities & Honors</p>
						</div>
						<c:forEach items="${allhonors}" var="honor">
							<form:form action="/resume/${resume.id}/update" method="post"
								modelAttribute="honor" class="error ">
								<input type="hidden" name="_method" value="put" />
								<div>
									<p />
									<p />
									<p>${honor.name}</p>
									<p />
								</div>
								<div class="Form_position">
									<form:label path="name">Name of Activity/Honor:</form:label>
									<form:input type="text" path="name" value="${honor.name}" />
								</div>

								<div class="Form_position">
									<form:label path="yearawarded">Year Received:</form:label>
									<form:select type="text" path="yearawarded">
										<c:forEach items="${allyears}" var="year">
											<c:choose>
												<c:when test="${year == currentyear}">
													<option value="${year}" selected>${year}</option>
												</c:when>
												<c:otherwise>
													<option value="${year}">${year}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</form:select>
								</div>
								<input type="submit" value="Save edits" class="submit" />
							</form:form>
						</c:forEach>
						<input type="submit" value="Save edits" class="submit" />
				</form:form>
				<a href="/"><button>Finish</button></a>
			</div>
		</div>

	</div>
	</div>
</body>
</html>