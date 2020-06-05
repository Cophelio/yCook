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

    <title>Widok przepisu</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!--Custom styles-->
    <link rel="stylesheet" type="text/css" href="../../../resources/css/profile.css">

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
<body class="text-center">
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
                    <li><a href="${contextPath}/mainPage">Strona Główna</a></li>
                    <li><a href="${contextPath}/mainPage/recipe/add">Dodaj nowy przepis</a></li>
                    <li><a href="${contextPath}/mainPage/favorite">Lista ulubionych przepisów</a></li>
                    <li><a href="${contextPath}/profile/${userId}">Profil kucharza</a></li>
                    <li><a onclick="document.forms['logoutForm'].submit()">WYLOGUJ SIĘ</a></li>
                </ul>
            </div>
            </c:if>
        </div>
    </nav>

    <br>
    <div id="services" class="container-fluid text-center" style="margin-top: 2.5%">
        <h2 class="bigpixi_head"><span>${actualRecipe.name}</span></h2>
    </div>

    <div style="padding-bottom: 1.5%"></div>


    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6 well form-horizontal">
                <div class="col-sm-12">
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" style="padding-bottom: 2%">Trudność przepisu: <c:forEach var="i"
                                                                                                                begin="1"
                                                                                                                end="${actualRecipe.level}">&#9733; </c:forEach></h4>
                                <c:choose>
                                    <c:when test="${actualRecipe.kcal != 0}">
                                        <h4 class="card-title" style="padding-bottom: 2%;">
                                            Kaloryczność: ${actualRecipe.kcal}
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
                                        <h4 class="card-title" style="padding-bottom: 2%;">Czas przygotowania: Nie
                                            podano</h4>
                                    </c:otherwise>
                                </c:choose>
                                <h4 class="card-title" style="padding-bottom: 2%;">Rodzaj
                                    kuchni: ${actualRecipe.cuisine}</h4>
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
            <div class="col-xs-12 col-sm-9">
                <div class="pull-right">
                    <H3><small>Powrót na stronę główną</small></H3>
                    <button class="btn btn-info btn-color"><a
                            href="${contextPath}/mainPage" style="color: white"> Powrót
                    </a></button>
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
