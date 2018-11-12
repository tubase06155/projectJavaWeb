<%-- 
    Document   : lessonManagement
    Created on : Nov 11, 2018, 7:10:48 AM
    Author     : Anh Tu
--%>
<%@page import="dal.LessonDAO"%>
<%@page import="entity.Lesson"%>
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

            int row_count = new LessonDAO().countRows();
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

                        <div class="btn-toolbar">
                            <a href="addLesson.jsp"><button class="btn btn-primary">New Lesson</button></a>
                        </div>
                        <p></p>
                        <div class="well">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th style="width: 450px">Title</th>
                                        <th>Category</th>
                                        <th>Difficulty</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="lesson" items="${lessons}" >
                                    <tr>
                                        <c:url var="editLesson" value="LessonController">
                                            <c:param name="action" value="editLesson"></c:param>
                                            <c:param name="lessonID" value="${lesson.lessonID}"></c:param>
                                        </c:url>

                                        <td>  <a href="${editLesson}" > <%=++count + (pager -1 ) * 10%></a></td>
                                        
                                         <c:url var="listQuestionByLesson" value="QuestionController">
                                            <c:param name="action" value="listByLessonID"></c:param>
                                            <c:param name="lessonID" value="${lesson.lessonID}"></c:param>
                                        </c:url>

                                        
                                        <td> <a href="${listQuestionByLesson}" >${lesson.title}</a></td>
                                        <c:if test="${lesson.category == 1}">
                                            <td>Reading</td>
                                        </c:if>
                                        <c:if test="${lesson.category == 2}">
                                            <td>Listening</td>
                                        </c:if>
                                        <c:if test="${lesson.category == 3}">
                                            <td>Grammar</td>
                                        </c:if>
                                        <td>${lesson.difficulty}</td>

                                        <td>

                                            <c:url var="addQuestion" value="addQuestion.jsp">
                                                <c:param name="lessonID" value="${lesson.lessonID}"></c:param>
                                            </c:url>
                                            <a href="${addQuestion}" class="">Add question | </a>
                                            <c:url var="delete" value="LessonController">
                                                <c:param name="action" value="delete"></c:param>
                                                <c:param name="lessonID" value="${lesson.lessonID}"></c:param>
                                            </c:url>
                                            <a href="${delete}" onclick="return confirm('Do you really want to delete this Lesson')" >Delete</a>
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
                    <li class="page-item"><a class="page-link" href="LessonController?action=list&page=<%=(pager - 1)%>">Previous</a></li>
                        <%}%>
                        <%if (pager < maxPage) {%>
                    <li class="page-item"><a class="page-link" href="LessonController?action=list&page=<%=(pager + 1)%>">Next</a></li>
                        <%}%>
                </ul>
            </nav>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
