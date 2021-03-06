<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.sql.*" %>
     <%@ page import="com.online.quiz.DatabaseConnectionFactory" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">   
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"> 
    <style type="text/css">
    
body {
	background: url("${pageContext.request.contextPath}/images/background.jpg");
}

.button {
	padding: 10px 15px;
	font-size: 14px;
	line-height: 100%;
	text-shadow: 0 1px rgba(0, 0, 0, 0.4);
	color: #000;
	
	vertical-align: middle;
	text-align: center;
	cursor: pointer;
	font-weight: bold;
	transition: background 0.1s ease-in-out;
	-webkit-transition: background 0.1s ease-in-out;
	-moz-transition: background 0.1s ease-in-out;
	-ms-transition: background 0.1s ease-in-out;
	-o-transition: background 0.1s ease-in-out;
	text-shadow: 0 1px rgba(0, 0, 0, 0.3);
	color: #000;
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
	font-family: 'Helvetica Neue', Helvetica, sans-serif;
}

.button, .button:hover, .button:active {
	outline: 0 none;
	text-decoration: none;
        color: #fff;
}

.username {
	background-color: #2ecc71;
	box-shadow: 0px 3px 0px 0px #239a55;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 12px 16px;
    z-index: 1;
}

.dropdown:hover .dropdown-content {
    display: block;
}

</style>
  
   <title>Security Question</title>
</head>
<body>

<div id='cssmenu'>
<ul>
   <li class=''><a href='${pageContext.request.contextPath}'><span>Home</span></a></li>
   <c:if test='${empty sessionScope.user }'>
   	<li><a href='${pageContext.request.contextPath}/login'><span>Login</span></a></li>
   	<li><a href='${pageContext.request.contextPath}/register'><span>Register</span></a></li>
   </c:if>
</ul>
</div>

<div style="text-align:center;">
	<h2>Security Question</h2>
	<br><br>
	 <%
	  
	    Connection con=DatabaseConnectionFactory.createConnection();
	    
	    ResultSet rs;
		 Statement st=con.createStatement();
		 //System.out.println(request.);
		 String sql = "select * from users where email='"+request.getParameter("email").toString()+"';";
		 System.out.println(sql);
		 rs = st.executeQuery(sql);
		 String ques="";
		 String ans="";
		 String password = "";
		 while(rs.next()){
			 ques = rs.getString("seqQues");
			 ans = rs.getString("answer");
			 password = rs.getString("password");
		 }
		 	
	%>
	
	<% if (ques != "")  { %>
		<%-- <%= request.getParameter("email") %> --%>
		<form method="post" action="checkanswer.jsp">
			<%= ques %><br>
			<input placeholder="Answer" type="text" name="answer">
			<input type="hidden" name="ans" value="<%= ans %>">
			<input type="hidden" name="password" value="<%= password %>">
			<input type="submit" name="action" value="Submit" />
		</form> 
	
	<% } %>
	
	<% if (ques == "")  { %>
	
		Email ID Does not exist !!
		
		<div style="text-align:center;margin">
			<a href="forgot.jsp">Forgot Password?</a>
		</div>
	
	<% } %>
	
</div>

</body>
</html>
