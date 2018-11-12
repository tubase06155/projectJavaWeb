<%-- 
    Document   : editUser
    Created on : Nov 10, 2018, 10:16:02 PM
    Author     : Anh Tu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
                <link href="https://upload.wikimedia.org/wikipedia/commons/2/2f/Logo_fpt_university.jpg" rel="icon">

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="navigationBarForAdminPage.jsp"></jsp:include>

            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Edit User</h3>
                            </div>
                            <div class="panel-body">

                                <form action="userController" >
                                    <div class="form-group">
                                        <input class="form-control" value="${theUser.username}" disabled  type="text" name="username">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" value="${theUser.email}"  type="text" name="email">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" value="${theUser.score}"  type="text" name="score">
                                </div>
                                <div class="form-group ">

                                    <input type="radio" name="type" ${theUser.userType==1?"checked": ""} value="1">User 
                                    <input type="radio" name="type" ${theUser.userType==2?"checked": ""} value="2">Admin
                                </div>
                                <input type="hidden" name="userID" value="<%= request.getParameter("userID")%>">
                                <input type="hidden" name="action" value="editUser">
                                <input class="btn btn-lg btn-success btn-block" type="submit" value="UPDATE" onclick="return confirm('Do you really want to do this action')">
                            </form>

                        </div>
                                <c:if test="${not empty updateUserSuccess}" >
                                <p class="text-center" style="color: green">Update successfully</p>
                            </c:if>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
