<%--
  Created by IntelliJ IDEA.
  User: przemyslaw
  Date: 19.05.2020
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dodaj przepis</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">

    <form:form method="POST" modelAttribute="recipe" class="form-signin">
        <h2 class="form-signin-heading">Dodaj przepis</h2>
        <br>

        <spring:bind path="name">
            <form:label path="name">Nazwij przepis</form:label>
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="name" class="form-control" placeholder="Nazwa przepisu"
                            autofocus="true"></form:input>
                <form:errors path="name"></form:errors>
            </div>
        </spring:bind>


        <spring:bind path="cuisine">
            <form:label path="cuisine">Wybierz kuchnie</form:label>
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:select class="form-control" path="cuisine" placeholder="Kuchnia">
                    <form:options items="${cuisines}"/>
                </form:select>
                <form:errors path="cuisine"></form:errors>
            </div>
         </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Dodaj przepis</button>
    </form:form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
