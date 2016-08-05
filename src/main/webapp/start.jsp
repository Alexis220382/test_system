<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ivanovskiy.entity.TestsEntity" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<%List<TestsEntity> tests = (List<TestsEntity>) request.getAttribute("tests");%>
<form action="/getsess.form">
    <p><b>Выберете тест для сдачи.<br />
        Нажмите кнопку "Сдать тест".</b></p>
    <%for(TestsEntity testsEntity : tests){%>
        <input type="radio" name="testN" value="<%=testsEntity.getId()%>"> <%=testsEntity.getName()%><br />
     <%}%>
     <input type="text" name="login" /><br />
     <input type="submit" name="button" value="Сдать тест" /><br /><br /><br />
</form>
</body>
</html>
