
<%@page import="dal.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            int row_count = new UserDAO().countRows();
            int maxPage = row_count / 10
                    + (row_count % 10 > 0 ? 1 : 0);
        %>
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
                        <div class="btn-toolbar">
                            <a href="createUser.jsp"><button class="btn btn-primary">New User</button></a>
                        </div>
                        <p></p>
                        <div class="well">
                            <table class="table table-striped">
                                <thead>
                                    <tr>

                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Score</th>
                                        <th>IsActive</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${users}">
                                    <tr>
                                        <c:url var="editUser" value="userController">
                                            <c:param name="action" value="editUser"></c:param>
                                            <c:param name="userID" value="${user.userID}"></c:param>
                                        </c:url>

                                        <td><a href="${editUser}">${user.username}</a></td>
                                        <td>${user.email}</td>
                                        <td>${user.score}</td>
                                        <td>${user.isActive ? "True" : "False"}</td>
                                        <td>

                                            <c:url var="resetUserPassword" value="userController">
                                                <c:param name="action" value="resetUserPassword"></c:param>
                                                <c:param name="userID" value="${user.userID}"></c:param>
                                            </c:url>
                                            <a href="${resetUserPassword}" onclick="return confirm('Do you really want to reset password to default')" class="">Reset password | </a>
                                            <c:url var="delete" value="userController">
                                                <c:param name="action" value="delete"></c:param>
                                                <c:param name="userID" value="${user.userID}"></c:param>
                                            </c:url>
                                            <c:if test="${user.isActive}">
                                                <a href="${delete}" onclick="return confirm('Do you really want to deActive this User')">DeActive </a>
                                            </c:if>
                                            <c:url var="reActive" value="userController">
                                                <c:param name="action" value="reActive"></c:param>
                                                <c:param name="userID" value="${user.userID}"></c:param>
                                            </c:url>
                                            <c:if test="${!user.isActive}">

                                                <a href="${reActive}" onclick="return confirm('Do you really want to reActive this User')">ReActive</a>
                                            </c:if>
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
                    <li class="page-item"><a class="page-link" href="userController?action=list&page=<%=(pager - 1)%>">Previous</a></li>
                        <%}%>
                        <%if (pager < maxPage) {%>
                    <li class="page-item"><a class="page-link" href="userController?action=list&page=<%=(pager + 1)%>">Next</a></li>
                        <%}%>
                </ul>
            </nav>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
