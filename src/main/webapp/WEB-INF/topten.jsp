<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top Ten</title>
<link rel="stylesheet" href="/webjars/bootstrap/4.6.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.6.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/topten.css">
<script type="text/javascript" src="js/app.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="/dashboard">Dashboard</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  

	  
	    <form class="form-inline my-2 my-lg-0" action="/search" method="post">
	      <input class="form-control mr-sm-2" type="search" placeholder="Search" name="query" aria-label="Search">
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	    </form>

	</nav>
	
	<h1>Top Ten Songs</h1>

	<div class="list">
		<table class="table table-hover table-dark">
		  <thead>
		    <tr>
		      <th scope="col">Song Title</th>
		      <th scope="col">Artist</th>
		      <th scope="col">Rating</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${ten}" var="top">	
		    <tr class="table-secondary">
		      <th scope="row"><a href="/songs/${top.id}"><c:out value="${top.title}"/></a></th>
		      <td><c:out value="${top.artist}"/></td>
		      <td><c:out value="${top.rating}"/></td>
		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>
	
</body>
</html>