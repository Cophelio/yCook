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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<sec:authorize access="isAuthenticated()">
    <div class="container">

        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>

            <h2>Witaj ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Wyloguj
                się</a></h2>

            <br>
            <h3><a href="${contextPath}/mainPage/recipe/add">Dodaj przepis!</a></h3>
        </c:if>
        <br>
        <h2>Lista przepisów</h2>
    </div>

    <br>
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <c:forEach items="${allRecipes}" var="recipe">
                    <c:if test="${recipe.id % 2 != 0}">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" style="font-weight: bolder">${recipe.name}</h4>
                                <img class="card-img-top" src="" alt="Grafika">
                                <c:choose>
                                    <c:when test="${recipe.recommend == true}">
                                        <p class="card-text" style="font-weight: bolder">Polecane przez kucharza!</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p></p>
                                    </c:otherwise>
                                </c:choose>
                                <ul class="list-group list-group-flush" style="width: 35rem;">
                                    <li class="list-group-item"><p style="font-weight: bolder">Poziom
                                        trudności:</p>
                                        <c:forEach var="i" begin="1" end="${recipe.level}">&#9733; </c:forEach></li>
                                    <li class="list-group-item"><p style="font-weight: bolder">
                                        Kaloryczność:</p> ${recipe.kcal}</li>
                                    <li class="list-group-item"><p style="font-weight: bolder">Czas
                                        zrobienia:</p> ${recipe.time}</li>
                                    <li class="list-group-item"><p style="font-weight: bolder">Rodzaj
                                        kuchni:</p> ${recipe.cuisine}</li>
                                    <li class="list-group-item"><p style="font-weight: bolder">Typ
                                        kuchni:</p>${recipe.type}</li>
                                    <li class="list-group-item"><p style="font-weight: bolder">
                                        Składniki:</p>${recipe.ingredients}</li>
                                    <li class="list-group-item"><p style="font-weight: bolder">Opis
                                        przygotowania:</p>${recipe.description}</li>
                                </ul>
                                <div class="card-body">
                                    <button type="button" class="btn btn-primary alert-danger" data-toggle="modal"
                                            data-target="#exampleModal">
                                        Usuń przepis
                                    </button>

                                    <a href="${contextPath}/mainPage/recipe/edit/${recipe.id}" class="btn btn-primary">Edytuj
                                        przepis</a>
                                </div>
                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                     aria-labelledby="exampleModalFirst" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                                <h5 class="modal-title" id="exampleModalFirst"
                                                    style="font-weight: bolder">Usuwanie</h5>
                                            </div>
                                            <div class="modal-body">
                                                Czy na pewno chcesz usunąć przepis o nazwie: ${recipe.name} ?
                                            </div>
                                            <div class="modal-footer">
                                                <a href="${contextPath}/mainPage" class="btn btn-secondary"
                                                   type="submit">Anuluj</a>
                                                <a href="${contextPath}/mainPage/recipe/delete/${recipe.id}"
                                                   class="btn btn-secondary alert-danger" type="submit">Usuń</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>

            <div class="col-sm-6">
                <c:forEach items="${allRecipes}" var="recipe">
                    <c:if test="${recipe.id % 2 == 0}">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" style="font-weight: bolder">${recipe.name}</h4>
                                <img class="card-img-top" src="" alt="Grafika">
                                <c:choose>
                                    <c:when test="${recipe.recommend == true}">
                                        <p class="card-text" style="font-weight: bolder">Polecane przez kucharza!</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p></p>
                                    </c:otherwise>
                                </c:choose>
                                <ul class="list-group list-group-flush" style="width: 35rem;">
                                    <li class="list-group-item"><p style="font-weight: bolder">Poziom
                                        trudności:</p>
                                        <c:forEach var="i" begin="1" end="${recipe.level}">&#9733; </c:forEach></li>
                                    <li class="list-group-item"><p style="font-weight: bolder">
                                        Kaloryczność:</p> ${recipe.kcal}</li>
                                    <li class="list-group-item"><p style="font-weight: bolder">Czas
                                        zrobienia:</p> ${recipe.time}</li>
                                    <li class="list-group-item"><p style="font-weight: bolder">Rodzaj
                                        kuchni:</p> ${recipe.cuisine}</li>
                                    <li class="list-group-item"><p style="font-weight: bolder">Typ
                                        kuchni:</p>${recipe.type}</li>
                                    <li class="list-group-item"><p style="font-weight: bolder">
                                        Składniki:</p>${recipe.ingredients}</li>
                                    <li class="list-group-item"><p style="font-weight: bolder">Opis
                                        przygotowania:</p>${recipe.description}</li>
                                </ul>
                                <div class="card-body">
                                    <button type="button" class="btn btn-primary alert-danger" data-toggle="modal"
                                            data-target="#exampleModal">
                                        Usuń przepis
                                    </button>

                                    <a href="${contextPath}/mainPage/recipe/edit/${recipe.id}" class="btn btn-primary ">Edytuj
                                        przepis</a>
                                </div>
                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                     aria-labelledby="exampleModalSecond" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                                <h5 class="modal-title" id="exampleModalSecond"
                                                    style="font-weight: bolder">Usuwanie</h5>
                                            </div>
                                            <div class="modal-body">
                                                Czy na pewno chcesz usunąć przepis o nazwie: ${recipe.name} ?
                                            </div>
                                            <div class="modal-footer">
                                                <a href="${contextPath}/mainPage" class="btn btn-secondary"
                                                   type="submit">Anuluj</a>
                                                <a href="${contextPath}/mainPage/recipe/delete/${recipe.id}"
                                                   class="btn btn-secondary alert-danger" type="submit">Usuń</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</sec:authorize>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
