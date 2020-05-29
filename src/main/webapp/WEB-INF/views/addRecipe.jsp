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
                <form:select class="form-control" path="cuisine" placeholder="Kuchnia">
                    <form:options items="${cuisines}"/>
                </form:select>
         </spring:bind>

        <spring:bind path="type">
            <form:label path="type">Wybierz typ</form:label>
                <form:select class="form-control" path="type" placeholder="Typy">
                    <form:options items="${cuisineTypes}"/>
                </form:select>
        </spring:bind>

        <spring:bind path="ingredients">
            <form:label path="ingredients">Wypisz składniki</form:label>
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:textarea path="ingredients" class="form-control" placeholder="Składniki"
                            rows="5" autofocus="true"></form:textarea>
                <form:errors path="ingredients"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="description">
            <form:label path="description">Opis</form:label>
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:textarea path="description" class="form-control" placeholder="Opis"
                               rows="10" autofocus="true"></form:textarea>
                <form:errors path="description"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="kcal">
            <div class="margin-bottom">
                <form:label path="kcal">Kalorie</form:label>
                    <form:input type="number" path="kcal" class="form-control" placeholder="Ilość kalorii" value="0"
                            autofocus="true"></form:input>
            </div>
        </spring:bind>

        <spring:bind path="other">
            <form:label path="other">Inne informacje</form:label>
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:textarea path="other" class="form-control" placeholder="Inne"
                               rows="2" autofocus="true"></form:textarea>
                <form:errors path="other"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="time">
            <form:label path="time">Czas przygotowania</form:label>
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="time" class="form-control" placeholder="Czas przygotowania"
                            autofocus="true"></form:input>
                <form:errors path="time"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="level">
            <form:label path="level">Poziom trudności</form:label>
                <form:select class="form-control" path="level" placeholder="Poziom trudności">
                    <form:option value="1" items="1">&#9733;</form:option>
                    <form:option value="2" items="2">&#9733; &#9733;</form:option>
                    <form:option value="3" items="3">&#9733; &#9733; &#9733;</form:option>
                    <form:option value="4" items="4">&#9733; &#9733; &#9733; &#9733;</form:option>
                    <form:option value="5" items="5">&#9733; &#9733; &#9733; &#9733; &#9733;</form:option>
                    <form:option value="6" items="6">&#9733; &#9733; &#9733; &#9733; &#9733; &#9733;</form:option>
                </form:select>
        </spring:bind>

        <form:label path="recommend">Polecany przepis</form:label>
        <br>
        Nie <form:radiobutton path="recommend" value="false"/>
        Tak <form:radiobutton path="recommend" value="true"/>

        <div class="form-signin-xs extra-margin-top">
            <a href="${contextPath}/mainPage" class="btn btn-info text-center extra-width" type="submit">Anuluj</a>
            <button class="btn btn-info text-center" type="submit">Dodaj przepis</button>
        </div>
    </form:form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
