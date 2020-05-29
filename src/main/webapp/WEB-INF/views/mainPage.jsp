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
            <div class="col-sm-3 media">
                <svg class="bi bi-file-earmark-plus" width="5em" height="5em" viewBox="0 0 16 16" fill="currentColor"
                     xmlns="http://www.w3.org/2000/svg">
                    <a href="${contextPath}/mainPage/recipe/add" xlink:title="Dodaj przepis">
                        <path d="M9 1H4a2 2 0 00-2 2v10a2 2 0 002 2h5v-1H4a1 1 0 01-1-1V3a1 1 0 011-1h5v2.5A1.5 1.5 0 0010.5 6H13v2h1V6L9 1z"/>
                        <path fill-rule="evenodd"
                              d="M13.5 10a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 010-1H13v-1.5a.5.5 0 01.5-.5z"
                              clip-rule="evenodd"/>
                        <path fill-rule="evenodd" d="M13 12.5a.5.5 0 01.5-.5h2a.5.5 0 010 1H14v1.5a.5.5 0 01-1 0v-2z"
                              clip-rule="evenodd"/>
                    </a>
                </svg>
            </div>
            <div class="col-sm-3">
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
                            <a class="dropdown-item" href="#">
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

    <br>
    <div class="container" style="padding-top: 100px">
        <div id="filter-panel" class="collapse filter-panel">
            <div class="panel panel-default">
                <div class="panel-body">
                    <form action="${contextPath}/mainPage" class="form-inline" role="form">
                            <%--                    <form:form method="GET" modelAttribute="" class="form-inline" role="form">--%>
                        <div class="form-group">
                                <%--                            <spring:bind path="name">--%>
                                <%--                                <form:input type="text" path="name" class="form-control" placeholder="Nazwa użytkownika"--%>
                                <%--                                            autofocus="true"></form:input>--%>
                                <%--                            </spring:bind>--%>
                                <%--                                                            <label class="filter-col" style="margin-right:0;" for="name">Nazwa:</label>--%>
                                <%--                                                            <input id="name" class="form-control">--%>
                            <label class="filter-col" style="margin-right:0;" for="name">Nazwa użytkownika</label>
                            <input id="name" class="form-control" type="text" name="name">
                                <%--                                <label class="filter-col" style="margin-right:0;" for="pref-perpage">Rows per page:</label>--%>
                                <%--                                <select id="pref-perpage" class="form-control">--%>
                                <%--                                    <option value="2">2</option>--%>
                                <%--                                    <option value="3">3</option>--%>
                                <%--                                    <option value="4">4</option>--%>
                                <%--                                    <option value="5">5</option>--%>
                                <%--                                    <option value="6">6</option>--%>
                                <%--                                    <option value="7">7</option>--%>
                                <%--                                    <option value="8">8</option>--%>
                                <%--                                    <option value="9">9</option>--%>
                                <%--                                    <option selected="selected" value="10">10</option>--%>
                                <%--                                    <option value="15">15</option>--%>
                                <%--                                    <option value="20">20</option>--%>
                                <%--                                    <option value="30">30</option>--%>
                                <%--                                    <option value="40">40</option>--%>
                                <%--                                    <option value="50">50</option>--%>
                                <%--                                    <option value="100">100</option>--%>
                                <%--                                    <option value="200">200</option>--%>
                                <%--                                    <option value="300">300</option>--%>
                                <%--                                    <option value="400">400</option>--%>
                                <%--                                    <option value="500">500</option>--%>
                                <%--                                    <option value="1000">1000</option>--%>
                                <%--                                </select>--%>
                                <%--                            </div> <!-- form group [rows] -->--%>
                                <%--                            <div class="form-group">--%>
                                <%--                                <label class="filter-col" style="margin-right:0;" for="pref-search">Search:</label>--%>
                                <%--                                <input type="text" class="form-control input-sm" id="pref-search">--%>
                                <%--                            </div><!-- form group [search] -->--%>
                                <%--                            <div class="form-group">--%>
                                <%--                                <label class="filter-col" style="margin-right:0;" for="pref-orderby">Order by:</label>--%>
                                <%--                                <select id="pref-orderby" class="form-control">--%>
                                <%--                                    <option>Descendent</option>--%>
                                <%--                                </select>--%>
                                <%--                            </div> <!-- form group [order by] -->--%>
                                <%--                            <div class="form-group">--%>
                                <%--                                <div class="checkbox" style="margin-left:10px; margin-right:10px;">--%>
                                <%--                                    <label><input type="checkbox"> Remember parameters</label>--%>
                                <%--                                </div>--%>
                            <button type="submit" class="btn btn-default filter-col">
                                <span class="glyphicon glyphicon-record"></span> Zastosuj filtry
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <button type="button" class="btn btn-primary pull-right" data-toggle="collapse" data-target="#filter-panel">
            <span class="glyphicon glyphicon-cog"></span> Filtruj przepisy
        </button>
    </div>

    <div class="container">
        <h3 style=" padding-top: 50px; font-weight: bolder">Lista przepisów</h3>
    </div>

    <br>
    <div class="container">
        <div class="row">
            <c:forEach items="${allRecipes}" var="recipe">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="font-weight: bolder">${recipe.name}</h4>
                            <img class="card-img-top" src="" alt="Grafika">
                            <c:choose>
                                <c:when test="${recipe.recommend == true}">
                                    <p class="card-text" style="font-weight: bolder">Polecane przez kucharza!</p>
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
                                <li class="list-group-item"><p style="font-weight: bolder">
                                    Kaloryczność:</p> ${recipe.kcal}</li>
                                <li class="list-group-item"><p style="font-weight: bolder">Czas
                                    zrobienia:</p> ${recipe.time}</li>
                                <li class="list-group-item"><p style="font-weight: bolder">Rodzaj
                                    kuchni:</p> ${recipe.cuisine}</li>
                                <li class="list-group-item"><p style="font-weight: bolder">Typ
                                    kuchni:</p>${recipe.type}</li>
                                    <%--                                    <li class="list-group-item"><p style="font-weight: bolder">--%>
                                    <%--                                        Składniki:</p>${recipe.ingredients}</li>--%>
                                    <%--                                    <li class="list-group-item"><p style="font-weight: bolder">Opis--%>
                                    <%--                                        przygotowania:</p>${recipe.description}</li>--%>
                            </ul>
                            <div class="card-body">
                                <button type="button" class="btn btn-primary alert-danger" data-toggle="modal"
                                        data-target="#exampleModal">
                                    Usuń przepis
                                </button>

                                <a href="${contextPath}/mainPage/recipe/edit/${recipe.id}" class="btn btn-primary">Edytuj
                                    przepis</a>

                                <a href="${contextPath}/mainPage/recipe/${recipe.id}"
                                   class="btn btn-primary alert-success ">Zobacz
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
                </div>
            </c:forEach>

        </div>
    </div>

    <div class="container panel-footer">
        <nav aria-label="Page navigation example">
            <ul class="pagination no-margin pull-right">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Poprzednia strona</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Następna strona</a>
                </li>
            </ul>
        </nav>
    </div>
</sec:authorize>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
