<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title align="center">Spring MVC</title>
</head>
<body>
	<h1>List the employee</h1>
	<button onclick="window.location.href='showFormForAddEmployee.html' ">Add Employee</button>
	<div>

		<table>
		<tr>
			<th>Full name</th>
			<th>email</th>
			<th>gender</th>
			<th>hobbies</th>
			<th>country</th>
			<th>address</th>
			</tr>
			
			<c:forEach items="${ listemployee}" var="e">
			
			<c:url var="deleteLink" value="/deleteemployee">
			
			<c:param name=" employeeid" value="${e.id }"/>
			
			
			</c:url>
			
			<c:url var="updateLink" value="/updateemployee">
			
			<c:param name=" employeeid" value="${e.id }"/>
			
			
			</c:url>
			
			  <tr>  
			    <td> ${e.fullname} </td>
			    <td> ${e.email} </td>
			    <td> ${e.gender} </td>
			    <td> ${e.hobbies} </td>
			    <td> ${e.country} </td>
			    <td> ${e.address} </td>
			    <td>
			    <a href="${updateLink }">update</a>
			    </td>
			    <td><a href="${deleteLink }" onclick="if(!(confirm delete('are u sure?')))return false;">>delete</a></td>
			  </tr>
			
			
			</c:forEach>
			
		</table>
	</div>
	<!-- <form>
		<select>
			<option value="value1">mahimairaj</option>
			<option value="value2">jaya</option>
			<option value="value3">aiyshwariya</option>
			<option value="value4">sakthi</option>
			<option value="value5">sanjay</option>
		</select>
		<button font="caligraphy">submit</button>
	</form> -->
</body>
</html>