<%--
  Created by IntelliJ IDEA.
  User: przemyslaw
  Date: 30.05.2020
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

    <title>Lista ulubionych</title>

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
<body>
<sec:authorize access="isAuthenticated()">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
                <h2>Witaj ${pageContext.request.userPrincipal.name}</h2>
            </div>
            <br>
            <div class="col-sm-3">
                <button type="button" class="btn btn-primary"><a href="${contextPath}/mainPage" style="color: white">
                    Powrót
                </a></button>
                <div class="dropdown pull-right">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                        Profil kucharza
                    </button>
                    <div class="dropdown-menu">
                        <div class="dropdown-divider">
                            <a class="dropdown-item" href="#">
                                <div class="text-right"
                                     style="padding-right: 15%; padding-bottom: 2%; font-weight: bolder">Profil
                                </div>
                            </a>
                        </div>
                        <div class="dropdown-divider">
                            <a class="dropdown-item" href="${contextPath}/mainPage/favorite">
                                <div class="text-right"
                                     style="padding-right: 15%; padding-bottom: 2%; font-weight: bolder">Ulubione
                                </div>
                            </a>
                        </div>
                        <div class="dropdown-divider">
                            <a class="dropdown-item" onclick="document.forms['logoutForm'].submit()">
                                <div class="text-right"
                                     style="padding-right: 15%; padding-bottom: 2%; font-weight: bolder">Wyloguj się
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            </c:if>
        </div>
    </div>

    <div class="container">
        <h3 style="padding-top: 50px; font-weight: bolder">Lista przepisów</h3>
    </div>

    <br>
    <div class="container">
        <div class="row">
            <c:if test="${empty allFavRecipes}"><h1 style="text-align: center; padding-top: 15%">NIC TU KURWA NIE
                MA</h1></c:if>
            <c:forEach items="${allFavRecipes}" var="recipe">
                <div class="col-sm-6">
                    <div class="card">
                        <h4 class="card-title" style="font-weight: bolder">${recipe.name}</h4>
                        <button type="button" style="color: goldenrod"
                                class="glyphicon glyphicon-star"
                                data-toggle="modal"
                                data-target="#exampleFavModal">
                        </button>
                        <img class="card-img-top" src="" alt="Grafika">
                        <c:choose>
                            <c:when test="${recipe.recommend == true}">
                                <p class="card-text" style="font-weight: bolder">Polecane przez
                                    kucharza!</p>
                            </c:when>
                            <c:otherwise>
                                <p>
                                    <br>
                                </p>
                            </c:otherwise>
                        </c:choose>
                        <ul class="list-group list-group-flush" style="width: 35rem;">
                            <li class="list-group-item"><p style="font-weight: bolder">Poziom
                                trudności:</p>
                                <c:forEach var="i" begin="1" end="${recipe.level}">&#9733; </c:forEach></li>
                            <c:choose>
                                <c:when test="${recipe.kcal != 0}">
                                    <li class="list-group-item"><p style="font-weight: bolder">
                                        Kaloryczność:</p>${recipe.kcal} kcal
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="list-group-item" style="font-weight: bold"><p
                                            style="font-weight: bolder">Kaloryczność:</p>
                                        <div style="font-style: italic">Nie określono kaloryczności
                                            przepisu
                                        </div>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${not empty recipe.time}">
                                    <li class="list-group-item"><p style="font-weight: bolder">Czas
                                        przygotowania:</p>${recipe.time}</li>
                                </c:when>
                                <c:otherwise>
                                    <li class="list-group-item" style="font-weight: bold"><p
                                            style="font-weight: bolder">Czas
                                        przygotowania:</p>
                                        <div style="font-style: italic">Nie określono czasu przygotowania
                                        </div>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <li class="list-group-item"><p style="font-weight: bolder">Rodzaj
                                kuchni:</p> ${recipe.cuisine}</li>
                            <li class="list-group-item"><p style="font-weight: bolder">Typ
                                kuchni:</p>${recipe.type}</li>
                        </ul>
                        <div class="card-body">
                            <a href="${contextPath}/mainPage/recipe/${recipe.id}"
                               class="btn btn-primary alert-success ">Zobacz
                                przepis</a>
                        </div>
                        <br>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</sec:authorize>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
