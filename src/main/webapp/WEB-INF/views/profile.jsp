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

    <title>Utwórz konto.</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<sec:authorize access="isAuthenticated()">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6">
                <div class="well profile">
                    <div class="col-sm-12">
                        <div class="col-xs-12 col-sm-8">
                            <h2 style="padding-bottom: 5%">${pageContext.request.userPrincipal.name}</h2>
                            <p style="margin-bottom: 5%"><strong>O sobie: </strong>${getAbout}</p>
                            <p style="margin-bottom: 5%"><strong>Kontakt: </strong>${getContact}</p>
                            <p style="margin-bottom: 5%"><strong>Ulubiona kuchnia: </strong>
                                <span class="tags"
                                      style="margin-left: 1%; margin-bottom: 5%">${getFavoriteKitchen}</span>
                            </p>
                        </div>
                        <div class="col-xs-12 col-sm-4 text-center">
                            <figure>
                                <img src="http://www.localcrimenews.com/wp-content/uploads/2013/07/default-user-icon-profile.png"
                                     alt="" class="img-circle img-responsive">
                                <figcaption class="ratings">
                                    <p>Ilość przepisów: <strong>${numberOfRecipesByUser}</strong>
                                    </p>
                                    <p class="glyphicon glyphicon-star" style="color: goldenrod"><strong
                                            style="margin-left: 10%">${numberOfFavoriteRecipes}</strong>
                                    </p>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                    <div class="col-xs-12 divider text-center">
                        <div class="col-xs-12 col-sm-4 emphasis">
                            <h3><small>Edytuj informacje o sobie</small></h3>
                            <button class="btn btn-success btn-block"><span class="fa fa-plus-circle"></span><a
                                    href="${contextPath}/profile/${getActualUserId}/editPersonalInformation"
                                    style="color: white"> Edytuj
                            </a></button>
                        </div>
                        <div class="col-xs-12 col-sm-4 emphasis">
                            <H3><small>Zmień aktualne hasło</small></H3>
                            <button type="button" class="btn btn-info btn-block" data-toggle="modal"
                                    data-target="#exampleChangePassModal">><span class="fa fa-user"></span> Zmień
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
                                                Wpisz nowe hasło poniżej, pamiętaj aby wpisać dokładnie takie samo w obu
                                                polach.
                                                <input name="password" type="password" class="form-control"
                                                       placeholder="Hasło"/>
                                                <input name="passwordConfirm" type="password" class="form-control"
                                                       placeholder="Powtórz hasło"/>
                                            </div>
                                            <div class="modal-footer">
                                                <a href="${contextPath}/profile/${getActualUserId}"
                                                   class="btn btn-secondary"
                                                   type="submit">Anuluj</a>
                                                <button class="btn btn-secondary alert-success" type="submit">Zmień
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
                            <button class="btn btn-info btn-block"><span class="fa fa-user"></span><a
                                    href="${contextPath}/mainPage" style="color: white"> Powrót
                            </a></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</sec:authorize>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
