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

    <title>Utwórz konto.</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <![endif]-->
</head>
<body>
<sec:authorize access="isAuthenticated()">
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
                            <a href="${contextPath}/profile/${getActualUserId}" class="btn btn-info">Anuluj</a>
                            <button class="btn btn-info" type="submit">Edytuj informacje</button>
                        </div>
                    </form:form>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</sec:authorize>
</body>
</html>
