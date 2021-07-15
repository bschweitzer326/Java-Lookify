<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Song</title>
<link rel="stylesheet" href="/webjars/bootstrap/4.6.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.6.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/editshow.css">
<script type="text/javascript" src="js/app.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="/dashboard">Dashboard</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  
	   <div class="right">
	      <form class="form-inline my-2 my-lg-0" action="/search" method="post">
		      <input class="form-control mr-sm-2" type="search" placeholder="Search" name="query" aria-label="Search">
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	    </form>
    </div>
	</nav>
	
	<div class="container">
	
		<form:form action="/songs/create" method="post" modelAttribute="lookify">
			<div class="form-group">
				<form:label path="title">Song Title:</form:label>
				<form:errors path="title"/>
				<form:input class="form-control" path="title"/>
			</div>
			
			<div class="form-group">
				<form:label path="artist">Artist:</form:label>
				<form:errors path="artist"/>
				<form:input class="form-control" path="artist"/>
			</div>	
			
			<div class="form-group">	
				<form:label path="rating">Rating (1-10):</form:label>
				<form:errors path="rating"/>
				<form:select class="form-control" path="rating">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
				</form:select>
			</div>	
			
			<button class="btn btn-dark" type="submit">Submit</button>	
			
		</form:form>
	
	</div>

</body>
</html>