

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            int maxPage = (request.getAttribute("maxPage") != null) ? Integer.parseInt(request.getAttribute("maxPage").toString()) : 1;
            String category = request.getParameter("category");
        %>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="navigationBar.jsp"></jsp:include>

            <div class="container">
                <div class="row">
                    <div id="custom-search-input">

                        <div class="col-lg-4">
                            <span style="margin-left: 20px; margin-right: 10px">Sort by: </span>
                        <c:url var="sortByName" value="LessonController">
                            <c:param name="action" value="sortByName"></c:param>
                            <c:param name="category" value="${category}"></c:param>
                        </c:url>
                        <a href="${sortByName}"><input class="btn-danger" type="button" value="Name"></a>

                        <c:url var="sortByDifficulty" value="LessonController">
                            <c:param name="action" value="sortByDifficulty"></c:param>
                            <c:param name="category" value="${category}"></c:param>
                        </c:url>
                        <a href="${sortByDifficulty}"><input class="btn-success" type="button" value="Difficulty"></a>
                    </div>


                </div>
            </div>
        </div>


        <div class="container">
        </div>

        <div class="container text-center" style="margin-top: 30px">
            <div class="row">
                <div class="col-lg-12" >
                    <div class="container">

                        <div class="row">
                            <c:forEach var="lesson" items="${lessons}">
                                <div class="col-md-4" style="margin: 0px">
                                    <div class="img-wrap"><img style="max-height:150px; max-width:100%" src="images/lessonImage/${lesson.imagePath}" class="img-thumbnail"></div>
                                    <h4><a href="#" class="alert-link">${lesson.title}</a></h4>

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

            <div class="container">
                <nav aria-label="Page navigation example" style="float:right">
                    <ul class="pagination">
                        <%if (pager > 1) {%>    

                        <li class="page-item"><a class="page-link" href="LessonController?action=category&category=<%=category%>&page=<%=(pager - 1)%>">Previous</a></li>
                            <%}%>
                            <%if (pager < maxPage) {%>
                        <li class="page-item"><a class="page-link" href="LessonController?action=category&category=<%=category%>&page=<%=(pager + 1)%>">Next</a></li>
                            <%}%>
                    </ul>
                </nav>
            </div>


            <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
