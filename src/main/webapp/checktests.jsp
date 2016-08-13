<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check tests</title>
</head>
<body>
<h2>Проверка результатов сдачи тестов.</h2>
<br/><br/>

<c:out value="${message}"/>
<c:if test="${logins != null}">
<h3>Выберите пользователя</h3><br/>
    <form action="/admin/checkwithtests" method="get">
        <select name="user">
            <c:forEach var="login" items="${logins}">
                <option value="${login}">${login}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Ok">
    </form>
</c:if>

<c:if test="${tests != null}">
    <h3>Выберите тест, который сдавал ${user}</h3><br/>

    <form action="/admin/checktest" method="get">
        <select name="test">
            <c:forEach var="test" items="${tests}">
                <option value="${test.id}">${test.name}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Ok">
    </form>
</c:if>

<c:if test="${resultsByLoginAndTest != null}">
    <h3>Пользователь <em>${user}</em> выполнил тест № ${testN} со следующими результатами.</h3><br/>
    <table border="1">
        <thead>
        <tr>
            <td>№ вопроса</td>
            <c:forEach var="i" begin="1" end="15" step="1">
                <td>${i}</td>
            </c:forEach>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Выбранный вариант</td>
            <c:forEach var="result" items="${resultsByLoginAndTest}">
                <td>${result.res}</td>
            </c:forEach>
        </tr>
        </tbody>
    </table>
</c:if>
<br/>
<a href="/admin/question">Назад в админ панель</a>

</body>
</html>
