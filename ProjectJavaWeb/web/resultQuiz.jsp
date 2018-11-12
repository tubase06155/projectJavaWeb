<%-- 
    Document   : resultQuiz
    Created on : Nov 11, 2018, 9:21:22 AM
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

        <%
            int count = 0;
        %>
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

                <p style="width: 10%; color: red; font-size: 150%">You get ${countRightAnswer}/${numberOfQuestion} </p>


            <c:forEach var="question" items="${questions}" varStatus="status">
                <p><%=++count%>. ${question.content}</p>

                <c:if test="${ (question.rightOpt eq 1) }">
                    <div style="margin-left: 20px" class="radio">
                        <label style="color: ${userAnswers[status.index] eq question.rightOpt ? "green" : "red"};"><input type="radio" disabled ${userAnswers[status.index] eq "1" ? "checked" : ""}><bold>${question.opt1}</bold></label>
                    </div>
                </c:if>
                <c:if test="${ not (question.rightOpt eq 1) }">
                    <div style="margin-left: 20px" class="radio">
                        <label><input type="radio" disabled ${userAnswers[status.index] eq "1" ? "checked" : ""}>${question.opt1}</label>
                    </div>
                </c:if>

                <c:if test="${ (question.rightOpt eq 2) }">
                    <div style="margin-left: 20px" class="radio">
                        <label style="color: ${userAnswers[status.index] eq question.rightOpt ? "green" : "red"};"><input type="radio" disabled ${userAnswers[status.index] eq "2" ? "checked" : ""} ><bold>${question.opt2}</bold></label>
                    </div>
                </c:if>
                <c:if test="${ not (question.rightOpt eq 2) }">
                    <div style="margin-left: 20px" class="radio">
                        <label><input type="radio" disabled  ${userAnswers[status.index] eq "2" ? "checked" : ""}>${question.opt2}</label>
                    </div>
                </c:if>

                <c:if test="${ (question.rightOpt eq 3) }">
                    <div style="margin-left: 20px" class="radio">
                        <label style="color: ${userAnswers[status.index] eq question.rightOpt ? "green" : "red"};"><input type="radio" disabled ${userAnswers[status.index] eq "3" ? "checked" : ""} ><bold>${question.opt3}</bold></label>
                    </div>
                </c:if>
                <c:if test="${ not (question.rightOpt eq 3) }">
                    <div style="margin-left: 20px" class="radio">
                        <label><input type="radio" disabled ${userAnswers[status.index] eq "3" ? "checked" : ""}>${question.opt3}</label>
                    </div>
                </c:if>

                <c:if test="${ (question.rightOpt eq 4) }">
                    <div style="margin-left: 20px" class="radio">
                        <label style="color: ${userAnswers[status.index] eq question.rightOpt ? "green" : "red"};"><input type="radio" disabled ${userAnswers[status.index] eq "4" ? "checked" : ""}><bold>${question.opt4}</bold></label>
                    </div>
                </c:if>
                <c:if test="${ not (question.rightOpt eq 4) }">
                    <div style="margin-left: 20px" class="radio">
                        <label><input type="radio" disabled ${userAnswers[status.index] eq "4" ? "checked" : ""}>${question.opt4}</label>
                    </div>
                </c:if>
                <c:if test="${userAnswers[status.index] eq question.rightOpt}">
                    <p class=" btn-warning" style="width: 150px">You get 1 point more </p>

                </c:if>


            </c:forEach>  


            <br>
            <br>

            <div class="container">
                <c:url var="checkRank" value="userController">
                    <c:param name="action" value="checkRank"></c:param>
                </c:url>
                <h3><a href="${checkRank}"><button class="btn-danger">Click here to check rank</button></a></h3>
            </div>

        </div>

        <jsp:include page="footer.jsp"></jsp:include>    </body>
</html>
