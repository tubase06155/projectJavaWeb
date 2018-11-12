<%-- 
    Document   : resultPage
    Created on : Nov 11, 2018, 10:07:59 AM
    Author     : Anh Tu
--%>
<%@page import="dal.LessonDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search lesson</title>
                <link href="https://upload.wikimedia.org/wikipedia/commons/2/2f/Logo_fpt_university.jpg" rel="icon">

        <%

            String paging = request.getParameter("page");
            paging = (paging != null) ? paging : "1";
            int pager = 1;
            try {
                pager = Integer.parseInt(paging);
            } catch (Exception e) {

            }
            int maxPage = (request.getAttribute("maxPage") != null) ? Integer.parseInt(request.getAttribute("maxPage").toString()) : 1;
            String searchText = request.getParameter("searchText");
        %>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="navigationBar.jsp"></jsp:include>

       



        <c:if test="${countResult == 0}" >
            <c:if test="${empty error}">
                <p style="color:red" class="text-center">No result found</p>
            </c:if>
            <c:if test="${not empty error}">
                <p style="color:red" class="text-center">${error}</p>

            </c:if>
        </c:if>
        <c:if test="${countResult !=0 }" >
            <div class="container text-center" style="margin-top: 30px">
                <div class="row">
                    <div class="col-lg-12" >
                        <div class="container">
                            <div class="row">
                                <c:forEach var="lesson" items="${lessons}">
                                    <div class="col-md-4" style="margin: 0px">
                                        <div class="img-wrap"><img style="max-height:150px; max-width:100%" src="images/lessonImage/${lesson.imagePath}" class="img-thumbnail"></div>
                                        <h4><a href="#" class="alert-link">${lesson.title}</a></h4>
                                            <c:if test="${lesson.category == 1}">
                                            <p class="alert-danger"> Reading</p>
                                        </c:if>
                                        <c:if test="${lesson.category == 2}">
                                            <p class="alert-danger"> Listening</p>
                                        </c:if>
                                        <c:if test="${lesson.category == 3}">
                                            <p class="alert-danger"> Grammar</p>
                                        </c:if>
                                        <div class="alert-success">Difficulty: ${lesson.difficulty}</div>
                                        <p></p>

                                        <c:url var="learn" value="LessonController">
                                            <c:param name="action" value="learn"></c:param>
                                            <c:param name="lessonID" value="${lesson.lessonID}"></c:param>
                                        </c:url>
                                        <a href="${learn}" class="btn btn-sm btn-primary float-right">Learn now</a>	
                                        <p></p>
                                    </div> <!-- col // -->
                                </c:forEach>

                            </div> 
                            <!--container.//-->
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <div class="container">
            <nav aria-label="Page navigation example" style="float:right">
                <ul class="pagination">
                    <%if (pager > 1) {%>        
                    <li class="page-item"><a class="page-link" href="LessonController?searchText=<%=searchText%>&action=search&page=<%=(pager - 1)%>">Previous</a></li>
                        <%}%>
                        <%if (pager < maxPage) {%>
                    <li class="page-item"><a class="page-link" href="LessonController?searchText=<%=searchText%>&action=search&page=<%=(pager + 1)%>">Next</a></li>
                        <%}%>
                </ul>
            </nav>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
