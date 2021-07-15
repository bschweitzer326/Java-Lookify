<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link rel="stylesheet" href="/webjars/bootstrap/4.6.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.6.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/dashboard.css">
<script type="text/javascript" src="js/app.js"></script>
</head>

<body>
		
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	
		<div class="left">
		  <a class="navbar-brand" href="/songs/new">Add New</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  
		    <a class="navbar-brand" href="search/topten">Top Songs</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		</div> 
		
		<div class="right">
		  
		    <form class="form-inline my-2 my-lg-0" action="/search" method="post">
		      <input class="form-control mr-sm-2" type="search" placeholder="Search" name="query" aria-label="Search">
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		    </form>
		 </div>
		 
	</nav>	
	<div class="list">
		<table class="table table-hover table-striped">
		  <thead>
		    <tr>
		      <th scope="col">Song Title</th>
		      <th scope="col">Artist</th>
		      <th scope="col">Rating</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${look}" var="song">	
		    <tr>
		      <th scope="row"><a href="/songs/${song.id}"><c:out value="${song.title}"/></a></th>
		      <td><c:out value="${song.artist}"/></td>
		      <td><c:out value="${song.rating}"/></td>
		      <td><form action="/delete/${song.id}" method="post">
				<input type="hidden" name="_method" value="delete">
				
				<input class="btn btn-danger" type="submit" value="Delete"> | <a class="btn btn-primary" href="/edit/${song.id}">Edit</a>
				</form></td>
		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>

</body>
</html>