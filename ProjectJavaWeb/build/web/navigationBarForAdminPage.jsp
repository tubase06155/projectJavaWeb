

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fun English</title>
                <link href="https://upload.wikimedia.org/wikipedia/commons/2/2f/Logo_fpt_university.jpg" rel="icon">

    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <nav class="navbar navbar-collapse alert-danger">
                        <div class="container-fluid">
                            <ul class="nav navbar-nav">
                                <c:url var="listUser" value="userController">
                                    <c:param name="action" value="list"></c:param>
                                    <c:param name="page" value="1"></c:param>
                                </c:url>
                                <li><a class="text-danger " href="IndexServlet"><b>Home</b></a></li>
                            </ul>
                            <ul class="nav navbar-nav">
                                <c:url var="listUser" value="userController">
                                    <c:param name="action" value="list"></c:param>
                                    <c:param name="page" value="1"></c:param>
                                </c:url>
                                <li><a class="text-danger " href="${listUser}"><b>User</b></a></li>
                            </ul>
                            <ul class="nav navbar-nav">
                                <c:url var="listLesson" value="LessonController">
                                    <c:param name="action" value="list"></c:param>
                                    <c:param name="page" value="1"></c:param>

                                </c:url>
                                <li><a class="text-danger " href="${listLesson}"><b>Lesson</b></a></li>
                            </ul>
                            <ul class="nav navbar-nav">
                                <c:url var="listQuestion" value="QuestionController">
                                    <c:param name="action" value="list"></c:param>
                                    <c:param name="page" value="1"></c:param>

                                </c:url>
                                <li><a class="text-danger " href="${listQuestion}"><b>Question</b></a></li>
                            </ul>
                            <ul class="nav navbar-nav">
                                <c:url var="listAllResponse" value="ResponseController">
                                    <c:param name="action" value="list"></c:param>
                                </c:url>
                                <li><a class="text-danger " href="${listAllResponse}"><b>Response</b></a></li>
                            </ul>

                            <c:if test="${not empty sessionScope.theAdmin}">
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="adminPage.jsp"><span></span>Welcome ${sessionScope.theAdmin.username}</a></li>
                                                <c:url var="logout" value="LoginServlet">
                                                    <c:param name="action" value="logoutAdmin"></c:param>
                                                </c:url>
                                    <li><a href="${logout}"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                                </ul>
                            </c:if>

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </body>
</html>
