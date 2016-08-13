<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New user</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<form action="/register" method="get" >
  <label for="user">Username: </label>
  <input id="user" name="user" size="20" maxlength="50" type="text" />

  <label for="password">Password: </label>
  <input id="password" name="password" size="20" maxlength="50" type="text" />

  <label for="role">Role: </label>
  <select id="role" name="role" >
    <option value="ROLE_USER">Пользователь</option>
    <option value="ROLE_ADMIN">Администратор</option>
  </select>

  <input type="submit" value="Регистрация" />
</form>
<br/><br/>
<a href="/j_spring_security_logout">Выход</a>
</body>
</html>
