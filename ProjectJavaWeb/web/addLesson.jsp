<%-- 
    Document   : addLesson
    Created on : Nov 11, 2018, 7:29:28 AM
    Author     : Anh Tu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://upload.wikimedia.org/wikipedia/commons/2/2f/Logo_fpt_university.jpg" rel="icon">

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="navigationBarForAdminPage.jsp"></jsp:include>
            <div class="btn-toolbar" style="margin-left: 400px">
            <c:url var="back" value="LessonController">
                <c:param name="action" value="list"></c:param>
            </c:url>
            <a href="${back}"><button class="btn btn-danger">Back to Lesson List</button></a>
        </div>
        <p></p>

        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <!-- <%=request.getContextPath()%>/uploadFile2 -->
                    <form class="form-horizontal" action="<%=request.getContextPath()%>/uploadFile" method="post" enctype="multipart/form-data">
                        <fieldset>

                            <!-- Form Name -->
                            <legend>Add lesson</legend>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="textinput">Title</label>
                                <div class="col-sm-10">
                                    <input type="text" placeholder="Lesson Title" class="form-control" name="title">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Category</label>
                                <div class="col-sm-10">
                                    <input type="radio" name="category" value="1" checked>Reading
                                    <input type="radio" name="category" value="2">Listening
                                    <input type="radio" name="category" value="3">Grammar
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Difficulty</label>
                                <div class="col-sm-10">
                                    <input type="radio" name="difficulty" value="1" checked>1 
                                    <input type="radio" name="difficulty" value="2">2 
                                    <input type="radio" name="difficulty" value="3">3 
                                    <input type="radio" name="difficulty" value="4">4 
                                    <input type="radio" name="difficulty" value="5">5
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-sm-2 control-label" >ImageUpload</label>
                                <div class="col-sm-4">
                                    <input type="file" name="image">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" >AdioUpload</label>
                                <div class="col-sm-4">
                                    <input type="file" name="audio" >
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Content</label>
                                <div class="col-sm-10">
                                    <textarea cols="70" rows="20" name="content"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="pull-right">
                                        <input type="hidden" name="addLesson" value="addLesson">
                                        <input type="submit" value="ADD" onclick="return confirm('Do you really want to add this Lesson')" class="btn btn-primary">
                                    </div>
                                </div>
                            </div>

                        </fieldset>
                    </form>

                </div>
            </div>

            <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
