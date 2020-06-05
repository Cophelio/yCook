<%--
  Created by IntelliJ IDEA.
  User: przemyslaw
  Date: 31.05.2020
  Time: 10:30
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

    <title>Profil kucharza</title>

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
                    <li><a href="${contextPath}/mainPage">Strona Główna</a></li>
                    <li><a href="${contextPath}/mainPage/recipe/add">Dodaj nowy przepis</a></li>
                    <li><a href="${contextPath}/mainPage/favorite">Lista ulubionych przepisów</a></li>
                    <li class="active"><a href="${contextPath}/profile/${userId}">Profil kucharza</a></li>
                    <li><a onclick="document.forms['logoutForm'].submit()">WYLOGUJ SIĘ</a></li>
                </ul>
            </div>
            </c:if>
        </div>
    </nav>

    <br>
    <div id="services" class="container-fluid text-center" style="margin-top: 2.5%">
        <h2 class="bigpixi_head"><span>Profil kucharza</span></h2>
    </div>

    <div style="padding-bottom: 1.5%"></div>

    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6 well form-horizontal">
                <div class="col-sm-12">
                    <h2 style="padding-bottom: 5%; font-weight: bold">${pageContext.request.userPrincipal.name}</h2>
                    <div class="col-xs-12 col-sm-8">
                        <p style="margin-bottom: 5%"><strong>O sobie: </strong>${getAbout}</p>
                        <p style="margin-bottom: 5%"><strong>Kontakt: </strong>${getContact}</p>
                        <p style="margin-bottom: 5%"><strong>Ulubiona kuchnia: </strong>
                            <span class="tags"
                                  style="margin-left: 1%; margin-bottom: 5%">${getFavoriteKitchen}</span>
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-4 text-center">
                        <p>Ilość przepisów: <strong>${numberOfRecipesByUser}</strong>
                        </p>
                        <p class="glyphicon glyphicon-star" style="color: goldenrod"><strong
                                style="margin-left: 10%">${numberOfFavoriteRecipes}</strong>
                        </p>
                    </div>
                </div>
                <div class="col-xs-12 divider text-center">
                    <div class="col-xs-12 col-sm-4 emphasis">
                        <h3><small>Edytuj informacje o sobie</small></h3>
                        <button class="btn btn-success btn-block btn-color"><span class="fa fa-plus-circle"></span><a
                                href="${contextPath}/profile/${getActualUserId}/editPersonalInformation"
                                style="color: white"> Edytuj
                        </a></button>
                    </div>
                    <div class="col-xs-12 col-sm-4 emphasis">
                        <H3><small>Zmień aktualne hasło</small></H3>
                        <button type="button" class="btn btn-info btn-block btn-color" data-toggle="modal"
                                data-target="#exampleChangePassModal">><span class="fa fa-user"></span>
                            Zmień
                        </button>

                        <div class="modal fade" id="exampleChangePassModal" tabindex="-1" role="dialog"
                             aria-labelledby="exampleChangePass" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <form method="POST"
                                          action="${contextPath}/profile/${getActualUserId}/changePassword"
                                          class="form-signin">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            <h5 class="modal-title" id="exampleChangePass"
                                                style="font-weight: bolder">Zmiana hasła</h5>
                                        </div>
                                        <div class="modal-body">
                                            <span>Wpisz nowe hasło poniżej, pamiętaj aby wpisać dokładnie takie
                                            samo w obu
                                                polach.</span>
                                            <input name="password" type="password" class="form-control"
                                                   placeholder="Hasło"/>
                                            <br>
                                            <input name="passwordConfirm" type="password"
                                                   class="form-control"
                                                   placeholder="Powtórz hasło"/>
                                        </div>
                                        <div class="modal-footer">
                                            <a href="${contextPath}/profile/${getActualUserId}"
                                               class="btn btn-secondary"
                                               type="submit">Anuluj</a>
                                            <button class="btn btn-secondary btn-color" type="submit">
                                                Zmień
                                                hasło
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 emphasis">
                        <H3><small>Powrót na stronę główną</small></H3>
                        <button class="btn btn-info btn-block btn-color"><a
                                href="${contextPath}/mainPage" style="color: white"> Powrót
                        </a></button>
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
