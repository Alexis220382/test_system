<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Personal</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>

<p style="color: red">${error}</p>

<h3>Вы вошли под именем: ${login}</h3>
<h3>Количество сданных тестов: ${testscount}</h3>
<h3>Ваш баланс: ${points}</h3>

<c:set var="admin" value="${'ROLE_ADMIN'}"/>
<c:forEach var="auth" items="${auths}">
    <c:if test="${auth eq admin}">
        <c:out value="Вы вошли с правами администратора."/>
    </c:if>
</c:forEach>

<%--Архив тестов, сданных данным пользователем--%>
<p><b>Архив тестов.</b></p>
    <ol>
    <c:forEach var="testname" items="${results}">
        <li>${testname}</li>
    </c:forEach>
    </ol>
<br/>
<form action="/getquestions">
    <p><b>Доступные для сдачи тесты.<br/>
        Выберите тест и нажмите кнопку "Сдать тест".</b></p>
    <p style="color: red">${noTests}</p>
    <c:forEach var="test" items="${tests}">
        <input type="radio" id="testN" name="testN" value="${test.id}">${test.name}<br/>
    </c:forEach>
    <br/>
    <input type="hidden" name="login" value="${login}"/><br/>
    <input type="submit" name="button" value="Сдать тест"/><br/><br/><br/>
</form>

<a href="/j_spring_security_logout">Logout</a>
<br/>
<br/>
<c:forEach var="auth" items="${auths}">
    <c:if test="${auth eq admin}">
        <a href="/admin/question">Admin_panel</a>
    </c:if>
</c:forEach>

</body>
</html>
