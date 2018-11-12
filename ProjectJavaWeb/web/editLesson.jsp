
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
                    <c:if test="${not empty updateLessonSuccesfully}">
                        <p class="text-center" style="color: green">Update successfully</p>
                    </c:if>
                    <form class="form-horizontal" action="LessonController" method="post">
                        <fieldset>
                            <!-- Form Name -->
                            <legend>Edit lesson</legend>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="textinput">Title</label>
                                <div class="col-sm-10">
                                    <input type="text" value="${lesson.title}" class="form-control" name="title">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Category</label>
                                <div class="col-sm-10">
                                    <input type="radio" name="category" value="1" ${lesson.category==1?"checked":""}>Reading
                                    <input type="radio" name="category" value="2" ${lesson.category==2?"checked":""}>Listening
                                    <input type="radio" name="category" value="3" ${lesson.category==3?"checked":""}>Grammar
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Difficulty</label>
                                <div class="col-sm-10">
                                    <input type="radio" name="difficulty" value="1" ${lesson.difficulty==1?"checked":""}>1 
                                    <input type="radio" name="difficulty" value="2" ${lesson.difficulty==2?"checked":""}>2 
                                    <input type="radio" name="difficulty" value="3" ${lesson.difficulty==3?"checked":""}>3 
                                    <input type="radio" name="difficulty" value="4" ${lesson.difficulty==4?"checked":""}>4 
                                    <input type="radio" name="difficulty" value="5" ${lesson.difficulty==5?"checked":""}>5
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Content</label>
                                <div class="col-sm-10">
                                    <textarea cols="70" rows="20" name="content">${lesson.content}</textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="pull-right">
                                        <input type="hidden" name="lessonID" value="${lesson.lessonID}">
                                        <input type="hidden" name="action" value="updateLesson">
                                        <input type="submit" value="UPDATE" onclick="return confirm('Do you really want to do this action')" class="btn btn-primary">
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
