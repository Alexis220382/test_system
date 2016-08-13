<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change time-period</title>
</head>
<body>

<c:if test="${test == null}">
    <form action="/admin/showexisteperiod" method="get">
    <p>Выберите тест</p>
    <select name="chosetest">
        <c:forEach var="test" items="${tests}">
            <option value="${test.id}">${test.name}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Ok">
</form>
</c:if>

<c:if test="${test != null}">
    <form action="/admin/changeperiod" method="get">
        <h4 style="color: #398439">${message}</h4>
        <h3>Измените период действия теста ${test.name}:</h3>
        <input type="hidden" name="testId" value="${test.id}">
        <label for="period_from">Начиная с: </label>
        <input type="text" id="period_from" name="period_from" value="${test.dateFrom}"
               placeholder="YYYY-MM-DD HH:MM:SS"
               pattern="[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}" required><br/>
        <label for="period_to">Заканчивая: </label>
        <input type="text" id="period_to" name="period_to" value="${test.dateTo}"
               placeholder="YYYY-MM-DD HH:MM:SS"
               pattern="[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}" required><br/>
        <input type="submit" value="Изменить">
    </form>
</c:if>
<br/><br/>
<a href="/admin/question">Назад в админ панель</a>

</body>
</html>
