

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/customCSS.css" rel="stylesheet">
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
                                <h3 class="panel-title">New User</h3>
                            </div>
                            <div class="panel-body">

                                <form action="userController" >
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Username"  type="text" name="username">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Email"  type="text" name="email">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Password" type="password" value="123" name="password">
                                    </div>
                                    <div class="form-group ">
                                        <input type="radio" name="type" value="1" checked="">User 
                                        <input type="radio" name="type" value="2">Admin
                                    </div>
                                    <input type="hidden" name="action" value="createUser">
                                    <input class="btn btn-lg btn-success btn-block" type="submit" value="Create" onclick="return confirm('Do you really want to create this User')">
                                </form>


                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
