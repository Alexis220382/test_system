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

<form action="/result">
    <b>Тест <input type="text" name="testN" value="${testN}">.</b><br /><br />
    <label><b>Вопрос 2. ${qName1}</b></label><br />
    <input type="hidden" name="id1" value="${questionId1}">
    <input type="radio" id="one" name="answer1" value="1" required>1. ${first_answer1}<br />
    <input type="radio" id="two" name="answer1" value="2" required>2. ${second_answer1}<br />
    <input type="radio" id="three" name="answer1" value="3" required>3. ${third_answer1}<br />
    <br />
    <label><b>Вопрос 2. ${qName2}</b></label><br />
    <input type="hidden" name="id2" value="${questionId2}">
    <input type="radio" id="one" name="answer2" value="1" required>1. ${first_answer2}<br />
    <input type="radio" id="two" name="answer2" value="2" required>2. ${second_answer2}<br />
    <input type="radio" id="three" name="answer2" value="3" required>3. ${third_answer2}<br />
    <br />
    <label><b>Вопрос 3. ${qName3}</b></label><br />
    <input type="hidden" name="id3" value="${questionId3}">
    <input type="radio" id="one" name="answer3" value="1" required>1. ${first_answer3}<br />
    <input type="radio" id="two" name="answer3" value="2" required>2. ${second_answer3}<br />
    <input type="radio" id="three" name="answer3" value="3" required>3. ${third_answer3}<br />
    <br />
    <label><b>Вопрос 4. ${qName4}</b></label><br />
    <input type="hidden" name="id4" value="${questionId4}">
    <input type="radio" id="one" name="answer4" value="1" required>1. ${first_answer4}<br />
    <input type="radio" id="two" name="answer4" value="2" required>2. ${second_answer4}<br />
    <input type="radio" id="three" name="answer4" value="3" required>3. ${third_answer4}<br />
    <br />
    <label><b>Вопрос 5. ${qName5}</b></label><br />
    <input type="hidden" name="id5" value="${questionId5}">
    <input type="radio" id="one" name="answer5" value="1" required>1. ${first_answer5}<br />
    <input type="radio" id="two" name="answer5" value="2" required>2. ${second_answer5}<br />
    <input type="radio" id="three" name="answer5" value="3" required>3. ${third_answer5}<br />
    <br />
    <label><b>Вопрос 6. ${qName6}</b></label><br />
    <input type="hidden" name="id6" value="${questionId6}">
    <input type="radio" id="one" name="answer6" value="1" required>1. ${first_answer6}<br />
    <input type="radio" id="two" name="answer6" value="2" required>2. ${second_answer6}<br />
    <input type="radio" id="three" name="answer6" value="3" required>3. ${third_answer6}<br />
    <br />
    <label><b>Вопрос 7. ${qName7}</b></label><br />
    <input type="hidden" name="id7" value="${questionId7}">
    <input type="radio" id="one" name="answer7" value="1" required>1. ${first_answer7}<br />
    <input type="radio" id="two" name="answer7" value="2" required>2. ${second_answer7}<br />
    <input type="radio" id="three" name="answer7" value="3" required>3. ${third_answer7}<br />
    <br />
    <label><b>Вопрос 8. ${qName8}</b></label><br />
    <input type="hidden" name="id8" value="${questionId8}">
    <input type="radio" id="one" name="answer8" value="1" required>1. ${first_answer8}<br />
    <input type="radio" id="two" name="answer8" value="2" required>2. ${second_answer8}<br />
    <input type="radio" id="three" name="answer8" value="3" required>3. ${third_answer8}<br />
    <br />
    <label><b>Вопрос 9. ${qName9}</b></label><br />
    <input type="hidden" name="id9" value="${questionId9}">
    <input type="radio" id="one" name="answer9" value="1" required>1. ${first_answer9}<br />
    <input type="radio" id="two" name="answer9" value="2" required>2. ${second_answer9}<br />
    <input type="radio" id="three" name="answer9" value="3" required>3. ${third_answer9}<br />
    <br />
    <label><b>Вопрос 10. ${qName10}</b></label><br />
    <input type="hidden" name="id10" value="${questionId10}">
    <input type="radio" id="one" name="answer10" value="1" required>1. ${first_answer10}<br />
    <input type="radio" id="two" name="answer10" value="2" required>2. ${second_answer10}<br />
    <input type="radio" id="three" name="answer10" value="3" required>3. ${third_answer10}<br />
    <br />
    <label><b>Вопрос 11. ${qName11}</b></label><br />
    <input type="hidden" name="id11" value="${questionId11}">
    <input type="radio" id="one" name="answer11" value="1" required>1. ${first_answer11}<br />
    <input type="radio" id="two" name="answer11" value="2" required>2. ${second_answer11}<br />
    <input type="radio" id="three" name="answer11" value="3" required>3. ${third_answer11}<br />
    <br />
    <label><b>Вопрос 12. ${qName12}</b></label><br />
    <input type="hidden" name="id12" value="${questionId12}">
    <input type="radio" id="one" name="answer12" value="1" required>1. ${first_answer12}<br />
    <input type="radio" id="two" name="answer12" value="2" required>2. ${second_answer12}<br />
    <input type="radio" id="three" name="answer12" value="3" required>3. ${third_answer12}<br />
    <br />
    <label><b>Вопрос 13. ${qName13}</b></label><br />
    <input type="hidden" name="id13" value="${questionId13}">
    <input type="radio" id="one" name="answer13" value="1" required>1. ${first_answer13}<br />
    <input type="radio" id="two" name="answer13" value="2" required>2. ${second_answer13}<br />
    <input type="radio" id="three" name="answer13" value="3" required>3. ${third_answer13}<br />
    <br />
    <label><b>Вопрос 14. ${qName14}</b></label><br />
    <input type="hidden" name="id14" value="${questionId14}">
    <input type="radio" id="one" name="answer14" value="1" required>1. ${first_answer14}<br />
    <input type="radio" id="two" name="answer14" value="2" required>2. ${second_answer14}<br />
    <input type="radio" id="three" name="answer14" value="3" required>3. ${third_answer14}<br />
    <br />
    <label><b>Вопрос 15. ${qName15}</b></label><br />
    <input type="hidden" name="id15" value="${questionId15}">
    <input type="radio" id="one" name="answer15" value="1" required>1. ${first_answer15}<br />
    <input type="radio" id="two" name="answer15" value="2" required>2. ${second_answer15}<br />
    <input type="radio" id="three" name="answer15" value="3" required>3. ${third_answer15}<br />
    <br />
    <input type="submit" name="submit" value="Ответить">
</form>
</body>
</html>
