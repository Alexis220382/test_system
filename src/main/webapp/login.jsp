<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="true"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Sign In</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<h1>Enter your login and password.</h1>

<form class="login-form" action="j_spring_security_check" method="post">
  <label for="j_username">Username: </label>
  <input id="j_username" name="j_username" size="20" maxlength="50" type="text" />

  <label for="j_password">Password: </label>
  <input id="j_password" name="j_password" size="20" maxlength="50" type="password" />

  <input type="submit" value="Login" />
</form>

<a href="/newuser.jsp">Зарегистрироваться</a>
</body>
</html>