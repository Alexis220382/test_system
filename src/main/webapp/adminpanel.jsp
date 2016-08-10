<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Админ панель</title>
</head>
<body>
<h3>Панель администратора</h3>

<%--Список вопросов для компоновки теста--%>
<form name="create_test" action="/admin/newtest" method="get">
    <label for="test_name">Наименование теста: </label>
    <input type="text" id="test_name" name="test_name" value=""><br />
    <label for="one">Первый вопрос: </label>
    <select id="one" name="one" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <label for="two">Второй вопрос: </label>
    <select id="two" name="two" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <label for="three">Третий вопрос: </label>
    <select id="three" name="three" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <label for="four">Четвертый вопрос: </label>
    <select id="four" name="four" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <label for="five">Пятый вопрос: </label>
    <select id="five" name="five" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <label for="six">Шестой вопрос: </label>
    <select id="six" name="six" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <label for="seven">Седьмой вопрос: </label>
    <select id="seven" name="seven" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <label for="eight">Восьмой вопрос: </label>
    <select id="eight" name="eight" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <label for="nine">Девятый вопрос: </label>
    <select id="nine" name="nine" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <label for="ten">Десятый вопрос: </label>
    <select id="ten" name="ten" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <label for="eleven">Одиннадцатый вопрос: </label>
    <select id="eleven" name="eleven" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <label for="twelve">Двенадцатый вопрос: </label>
    <select id="twelve" name="twelve" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <label for="thirteen">Тринадцатый вопрос: </label>
    <select id="thirteen" name="thirteen" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <label for="fourteen">Четырнадцатый вопрос: </label>
    <select id="fourteen" name="fourteen" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <label for="fifteen">Пятнадцатый вопрос: </label>
    <select id="fifteen" name="fifteen" value="">
        <c:forEach var="question" items="${questions}">
            <option value="${question.id}">${question.name}</option>
        </c:forEach>
    </select><br />
    <h3>Установите период действия теста:</h3>
    <label for="period_from">Начиная с: </label>
    <input type="text" id="period_from" name="period_from" placeholder="YYYY-MM-DD HH:MM:SS"
           pattern="[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}" required><br />
    <label for="period_to">Заканчивая: </label>
    <input type="text" id="period_to" name="period_to" placeholder="YYYY-MM-DD HH:MM:SS"
           pattern="[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}" required><br />
    <input type="submit" value="Создать тест">

</form>

<%--//Для внесения нового вопроса в базу--%>
<form name="create_question" action="/admin/newquestion" method="get">
    <h3 style="color: #398439">${message}</h3>
    <h3>Добавление нового вопроса в базу данных.</h3>
    <label for="new_question">Текст вопроса: </label>
    <input type="text" id="new_question" name="new_question"><br />
    <label for="new_question">Вариант ответа 1: </label>
    <input type="text" id="first_variant" name="first_variant"><br />
    <label for="new_question">Вариант ответа 2: </label>
    <input type="text" id="second_variant" name="second_variant"><br />
    <label for="new_question">Вариант ответа 3: </label>
    <input type="text" id="third_variant" name="third_variant"><br />
    <input type="submit" value="Создать вопрос">
</form>
<br/><br/>
<a href="/gettests">Вернуться к тестам</a>
</body>
</html>
