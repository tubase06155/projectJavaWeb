<%-- 
    Document   : addQuestion
    Created on : Nov 11, 2018, 7:14:02 AM
    Author     : Anh Tu
--%>
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
        <jsp:include page="header.jsp" ></jsp:include>
        <jsp:include page="navigationBarForAdminPage.jsp"></jsp:include>

            <p></p>

            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                
                    <form class="form-horizontal" action="LessonController" method="GET" >
                        <fieldset>

                            <!-- Form Name -->
                            <legend>Add Question</legend>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="textinput">Question</label>
                                <div class="col-sm-10">
                                    <input type="text" placeholder="Question" class="form-control" name="questionContent">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="textinput">Opt1</label>
                                <div class="col-sm-10">
                                    <input type="text" placeholder="Option 1" class="form-control" name="opt1">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="textinput">Opt2</label>
                                <div class="col-sm-10">
                                    <input type="text" placeholder="Option 2" class="form-control" name="opt2">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="textinput">Opt3</label>
                                <div class="col-sm-10">
                                    <input type="text" placeholder="Option 3" class="form-control" name="opt3">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="textinput">Opt4</label>
                                <div class="col-sm-10">
                                    <input type="text" placeholder="Option 4" class="form-control" name="opt4">
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Right option</label>
                                <div class="col-sm-10">
                                    <input type="radio" name="rightOpt" value="1" checked>1 
                                    <input type="radio" name="rightOpt" value="2">2 
                                    <input type="radio" name="rightOpt" value="3">3 
                                    <input type="radio" name="rightOpt" value="4">4 
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="pull-right">
                                        <input type="hidden" name="action" value="addQuestion">
                                        <input type="hidden" name="lessonID" value="<%= request.getParameter("lessonID")%>">
                                        <input type="submit" value="ADD" onclick="return confirm('Do you really want to add this question')" class="btn btn-primary">
                                    </div>
                                </div>
                            </div>

                        </fieldset>
                    </form>

                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" ></jsp:include>
    </body>
</html>
