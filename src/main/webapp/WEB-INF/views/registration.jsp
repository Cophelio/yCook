<%--
  Created by IntelliJ IDEA.
  User: przemyslaw
  Date: 18.05.2020
  Time: 18:25
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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <!--Custom styles-->
    <link rel="stylesheet" type="text/css" href="../../../resources/css/registration.css">
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card">
            <div class="card-header">
                <h3>Stwórz konto</h3>
            </div>
            <div class="card-body">
                <form:form method="POST" modelAttribute="userForm">

                    <spring:bind path="username">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text ${status.error ? 'has-error' : ''}">
                                <i class="fas fa-user"></i></span>
                            </div>
                            <form:input type="text" path="username" name="username" class="form-control"
                                        placeholder="Nazwa użytkownika"></form:input><form:errors
                                path="username" cssStyle="color: orangered"></form:errors>
                        </div>
                    </spring:bind>

                    <spring:bind path="password">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text ${status.error ? 'has-error' : ''}"><i
                                        class="fas fa-key"></i></span>
                            </div>
                            <form:input type="password" path="password" class="form-control"
                                        placeholder="Hasło"></form:input>
                        </div>
                        <c:if test="${status.error}">
                            <div style="margin-top: -4.5%; margin-bottom: 4%">
                                <form:errors
                                        path="password" cssStyle="color: orangered"></form:errors>
                            </div>
                        </c:if>
                    </spring:bind>

                    <spring:bind path="passwordConfirm">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text ${status.error ? 'has-error' : ''}"><i
                                        class="fas fa-key"></i></span>
                            </div>
                            <form:input type="password" path="passwordConfirm" class="form-control"
                                        placeholder="Potwierdź swoje hasło"></form:input>
                        </div>
                        <c:if test="${status.error}">
                            <div style="margin-top: -4.5%; margin-bottom: 4%">
                                <form:errors
                                        path="passwordConfirm" cssStyle="color: orangered"></form:errors>
                            </div>
                        </c:if>
                    </spring:bind>

                    <div class="form-group" style="padding-top: 5%">
                        <input type="submit" value="Zarejestruj" class="btn float-right register_btn">
                    </div>
                </form:form>
            </div>
            <div class="card-footer">
                <div class="d-flex justify-content-center links">
                    Powrót do strony <a href="${contextPath}/login" style="color: #FFC312">logowania</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
