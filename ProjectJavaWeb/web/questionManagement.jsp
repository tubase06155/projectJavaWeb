<%-- 
    Document   : questionManagement
    Created on : Nov 10, 2018, 11:23:01 PM
    Author     : Anh Tu
--%>
<%@page import="dal.QuestionDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link href="https://upload.wikimedia.org/wikipedia/commons/2/2f/Logo_fpt_university.jpg" rel="icon">

        <%

            String paging = request.getParameter("page");
            paging = (paging != null) ? paging : "1";
            int pager = 1;
            try {
                pager = Integer.parseInt(paging);
            } catch (Exception e) {

            }

            int row_count = new QuestionDAO().countRows();
            int maxPage = row_count / 10
                    + (row_count % 10 > 0 ? 1 : 0);
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
                                        <th>#</th>
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
                                        <td> <a href="${edit}" ><%=++count + (pager -1 ) * 10%></a></td>
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

        <div class="container">
            <nav aria-label="Page navigation example" style="float:right">
                <ul class="pagination">
                    <%if (pager > 1) {%>
                    <li class="page-item"><a class="page-link" href="QuestionController?action=list&page=<%=(pager - 1)%>">Previous</a></li>
                        <%}%>
                        <%if (pager < maxPage) {%>
                    <li class="page-item"><a class="page-link" href="QuestionController?action=list&page=<%=(pager + 1)%>">Next</a></li>
                        <%}%>
                </ul>
            </nav>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
