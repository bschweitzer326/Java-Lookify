<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Song Details</title>
<link rel="stylesheet" href="/webjars/bootstrap/4.6.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.6.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/show.css">
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
		<div>
			<label>Song Title: <span class="one"><c:out value="${song.title}"/></span></label>
		</div>
		
		<div>
		<label>Artist: <span class="two"><c:out value="${song.artist}"/></span></label>
		</div>
		
		<div>
		<label>Rating: <span class="three"><c:out value="${song.rating}"/></span></label>
		</div>
		
	</div>
</body>
</html>