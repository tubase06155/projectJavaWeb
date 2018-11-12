<%-- 
    Document   : index.jsp
    Created on : Nov 6, 2018, 12:01:23 PM
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
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="navigationBar.jsp"></jsp:include>





            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <h3 class="alert-success">New lesson: </h3>
                    </div>
                    <div class="col-lg-4 col-lg-offset-4">
                    <c:url var="checkRank" value="userController">
                        <c:param name="action" value="checkRank"></c:param>
                    </c:url>
                    <h3><a href="${checkRank}"><button class="btn-danger">Click here to check rank</button></a></h3>
                </div>

            </div>
        </div>
        <div class="container text-center" style="margin-top: 30px">
            <div class="row">
                <div class="col-lg-12" >
                    <div class="container">
                        <div class="row">
                            <!-- compact item -->

                            <c:forEach var="item" items="${initLessons}">
                                <div class="col-md-4" style="margin: 0px">
                                    <div class="img-wrap"><img style="max-height:150px; max-width:100%" src="images/lessonImage/${item.imagePath}" class="img-responsive img-thumbnail card-img-top" ></div>
                                    <h4 class="hightlight">${item.title}</h4>
                                    <c:if test="${item.category == 1}">
                                        <p class="alert-danger"> Reading</p>
                                    </c:if>
                                    <c:if test="${item.category == 2}">
                                        <p class="alert-danger"> Listening</p>
                                    </c:if>
                                    <c:if test="${item.category == 3}">
                                        <p class="alert-danger"> Grammar</p>
                                    </c:if>
                                    <div class="alert-success">Difficulty: ${item.difficulty}</div>
                                    <p></p>

                                    <c:url var="learn" value="LessonController">
                                        <c:param name="action" value="learn"></c:param>
                                        <c:param name="lessonID" value="${item.lessonID}"></c:param>
                                    </c:url>
                                    <a href="${learn}" class="btn btn-sm btn-primary ">Learn now</a>	
                                    <p></p>
                                </div> <!-- col // -->
                            </c:forEach>
                        </div> 
                        <!--container.//-->
                    </div>
                </div>
            </div>




            <jsp:include page="footer.jsp"></jsp:include>


    </body>
</html>
