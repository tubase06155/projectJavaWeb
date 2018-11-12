<%-- 
    Document   : responseManagement
    Created on : Nov 11, 2018, 7:06:19 AM
    Author     : Anh Tu
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <jsp:include page="navigationBarForAdminPage.jsp"></jsp:include>

            <div class="container">
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <div class="btn-toolbar">
                            <a href="adminPage.jsp"><button class="btn btn-danger">Back to Admin Page</button></a>
                        </div>
                        <p></p>
                        <div class="well">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Title</th>
                                        <th>Content</th>

                                        <th>Contact</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="response" items="${responses}">
                                    <tr>
                                        <td>${response.name}</td>
                                        <td>${response.title}</td>
                                        <td>${response.content}</td>

                                        <td>${response.email}</td>

                                        <c:url var="delete" value="ResponseController">
                                            <c:param name="action" value="delete"></c:param>
                                            <c:param name="resID" value="${response.id}"></c:param>
                                        </c:url>
                                        <td><a onclick="return confirm('Confirm action')" href="${delete}">Delete</a></td>
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
