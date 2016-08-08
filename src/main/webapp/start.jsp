<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>

<p style="color: red">${error}</p>
<h3>Вы вошли под именем: ${login}</h3>

<c:forEach var="auth" items="${auths}">
    <c:set var="admin" value="${'ROLE_ADMIN'}"/>
    <c:if test="${auth eq admin}">
        <c:out value="Вы вошли с правами администратора."/>
    </c:if>
</c:forEach>

<form action="/getquestions">
    <p><b>Вам доступны следующие тесты для сдачи.<br />
        Выберите тест и нажмите кнопку "Сдать тест".</b></p>
    <c:forEach var="test" items="${tests}">
        <input type="radio" id="testN" name="testN" value="${test.id}">${test.name}<br />
    </c:forEach>
     <input type="text" name="login" value="${login}" /><br />
     <input type="submit" name="button" value="Сдать тест" /><br /><br /><br />
</form>

<a href="/logout">Logout</a>
<br/>
<br/>
<a href="/question">admin_panel</a>

</body>
</html>
