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

    <title>Edytuj przepis</title>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <!--Custom styles-->
    <link rel="stylesheet" type="text/css" href="../../../resources/css/addRecipe.css">
</head>
<body>
<sec:authorize access="isAuthenticated()">

    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>Edytuj nowy przepis</h3>
                </div>
                <div class="card-body">
                    <form:form method="POST" modelAttribute="foundedRecipe" class="form-signin">
                        <spring:bind path="name">
                            <form:label path="name" cssStyle="color: white">Edytuj przepis</form:label>
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <form:input type="text" path="name" class="form-control" placeholder="Nazwa przepisu"
                                            autofocus="true"></form:input>
                                <form:errors path="name" cssStyle="color: orangered"></form:errors>
                            </div>
                        </spring:bind>

                        <spring:bind path="cuisine">
                            <form:label path="cuisine" cssStyle="color: white">Wybierz kuchnie</form:label>
                            <form:select class="form-control" path="cuisine" placeholder="Kuchnia">
                                <form:options items="${cuisines}"/>
                            </form:select>
                            <br>
                        </spring:bind>

                        <spring:bind path="type">
                            <form:label path="type" cssStyle="color: white">Wybierz typ kuchni</form:label>
                            <form:select class="form-control" path="type" placeholder="Typ">
                                <form:options items="${cuisineTypes}"/>
                            </form:select>
                            <br>
                        </spring:bind>

                        <spring:bind path="ingredients">
                            <form:label path="ingredients" cssStyle="color: white">Wypisz składniki</form:label>
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <form:textarea path="ingredients" class="form-control" placeholder="Składniki"
                                               rows="5" autofocus="true"></form:textarea>
                                <form:errors path="ingredients" cssStyle="color: orangered"></form:errors>
                            </div>
                        </spring:bind>

                        <spring:bind path="description">
                            <form:label path="description" cssStyle="color: white">Opis</form:label>
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <form:textarea path="description" class="form-control" placeholder="Opis"
                                               rows="10" autofocus="true"></form:textarea>
                                <form:errors path="description" cssStyle="color: orangered"></form:errors>
                            </div>
                        </spring:bind>

                        <spring:bind path="kcal">
                            <div class="margin-bottom">
                                <form:label path="kcal" cssStyle="color: white">Kalorie</form:label>
                                <form:input type="number" path="kcal" class="form-control" placeholder="Ilość kalorii"
                                            value="0"
                                            autofocus="true"></form:input>
                            </div>
                            <br>
                        </spring:bind>

                        <spring:bind path="other">
                            <form:label path="other" cssStyle="color: white">Inne informacje</form:label>
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <form:textarea path="other" class="form-control" placeholder="Inne"
                                               rows="2" autofocus="true"></form:textarea>
                                <form:errors path="other" cssStyle="color: orangered"></form:errors>
                            </div>
                        </spring:bind>

                        <spring:bind path="time">
                            <form:label path="time" cssStyle="color: white">Czas przygotowania</form:label>
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <form:input type="text" path="time" class="form-control"
                                            placeholder="Czas przygotowania"
                                            autofocus="true"></form:input>
                                <form:errors path="time" cssStyle="color: orangered"></form:errors>
                            </div>
                        </spring:bind>

                        <spring:bind path="level">
                            <form:label path="level" cssStyle="color: white">Poziom trudności</form:label>
                            <form:select class="form-control" path="level" placeholder="Poziom trudności">
                                <form:option value="1" items="1">&#9733;</form:option>
                                <form:option value="2" items="2">&#9733; &#9733;</form:option>
                                <form:option value="3" items="3">&#9733; &#9733; &#9733;</form:option>
                                <form:option value="4" items="4">&#9733; &#9733; &#9733; &#9733;</form:option>
                                <form:option value="5" items="5">&#9733; &#9733; &#9733; &#9733; &#9733;</form:option>
                                <form:option value="6"
                                             items="6">&#9733; &#9733; &#9733; &#9733; &#9733; &#9733;</form:option>
                            </form:select>
                        </spring:bind>
                        <div class="form-group" style="padding-top: 7.5%">
                            <input type="submit" value="Edytuj przepis" class="btn float-right register_btn">
                            <div style="margin-top: 2.5%">
                                <a href="${contextPath}/mainPage" style="color: #FFC312">Anuluj edytowanie</a>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</sec:authorize>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
