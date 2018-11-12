<%-- 
    Document   : doquiz
    Created on : Nov 11, 2018, 9:15:16 AM
    Author     : Anh Tu
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link href="https://upload.wikimedia.org/wikipedia/commons/2/2f/Logo_fpt_university.jpg" rel="icon">

        <title>JSP Page</title>
        <%int count = 0;%>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="navigationBar.jsp"></jsp:include>
        <c:if test="${lesson.category == 1 }"> <!-- reading lesson -->
            <div class="row">
                <div class="col-lg-10 col-lg-offset-2">
                    <h2 class="text-center" style="margin-right: 30%; color: crimson; font-style: initial">${lesson.title}</h2>
                    <br>
                    <p style="max-width: 70%; font-size: 25px">${lesson.content}</p>

                    <br>
                    <br>

                </div>
            </div>
        </c:if>
        <c:if test="${lesson.category == 2}"> <!-- listening lesson -->

            <div class="row">
                <div class="col-lg-10 col-lg-offset-3">
                    <h2 class="text-center" style="margin-right: 80%; color: crimson;">${lesson.title}</h2>
                    <br>
                    <audio controls>
                        <source src="Audio/${lesson.audioPath}" type="audio/ogg">
                        <source src="Audio/${lesson.audioPath}" type="audio/mpeg">
                        Your browser does not support the audio element.
                    </audio>

                    <br>
                    <br>

                    <input type="button" onclick="showScript()" class="btn btn-sm btn-danger float-right" value="Show script" id="showScript">
                    <br>
                    <br>
                    <p id="script" style="max-width: 50%; font-size: 15px; display: none">${lesson.content}</p>
                    <script>
                        function showScript() {
                            var x = document.getElementById("script");
                            if (x.style.display === "none") {
                                x.style.display = "block";
                            } else {
                                x.style.display = "none";
                            }
                        }
                    </script>

                </div>
            </div>

        </c:if>

        <div class="container col-lg-offset-2"> 
            <form action="QuizServlet" method="GET">
                <c:forEach var="question" items="${questions}">
                    <p><%=++count%>. ${question.content}</p>
                    <div style="margin-left: 20px" class="radio">
                        <label><input type="radio" name="${question.questionID}" value="1" >${question.opt1}</label>
                    </div>
                    <div style="margin-left: 20px" class="radio">
                        <label><input type="radio" name="${question.questionID}" value="2" >${question.opt2}</label>
                    </div>
                    <div style="margin-left: 20px" class="radio disabled">
                        <label><input type="radio" name="${question.questionID}" value="3" >${question.opt3}</label>
                    </div>
                    <div style="margin-left: 20px" class="radio disabled">
                        <label><input type="radio" name="${question.questionID}" value="4">${question.opt4}</label>
                    </div>
                </c:forEach>  
                <input type="hidden" name="action" value="submitQuiz"/>
                <input type="hidden" name="lessonID" value="${lessonID}"/>
                <br>
                <br>
                <input onclick="return confirm('Do you really want to submit this quiz ?')" class="btn btn-sm btn-success float-right" type="submit" value="Submit">
            </form>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
