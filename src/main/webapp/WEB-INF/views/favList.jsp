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

    <!--Custom styles-->
    <link rel="stylesheet" type="text/css" href="../../../resources/css/mainPage.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <![endif]-->

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</head>
<body>
<sec:authorize access="isAuthenticated()">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container-fluid" style="margin-left: 5%; margin-right:5%">
            <div class="navbar-header">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand"
                   href="${contextPath}/profile/${userId}">${pageContext.request.userPrincipal.name}</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${contextPath}/mainPage">Strona Główna</a>
                    </li>
                    <li><a href="${contextPath}/mainPage/recipe/add">Dodaj nowy przepis</a></li>
                    <li class="active"><a href="${contextPath}/mainPage/favorite">Lista ulubionych przepisów</a></li>
                    <li><a href="${contextPath}/profile/${userId}">Profil kucharza</a></li>
                    <li><a onclick="document.forms['logoutForm'].submit()">WYLOGUJ SIĘ</a></li>
                </ul>
            </div>
            </c:if>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="false">
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="${contextPath}/resources/uploads/rsz_112959485.jpg" alt="background">
                        <div class="header-text hidden-xs">
                            <div class="col-md-12 text-right" style="padding-right: 10%">
                                <h2>
                                    <span style="color: white"><strong>LISTA ULUBIONYCH PRZEPISÓW</strong></span>
                                </h2>
                                <br>
                                <h3>
                                    <span style="color: white">Znajdują się tutaj wszystkie ulubione przepisy.</span>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="services" class="container-fluid text-center" style="margin-top: 2.5%">
        <h2 class="bigpixi_head"><span>Lista ulubionych przepisów</span></h2>
    </div>

    <div class="container">
        <div class="banner-bottom">
            <div class="container">
                <div class="col-lg-12">
                    <div class="row">
                        <c:forEach items="${allFavRecipes}" var="recipe">
                            <div class="col-lg-4">
                                <div class="container-fluid">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">
                                            <div style="font-weight: bold">
                                                    ${recipe.name}
                                            </div>
                                        </li>
                                        <li class="media-list">
                                            <div>
                                                <img class="advert-img"
                                                     src="${contextPath}/resources/uploads/placeholder-image.jpg"/>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <button type="button"
                                                    class="btn btn-primary btn-block btn-color-return no-click">Ulubiony
                                                przepis
                                            </button>
                                        </li>
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
                                    <div class="card-body" style="margin-top: -2.5%">
                                        <a href="${contextPath}/mainPage/recipe/${recipe.id}"
                                           class="btn btn-primary btn-block btn-color"
                                           style="color: white">Zobacz ulubiony przepis</a>
                                    </div>
                                    <br>
                                </div>
                                <br>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section class="footer tbpadding">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="link-area">
                        <h3 style="color: white">O MNIE</h3>
                        <P style="color: white">Nazywam się <a
                                href="https://www.linkedin.com/in/przemyslaw-szczerkowski-66638a141"
                                style="color: #FFC312">Przemysław Szczerkowski</a>. Projekt Stworzony został w
                            ramach
                            kursu Coderslab.</P>
                    </div>
                </div>
            </div>
        </div>
    </section>
</sec:authorize>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
