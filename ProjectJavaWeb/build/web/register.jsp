

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
                <div class="col-md-4 col-md-offset-4">
                    
                    
                            
                <c:if test="${ not empty error}">
                    <p style="color: red" class="text-center">${error}</p>
                </c:if>
                    
                <c:if test="${ not empty registerSuccessfully}">
                    <p style="color:  green" class="text-center">Register successfully, click <a href="login.jsp">here</a> to login</p>
                </c:if>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Register</h3>
                        </div>
                        <div class="panel-body">
                            <form action="userController" method="POST">
                                <div class="form-group">
                                    <input class="form-control" placeholder="Username"  type="text" name="username" value="${username}">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Email"  type="text" name="email" value="${email}">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" type="password" name="password">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Confirm your password" type="Password" name="rePassword">
                                </div>
                                <input type="hidden" name="action" value="register" />
                                <input class="btn btn-lg btn-success btn-block" type="submit" value="Sign up">
                            </form>
                        </div>
                    </div>
            
                    
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
