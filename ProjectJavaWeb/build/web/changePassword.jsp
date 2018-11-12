<%-- 
    Document   : changePassword
    Created on : Nov 10, 2018, 8:47:22 PM
    Author     : Anh Tu
--%>

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
                    <div class="col-md-4 col-md-offset-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Change Password</h3>
                            </div>
                            <div class="panel-body">
                                <form action="userController" accept-charset="UTF-8" role="form" method="POST">
                                    <div class="form-group">
                                        <input class="form-control" placeholder="New Password" name="newPassword" type="password">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Confirm Password" name="confirmPassword" type="password" >
                                    </div>
                                    <input type="hidden" name="action" value="changePassword"/>
                                    <input type="hidden" name="userID" value="<%= request.getParameter("userID")%>" />
                                <input class="btn btn-lg btn-danger btn-block" type="submit" value="Change">
                            </form>
                        </div>
                        <c:if test="${not empty changePasswordSuccessfully}" >
                            <p class="text-center" style="color: green">${changePasswordSuccessfully}</p>
                        </c:if>

                        <c:if test="${not empty notChangePasswordSuccessfully}" >
                            <p class="text-center" style="color: red">${notChangePasswordSuccessfully}</p>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>    </body>
</html>
