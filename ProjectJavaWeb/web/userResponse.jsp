
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <c:if test="${not empty responseSuccessfully}" >
                <p class="text-center" style="color: green">Response successfully</p>
            </c:if>
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Write your opinion</h3>
                        </div>
                        <div class="panel-body">
                            <form action="ResponseController" accept-charset="UTF-8" role="form">
                                <div class="form-group">
                                    <input class="form-control" placeholder="Your name"  type="text" name="name">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Email"  type="text" name="email">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Title"  type="text" name="title">
                                </div>
                                <div class="form-group">
                                    <textarea rows="10" cols="42" placeholder="Write your response here" name="content"></textarea>
                                </div>
                                <input type="hidden" name="action" value="submitResponse" />
                                <input onclick="return confirm('Do you really want to do this action')" class="btn btn-lg btn-success btn-block" type="submit" value="Send">
                            </form>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
