<%-- 
    Document   : navigatorBar
    Created on : Nov 7, 2018, 8:56:22 PM
    Author     : Anh Tu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://upload.wikimedia.org/wikipedia/commons/2/2f/Logo_fpt_university.jpg" rel="icon">

    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <nav class="navbar navbar-collapse alert-danger">
                        <div class="container-fluid">
                            <ul class="nav navbar-nav">
                                <c:url var="backHome" value="IndexServlet">

                                </c:url>
                                <li><a class="text-danger " href="${backHome}"><b>Home</b></a></li>
                                <!-- reading -->
                                <c:url var="reading" value="LessonController">
                                    <c:param name="action" value="category"></c:param>
                                    <c:param name="category" value="1"></c:param>
                                    <c:param name="page" value="1"></c:param>
                                </c:url>
                                <li ><a class="text-danger" href="${reading}"><b>Reading</b></a></li>
                                <!-- listening -->
                                <c:url var="listening" value="LessonController">
                                    <c:param name="action" value="category"></c:param>
                                    <c:param name="category" value="2"></c:param>
                                    <c:param name="page" value="1"></c:param>

                                </c:url>
                                <li><a class="text-danger" href="${listening}"><b>Listening</b></a></li>

                                <!-- grammar =3--> 
                                <c:url var="grammar" value="LessonController">
                                    <c:param name="action" value="category"></c:param>
                                    <c:param name="category" value="3"></c:param>
                                    <c:param name="page" value="1"></c:param>

                                </c:url>
                                <li><a class="text-danger" href="${grammar}"><b>Grammar</b></a></li>

                                <li><a class="text-danger" href="userResponse.jsp"><b>Response</b></a></li>

                            </ul>
                            <c:if test="${not empty sessionScope.theUser && empty sessionScope.theAdmin}">
                                <ul class="nav navbar-nav navbar-right">
                                    <c:url var="userInfo" value="userController">
                                        <c:param name="action" value="getUserInfo"></c:param>
                                        <c:param name="userID" value="${sessionScope.theUser.userID}"></c:param>
                                    </c:url>
                                    <li><a href="${userInfo}"><span></span>Welcome ${sessionScope.theUser.username}</a></li>
                                                <c:url var="logout" value="LoginServlet">
                                                    <c:param name="action" value="logout"></c:param>
                                                </c:url>
                                    <li><a href="${logout}"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                                </ul>
                            </c:if>
                            <c:if test="${not empty sessionScope.theAdmin }">
                                <ul class="nav navbar-nav navbar-right">

                                    <li><a href="adminPage.jsp"><span></span>Back to Admin page</a></li>
                                    <li><a href="#"><span></span>Welcome ${sessionScope.theAdmin.username}</a></li>
                                                <c:url var="logout" value="LoginServlet">
                                                    <c:param name="action" value="logoutAdmin"></c:param>
                                                </c:url>
                                    <li><a href="${logout}"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                                </ul>
                            </c:if>

                            <c:if test="${ empty sessionScope.theUser && empty sessionScope.theAdmin}">
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                    <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                                </ul>
                            </c:if>


                        </div>
                    </nav>
                </div>
            </div>
        </div>    </body>
</html>
