<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Add Employee</h1>
	<s:form modelAttribute="employee" action="saveprocess">
	
	<input type="hidden" values="${employee.hobbies}"/>
		<!--to create a textbox -->
     Employee Name <s:input path="fullname" />
		<br />
		<!-- pathn value will be binded to employee fullname in model class -->
      
     Employee Email <s:input path="email" />
		<br /> 
     
     gender<s:radiobutton path="gender" value="male" />Male<br />
		<s:radiobutton path="gender" value="male" />Female<br />
     
    Hobbies<s:checkbox path="hobbies" values="swimming" />swimming<br />
		<s:checkbox path="hobbies" values="sports" />sports<br />
		<s:checkbox path="hobbies" values="books" />books<br />
		<s:checkbox path="hobbies" values="music" />music<br />
    
    country :<s:select path="country">
			<s:option value="">India</s:option>
			<s:option value="">US</s:option>
			<s:option value="">Albania</s:option>
			<s:option value="">UK</s:option>
			<s:option value="">china</s:option>
			<s:option value="">others</s:option>

		</s:select>

		<s:input path="Address" /><br />
		
		<input type="submit" value="save Employee">


	</s:form>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>  
  
$(document).ready( 
		function()
		{
			var hobbies=$("#hiddenTxt").val().split(",");
			var $checkboxes=$("input[type=checkbox]");
			$checkboxes.each(
					function(idx,element))
					{
				if(hobbies.indexOf(element.value)!=-1)
					{
					element.setAttribute("checked","checked");
					}
				else
					{
					element.removeAttribute("checked");
					}
			});
		});


</script>



</body>
</html>