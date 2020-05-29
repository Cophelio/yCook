<%--
  Created by IntelliJ IDEA.
  User: przemyslaw
  Date: 24.05.2020
  Time: 18:09
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

    <title>Zobacz przepis</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <![endif]-->
</head>
<body class="text-center">
<header class="container">
    <h3 style="padding-bottom: 2%">${actualRecipe.name}</h3>
</header>
<main role="main" class="inner cover">
    <div class="container">
        <img class="card-img-top" src="" alt="Grafika" style="padding-bottom: 2%">
        <div class="row">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title" style="padding-bottom: 2%">Trudność przepisu: <c:forEach var="i" begin="1" end="${actualRecipe.level}">&#9733; </c:forEach></h4>
                        <c:choose>
                            <c:when test="${actualRecipe.kcal != 0}">
                                <h4 class="card-title" style="padding-bottom: 2%;">Kaloryczność: ${actualRecipe.kcal}
                                    kcal</h4>
                            </c:when>
                            <c:otherwise>
                                <h4 class="card-title" style="padding-bottom: 2%;">Kaloryczność: Nie podano</h4>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${not empty actualRecipe.time}">
                                <h4 class="card-title" style="padding-bottom: 2%;">Czas
                                    przygotowania: ${actualRecipe.time}</h4>
                            </c:when>
                            <c:otherwise>
                                <h4 class="card-title" style="padding-bottom: 2%;">Czas przygotowania: Nie podano</h4>
                            </c:otherwise>
                        </c:choose>
                        <h4 class="card-title" style="padding-bottom: 2%;">Rodzaj kuchni: ${actualRecipe.cuisine}</h4>
                        <h4 class="card-title" style="padding-bottom: 2%;">Typ kuchni: ${actualRecipe.type}</h4>
                        <c:choose>
                            <c:when test="${not empty actualRecipe.other}">
                                <h4 class="card-title" style="font-weight: bold">Dodatkowe informacje:</h4>
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                        </c:choose>
                        <p class="card-text">${actualRecipe.other}</p>
                        <h4 class="card-title" style="font-weight: bold">Składniki:</h4>
                        <p class="card-text">${actualRecipe.ingredients}</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title" style="padding-bottom: 5%;"><c:if
                                test="${recipe.recommend == true}"></c:if>Polecany przepis przez kucharza!</h4>
                        <h4 class="card-title">Opis przygotowania:</h4>
                        <p class="card-text">${actualRecipe.description}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
