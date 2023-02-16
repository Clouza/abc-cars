<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= request.getParameter("title") %></title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="<%= request.getParameter("offset") == null ? "css/app.css" : "../css/app.css"%>">
</head>
<% 
	Boolean check = request.getParameter("navbarHome") == null;
	String navBody = null;
	String navContent = null;
	
	if(check) {
		navBody = "static bg-white";
		navContent = "scrolled";
	}
%>
<body>
    <nav class="<%= navBody %>">
        <div class="container mx-auto navbar">
            <div class="nav-header <%= navContent %>">
                <img src="<%= request.getParameter("offset") == null ? "images/primary.png" : "../images/primary.png"%>" width="50" class="mr-3">
                <a href="/home">ABC Cars</a>
            </div>
            <div class="nav-content <%= navContent %>">
                <ul>
                    <li>
                        <a href="/home">Home</a>
                    </li>
                    <li>
                        <a href="/list-of-cars">Cars</a>
                    </li>
                    <li>
                        <c:if test="${!SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals(\"anonymousUser\")}">
                        	<a href="/dashboard">Dashboard</a>
                        </c:if>
                    </li>
                </ul>
            </div>
            <div class="search-on-navbar">
                <form action="/search">
               		<input type="text" placeholder="Search a car" name="n">
	                <input type="hidden" placeholder="fill" name="r">
	                <input type="hidden" placeholder="fill" name="mk">
	                <input type="hidden" placeholder="fill" name="md">
	                <input type="hidden" placeholder="fill" name="pr">
	                <input type="hidden" placeholder="fill" name="y">
                </form>
                <c:choose>
				    <c:when test="${SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals(\"anonymousUser\")}">
				    	<a href="/login" class="btn btn-primary">Sign in</a>
				    </c:when>    
				    <c:otherwise>
				        <a href="/logout" class="btn btn-danger">Log out</a>
				    </c:otherwise>
				</c:choose>
                
            </div>
        </div>
    </nav>