<%--
  Created by IntelliJ IDEA.
  User: przemyslaw
  Date: 18.05.2020
  Time: 18:26
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

    <title>Strona główna</title>

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
                    <li class="active"><a href="${contextPath}/mainPage" style="font-weight: bold">Strona Główna</a>
                    </li>
                    <li><a href="${contextPath}/mainPage/recipe/add">Dodaj nowy przepis</a></li>
                    <li><a href="${contextPath}/mainPage/favorite">Lista ulubionych przepisów</a></li>
                    <li><a href="${contextPath}/profile/${userId}">Profil kucharza</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Filtruj liste przepisów<b
                                class="caret"></b></a>
                        <ul class="dropdown-menu" style="width: 125%">
                            <form action="${contextPath}/mainPage" class="form-inline" role="form">
                                <div class="form-group">
                                    <li>
                                        <label class="filter-col" style="margin-left: 10%; margin-top: 5%" for="name">Nazwa
                                            przepisu</label>
                                        <input id="name" class="form-control"
                                               style="margin-left: 10%; margin-bottom: 5%; width: 80%"
                                               type="text" name="name" placeholder="Wpisz nazwe">
                                    </li>

                                    <li>
                                        <label class="filter-col" style="margin-left: 10%" for="cuisineValue">Wybierz
                                            kuchnie</label>
                                        <select class="form-control"
                                                style="margin-left: 10%; margin-bottom: 5%; width: 80%"
                                                name="cuisineValue" id="cuisineValue">
                                            <option value=""></option>
                                            <c:forEach items="${cuisines}" var="cuisine">
                                                <c:if test="${cuisine != cuisines}">
                                                    <option value="${cuisine.value}">${cuisine.value}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </li>

                                    <li>
                                        <label class="filter-col" style="margin-left: 10%" for="cuisineTypeValue">Wybierz
                                            typ</label>
                                        <select class="form-control"
                                                style="margin-left: 10%; margin-bottom: 5%; width: 80%"
                                                name="cuisineTypeValue" id="cuisineTypeValue">
                                            <option value=""></option>
                                            <c:forEach items="${cuisineTypes}" var="cuisineType">
                                                <c:if test="${cuisineType != cuisineTypes}">
                                                    <option value="${cuisineType.value}">${cuisineType.value}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </li>

                                    <li>
                                        <div>
                                            <button type="submit" class="btn btn-default btn-block"
                                                    style="margin-bottom: 5%; margin-left: 10%; width: 80%; font-weight: bold">
                                                <span></span> Zastosuj
                                            </button>
                                            <button type="submit" class="btn btn-default btn-block"
                                                    style="margin-bottom: 5%; margin-left: 10%; width: 80%; font-weight: bold">
                                                <span></span><a href="${contextPath}/mainPage" style="color: black">
                                                Usuń filtry</a>
                                            </button>
                                        </div>
                                    </li>
                                </div>
                            </form>
                        </ul>
                    </li>
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
                                    <span style="color: white"><strong>WITAJ NA STRONIE DLA KUCHARZY AMATORÓW</strong></span>
                                </h2>
                                <br>
                                <h3>
                                    <span style="color: white">Twórz, zapisuj i dodawaj do ulubionych własne przepisy!</span>
                                </h3>
                                <br>
                                <h1><a href="${contextPath}/mainPage/recipe/add"
                                       style="color: #FFC312; font-weight: bold; padding-right: 1%">DODAJ PRZEPIS</a>
                                </h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="services" class="container-fluid text-center" style="margin-top: 2.5%">
        <h2 class="bigpixi_head"><span>Lista dodanych przepisów</span></h2>
    </div>

    <div class="container">
        <div class="banner-bottom">
            <div class="container">
                <div class="col-lg-12">
                    <div class="row">
                        <c:if test="${empty allRecipes}"><h1 class="bigpixi_head"
                                                             style="text-align: center; margin-top: 5%">NIE DODANO
                            JESZCZE ŻADNEGO PRZEPISU</h1></c:if>
                        <c:forEach items="${allRecipes}" var="recipe">
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
                                                <img src="https://via.placeholder.com/320x250"/>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <c:choose>
                                                <c:when test="${recipe.favorite == false}">
                                                    <button type="button" class="btn btn-primary btn-block btn-color"
                                                            data-toggle="modal"
                                                            data-target="#exampleFavModal${recipe.id}">Dodaj przepis do
                                                        ulubionych!
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button"
                                                            class="btn btn-primary btn-block btn-color-return"
                                                            data-toggle="modal"
                                                            data-target="#exampleFavModal${recipe.id}">Lubisz ten przepis!
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
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
                                        <button type="button" class="btn btn-primary btn-color"
                                                style="width: 30%; color: white" data-toggle="modal"
                                                data-target="#exampleModal">
                                            Usuń
                                        </button>

                                        <a href="${contextPath}/mainPage/recipe/edit/${recipe.id}"
                                           class="btn btn-primary btn-color"
                                           style="width: 30%; margin-left: 4%; color: white">Edytuj</a>

                                        <a href="${contextPath}/mainPage/recipe/${recipe.id}"
                                           class="btn btn-primary pull-right btn-color"
                                           style="width: 30%; color: white">Zobacz</a>
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

    <%--    <br>--%>
    <%--    <div class="container">--%>
    <%--        <div class="row">--%>
    <%--            <c:if test="${empty allRecipes}"><h1 style="text-align: center; padding-top: 15%">NIC TU KURWA NIE--%>
    <%--                MA</h1></c:if>--%>
    <%--            <c:forEach items="${allRecipes}" var="recipe">--%>
    <%--                <div class="col-sm-6">--%>
    <%--                    <div class="card">--%>
    <%--                        <h4 class="card-title" style="font-weight: bolder">${recipe.name}</h4>--%>
    <%--                        <c:choose>--%>
    <%--                            <c:when test="${recipe.favorite == false}">--%>
    <%--                                <button type="button" style="color: goldenrod"--%>
    <%--                                        class="glyphicon glyphicon-star-empty"--%>
    <%--                                        data-toggle="modal"--%>
    <%--                                        data-target="#exampleFavModal${recipe.id}">--%>
    <%--                                </button>--%>

    <%--                                <div class="modal fade" id="exampleFavModal${recipe.id}" tabindex="-1" role="dialog"--%>
    <%--                                     aria-labelledby="exampleFavFalse" aria-hidden="true">--%>
    <%--                                    <div class="modal-dialog" role="document">--%>
    <%--                                        <div class="modal-content">--%>
    <%--                                            <div class="modal-header">--%>
    <%--                                                <button type="button" class="close" data-dismiss="modal"--%>
    <%--                                                        aria-label="Close">--%>
    <%--                                                    <span aria-hidden="true">&times;</span>--%>
    <%--                                                </button>--%>
    <%--                                                <h5 class="modal-title" id="exampleFavFalse"--%>
    <%--                                                    style="font-weight: bolder">Usuwanie</h5>--%>
    <%--                                            </div>--%>
    <%--                                            <div class="modal-body">--%>
    <%--                                                Czy na pewno chcesz dodać przepis o nazwie: ${recipe.name} do--%>
    <%--                                                ulubionych ?--%>
    <%--                                            </div>--%>
    <%--                                            <div class="modal-footer">--%>
    <%--                                                <a href="${contextPath}/mainPage" class="btn btn-secondary"--%>
    <%--                                                   type="submit">Anuluj</a>--%>
    <%--                                                <a href="${contextPath}/mainPage/recipe/add/favorite/${recipe.id}"--%>
    <%--                                                   class="btn btn-secondary alert-success" type="submit">Dodaj--%>
    <%--                                                    do--%>
    <%--                                                    ulubionych</a>--%>
    <%--                                            </div>--%>
    <%--                                        </div>--%>
    <%--                                    </div>--%>
    <%--                                </div>--%>
    <%--                            </c:when>--%>
    <%--                            <c:otherwise>--%>
    <%--                                <button type="button" style="color: goldenrod" class="glyphicon glyphicon-star"--%>
    <%--                                        data-toggle="modal"--%>
    <%--                                        data-target="#exampleFavModal${recipe.id}">--%>
    <%--                                </button>--%>

    <%--                                <div class="modal fade" id="exampleFavModal${recipe.id}" tabindex="-1" role="dialog"--%>
    <%--                                     aria-labelledby="exampleFavTrue" aria-hidden="true">--%>
    <%--                                    <div class="modal-dialog" role="document">--%>
    <%--                                        <div class="modal-content">--%>
    <%--                                            <div class="modal-header">--%>
    <%--                                                <button type="button" class="close" data-dismiss="modal"--%>
    <%--                                                        aria-label="Close">--%>
    <%--                                                    <span aria-hidden="true">&times;</span>--%>
    <%--                                                </button>--%>
    <%--                                                <h5 class="modal-title" id="exampleFavTrue"--%>
    <%--                                                    style="font-weight: bolder">Usuwanie</h5>--%>
    <%--                                            </div>--%>
    <%--                                            <div class="modal-body">--%>
    <%--                                                Czy na pewno chcesz usunać przepis o nazwie: ${recipe.name} z--%>
    <%--                                                ulubionych ?--%>
    <%--                                            </div>--%>
    <%--                                            <div class="modal-footer">--%>
    <%--                                                <a href="${contextPath}/mainPage" class="btn btn-secondary"--%>
    <%--                                                   type="submit">Anuluj</a>--%>
    <%--                                                <a href="${contextPath}/mainPage/recipe/delete/favorite/${recipe.id}"--%>
    <%--                                                   class="btn btn-secondary alert-danger" type="submit">Usuń z--%>
    <%--                                                    ulubionych</a>--%>
    <%--                                            </div>--%>
    <%--                                        </div>--%>
    <%--                                    </div>--%>
    <%--                                </div>--%>
    <%--                            </c:otherwise>--%>
    <%--                        </c:choose>--%>

    <%--                        <c:choose>--%>
    <%--                            <c:when test="${recipe.recommend == true}">--%>
    <%--                                <p class="card-text" style="font-weight: bolder">Polecane przez--%>
    <%--                                    kucharza!</p>--%>
    <%--                            </c:when>--%>
    <%--                            <c:otherwise>--%>
    <%--                                <p>--%>
    <%--                                    <br>--%>
    <%--                                </p>--%>
    <%--                            </c:otherwise>--%>
    <%--                        </c:choose>--%>
    <%--                        <ul class="list-group list-group-flush" style="width: 35rem;">--%>
    <%--                            <li class="list-group-item"><p style="font-weight: bolder">Poziom--%>
    <%--                                trudności:</p>--%>
    <%--                                <c:forEach var="i" begin="1" end="${recipe.level}">&#9733; </c:forEach></li>--%>
    <%--                            <c:choose>--%>
    <%--                                <c:when test="${recipe.kcal != 0}">--%>
    <%--                                    <li class="list-group-item"><p style="font-weight: bolder">--%>
    <%--                                        Kaloryczność:</p>${recipe.kcal} kcal--%>
    <%--                                    </li>--%>
    <%--                                </c:when>--%>
    <%--                                <c:otherwise>--%>
    <%--                                    <li class="list-group-item" style="font-weight: bold"><p--%>
    <%--                                            style="font-weight: bolder">Kaloryczność:</p>--%>
    <%--                                        <div style="font-style: italic">Nie określono kaloryczności--%>
    <%--                                            przepisu--%>
    <%--                                        </div>--%>
    <%--                                    </li>--%>
    <%--                                </c:otherwise>--%>
    <%--                            </c:choose>--%>
    <%--                            <c:choose>--%>
    <%--                                <c:when test="${not empty recipe.time}">--%>
    <%--                                    <li class="list-group-item"><p style="font-weight: bolder">Czas--%>
    <%--                                        przygotowania:</p>${recipe.time}</li>--%>
    <%--                                </c:when>--%>
    <%--                                <c:otherwise>--%>
    <%--                                    <li class="list-group-item" style="font-weight: bold"><p--%>
    <%--                                            style="font-weight: bolder">Czas--%>
    <%--                                        przygotowania:</p>--%>
    <%--                                        <div style="font-style: italic">Nie określono czasu przygotowania--%>
    <%--                                        </div>--%>
    <%--                                    </li>--%>
    <%--                                </c:otherwise>--%>
    <%--                            </c:choose>--%>
    <%--                            <li class="list-group-item"><p style="font-weight: bolder">Rodzaj--%>
    <%--                                kuchni:</p> ${recipe.cuisine}</li>--%>
    <%--                            <li class="list-group-item"><p style="font-weight: bolder">Typ--%>
    <%--                                kuchni:</p>${recipe.type}</li>--%>
    <%--                        </ul>--%>
    <%--                        <div class="card-body">--%>
    <%--                            <button type="button" class="btn btn-primary alert-danger" data-toggle="modal"--%>
    <%--                                    data-target="#exampleModal">--%>
    <%--                                Usuń przepis--%>
    <%--                            </button>--%>

    <%--                            <a href="${contextPath}/mainPage/recipe/edit/${recipe.id}"--%>
    <%--                               class="btn btn-primary">Edytuj--%>
    <%--                                przepis</a>--%>

    <%--                            <a href="${contextPath}/mainPage/recipe/${recipe.id}"--%>
    <%--                               class="btn btn-primary alert-success ">Zobacz--%>
    <%--                                przepis</a>--%>
    <%--                        </div>--%>
    <%--                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"--%>
    <%--                             aria-labelledby="exampleModalFirst" aria-hidden="true">--%>
    <%--                            <div class="modal-dialog" role="document">--%>
    <%--                                <div class="modal-content">--%>
    <%--                                    <div class="modal-header">--%>
    <%--                                        <button type="button" class="close" data-dismiss="modal"--%>
    <%--                                                aria-label="Close">--%>
    <%--                                            <span aria-hidden="true">&times;</span>--%>
    <%--                                        </button>--%>
    <%--                                        <h5 class="modal-title" id="exampleModalFirst"--%>
    <%--                                            style="font-weight: bolder">Usuwanie</h5>--%>
    <%--                                    </div>--%>
    <%--                                    <div class="modal-body">--%>
    <%--                                        Czy na pewno chcesz usunąć przepis o nazwie: ${recipe.name} ?--%>
    <%--                                    </div>--%>
    <%--                                    <div class="modal-footer">--%>
    <%--                                        <a href="${contextPath}/mainPage" class="btn btn-secondary"--%>
    <%--                                           type="submit">Anuluj</a>--%>
    <%--                                        <a href="${contextPath}/mainPage/recipe/delete/${recipe.id}"--%>
    <%--                                           class="btn btn-secondary alert-danger" type="submit">Usuń</a>--%>
    <%--                                    </div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <br>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </c:forEach>--%>
    <%--        </div>--%>
    <%--    </div>--%>


</sec:authorize>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
