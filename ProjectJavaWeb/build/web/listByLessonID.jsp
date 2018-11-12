<%-- 
    Document   : listByLessonID
    Created on : Nov 11, 2018, 2:39:36 PM
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

        <%
        int count = 0;
        
        %>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="navigationBarForAdminPage.jsp"></jsp:include>    
            <div class="container" >
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">

                        <div class="btn-toolbar">
                            <a href="adminPage.jsp"><button class="btn btn-danger">Back to Admin Page</button></a>
                        </div>
                        <p></p>

                        <p></p>
                        <div class="well">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Lesson</th>
                                        <th>Content</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="question" items="${questions}">  
                                    <tr>   
                                        <c:url var="edit" value="QuestionController">
                                            <c:param name="action" value="edit"></c:param>
                                            <c:param name="questionID" value="${question.questionID}"></c:param>
                                        </c:url>
                                        <td> <a href="${edit}" ><%=++count%></a></td>
                                        <td>${question.getLesson().title}</td>
                                        <td>${question.content}</td>
                                        <td>


                                            <c:url var="delete" value="QuestionController">
                                                <c:param name="action" value="delete"></c:param>
                                                <c:param name="questionID" value="${question.questionID}"></c:param>
                                            </c:url>
                                            <a href="${delete}" onclick="return confirm('Do you really want to delete this question')">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
