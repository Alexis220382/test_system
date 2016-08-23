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
<c:if test="${tests != null}">
    <h3>Выберите тест</h3><br/>
    <form action="/admin/checktest" method="get">
        <select name="test">
            <c:forEach var="test" items="${tests}">
                <option value="${test.id}">${test.name}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Ok">
    </form>
</c:if>

<c:if test="${questions != null}">
    <form action="/admin/saverevision" method="get">
        <h3>Определите правильные ответы на вопросы.</h3><br/>
        <input type="hidden" name="testN" value="${testN}">
        <table border="1">
            <thead>
            <tr>
                <td>Наименование вопроса</td>
                <c:forEach var="question" items="${questions}">
                    <td>${question.name}</td>
                </c:forEach>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Отметить правильный</td>
                <c:set var="i" value="1" />
                <c:forEach var="question" items="${questions}">
                    <td>
                        <input type="radio" name="answer${i}" value="1" required>1. ${question.first}<br/>
                        <input type="radio" name="answer${i}" value="2" required>2. ${question.second}<br/>
                        <input type="radio" name="answer${i}" value="3" required>3. ${question.third}<br/>
                    </td>
                    <c:set var="i" value="${i+1}"/>
                </c:forEach>
            </tr>
            </tbody>
        </table>
        <input type="submit" value="Тест проверен">
    </form>
</c:if>
<br/>
<a href="/admin/question">Назад в админ панель</a>

</body>
</html>
