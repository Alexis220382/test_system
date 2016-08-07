<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Перечень вопросов</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 1. Подключаем скомпилированный и минимизированный файл CSS Bootstrap 3 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<p style="color: red">${error}</p>
<p>${question}</p>

<c:if test="${X eq Y}">
<c:set var="questions_redirect" value="${getquestions}"/>
</c:if>
<c:if test="${X eq Y}">
    <c:set var="questions_redirect" value="${result}"/>
</c:if>
<form action="/${questions_redirect}">
    <b>Тест 1. Вопрос 1.</b><br />
    <label for="one">1. </label>
    <input type="radio" id="one" name="answer" value="1"> ${first_answer}<br />
    <label for="two">2. </label>
    <input type="radio" id="two" name="answer" value="2"> ${second_answer}<br />
    <label for="three">3. </label>
    <input type="radio" id="three" name="answer" value="3"> ${third_answer}<br />
    <input type="hidden" name="qNumber" value="1" />
    <input type="submit" name="button" value="Следующий вопрос" /><br /></form>

</body>
</html>
