<%@page import="com.java.finalproj.request_processor.RequestProcessor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="/MyVulnerableWebSite/css/style.css"
	type="text/css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Vulnerable Web Site</title>

</head>

<body bgcolor=#0B65AB align=center>
	<form>
		<header>Login</header>
		<label>Username</label> <input name=userName> </input>
		<div class="help">At least 6 character</div>
		<label>Password </label> <input name=password> </input>
		<div class="help">Use upper and lowercase lettes as well</div>
		<!-- <button>Login</button> -->
		<div>
			<input type="submit" value="Login">
		</div>
		<%
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			String res = RequestProcessor.getInstance().process("auth", userName, password);

			if (res != null && res.contains("OK")) {
			
				//maybe change to json
				String[] userLogIn = res.split(";");
				out.println("Welcome " + userLogIn[1] + "! " + " <a href=\"userArea.jsp\">go to your acaount</a>");
				session.setAttribute("username", userLogIn[1]);
			}
		%>
	</form>
	<p>
	<h3>

		<a href="userCreation.jsp" , style="color: #FFFFFF"> Create new user </a>
	</h3>
</body>
</html>