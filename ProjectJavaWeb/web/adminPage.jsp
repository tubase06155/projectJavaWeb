

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="/bootstrap/customCSS.css" rel="stylesheet">
                <link href="https://upload.wikimedia.org/wikipedia/commons/2/2f/Logo_fpt_university.jpg" rel="icon">

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="navigationBarForAdminPage.jsp"></jsp:include>
        
        <div class="container">
            <div class="row">
                <div class="col-xs-6" >
                    <div class="service-single text-center wow fadeInDown" data-wow-delay="0.2s">
                        <div class="box-top">
                            <i class="fa fa-windows"></i>
                            <h3>User Management</h3>
                        </div>
                        <div class="box-down">
                        <c:url var="listAllUser" value="userController">
                            <c:param name="action" value="list"></c:param>
                            <c:param name="page" value="1"></c:param>
                        </c:url>
                            <div class="alert-success"><a href="${listAllUser}" class="btn btn-holly">Go to management page</a></div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-6" >
                    <div class="service-single text-center wow fadeInDown" data-wow-delay="0.4s">
                        <div class="box-top">
                            <i class="fa fa-apple"></i>
                            <h3>Lesson Management</h3>
                        </div>
                        <div class="box-down">
                            <c:url var="listAllLesson" value="LessonController">
                                <c:param name="action" value="list"></c:param>
                            </c:url>
                            <div class="alert-success"><a href="${listAllLesson}" class="btn btn-holly">Go to management page</a></div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-6 " >
                    <div class="service-single text-center wow fadeInDown" data-wow-delay="0.6s">
                        <div class="box-top">
                            <i class="fa fa-android"></i>
                            <h3>Question Management</h3>
                        </div>
                        <div class="box-down">
                            <c:url var="listAllQuestion" value="QuestionController">
                                <c:param name="action" value="list"></c:param>
                                <c:param name="page" value="1"></c:param>
                            </c:url>
                            <div class="alert-success"><a href="${listAllQuestion}" class="btn btn-holly">Goto management page</a></div>
                        </div>
                    </div>
                </div>
                
                <div class="col-xs-6" >
                    <div class="service-single text-center wow fadeInDown" data-wow-delay="0.6s">
                        <div class="box-top">
                            <i class="fa fa-android"></i>
                            <h3>View User Response</h3>
                        </div>
                        <div class="box-down">
                            <c:url var="listAllResponse" value="ResponseController">
                                <c:param name="action" value="list"></c:param>
                            </c:url>
                            <div class="alert-success"><a href="${listAllResponse}" class="btn btn-holly">View</a></div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
