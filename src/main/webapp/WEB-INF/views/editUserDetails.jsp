<%--
  Created by IntelliJ IDEA.
  User: przemyslaw
  Date: 31.05.2020
  Time: 18:07
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

    <title>Edytuj dane personalne</title>

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
        <h2 class="bigpixi_head"><span>Edytuj dane</span></h2>
    </div>

    <div style="padding-bottom: 1.5%"></div>

    <div class="container">
        <table class="table table-striped">
            <tbody>
            <tr>
                <td colspan="1">
                    <form:form method="POST" modelAttribute="foundedUser" class="well form-horizontal">
                        <fieldset>
                            <div class="form-group" style="margin-right: 20%">
                                <label class="col-md-4 control-label">O sobie</label>
                                <div class="col-md-8 inputGroupContainer">
                                    <div class="input-group"><span class="input-group-addon"><i
                                            class="glyphicon glyphicon-user"></i></span>
                                        <form:input type="text" path="about" class="form-control"
                                                    placeholder="Napisz coś o sobie"
                                                    autofocus="true"></form:input></div>
                                </div>
                            </div>
                            <div class="form-group" style="margin-right: 20%">
                                <label class="col-md-4 control-label">Kontakt</label>
                                <div class="col-md-8 inputGroupContainer">
                                    <div class="input-group"><span class="input-group-addon"><i
                                            class="glyphicon glyphicon-earphone"></i></span>
                                        <form:input type="text" path="contact" class="form-control"
                                                    placeholder="Wpisz kontakt do siebie"
                                                    autofocus="true"></form:input></div>
                                </div>
                            </div>
                            <div class="form-group" style="margin-right: 20%">
                                <label class="col-md-4 control-label">Ulubiona kuchnia</label>
                                <div class="col-md-8 inputGroupContainer">
                                    <div class="input-group"><span class="input-group-addon"><i
                                            class="glyphicon glyphicon-list"></i></span>
                                        <form:input type="text" path="favouriteKitchen" class="form-control"
                                                    placeholder="Ulubiony rodzaj kuchni"
                                                    autofocus="true"></form:input></div>
                                </div>
                            </div>
                        </fieldset>

                        <div class="form-group-sm extra-margin-top" style="margin-left: 40%">
                            <a href="${contextPath}/profile/${getActualUserId}"
                               class="btn btn-info btn-color">Anuluj</a>
                            <button class="btn btn-info btn-color" type="submit">Edytuj informacje</button>
                        </div>
                    </form:form>
                </td>
            </tr>
            </tbody>
        </table>
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
</body>
</html>
