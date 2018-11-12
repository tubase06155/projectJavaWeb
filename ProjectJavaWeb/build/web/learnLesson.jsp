

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fun English</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/customCSS.css" rel="stylesheet">
                <link href="https://upload.wikimedia.org/wikipedia/commons/2/2f/Logo_fpt_university.jpg" rel="icon">

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
                    <c:url var="doQuiz" value="QuizServlet">
                        <c:param name="action" value="doQuiz"></c:param>
                        <c:param name="lessonID" value="${lesson.lessonID}"></c:param>
                    </c:url>
                    <a href="${doQuiz}" class="btn btn-sm btn-success float-right">Do Quiz</a>	  
                    
                </div>
            </div>
        </c:if>
        <c:if test="${lesson.category == 3 }"> <!-- Grammar lesson -->
            <div class="row">
                <div class="col-lg-10 col-lg-offset-2">
                    <h2 class="text-center" style="margin-right: 30%; color: crimson; font-style: initial">${lesson.title}</h2>
                    <br>
                    <p style="max-width: 70%; font-size: 25px">${lesson.content}</p>
                    
                    <br>
                    <br>
                    <c:url var="doQuiz" value="QuizServlet">
                        <c:param name="action" value="doQuiz"></c:param>
                        <c:param name="lessonID" value="${lesson.lessonID}"></c:param>
                    </c:url>
                    <a href="${doQuiz}" class="btn btn-sm btn-success float-right">Do Quiz</a>	  
                    
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
                    <c:url var="doQuiz" value="QuizServlet">
                        <c:param name="action" value="doQuiz"></c:param>
                        <c:param name="lessonID" value="${lesson.lessonID}"></c:param>
                    </c:url>
                    <input type="button" onclick="showScript()" class="btn btn-sm btn-danger float-right" value="Show script" id="showScript">
                    <a href="${doQuiz}" class="btn btn-sm btn-success float-right">Do Quiz</a>	   
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
        <c:if test="${not empty notLogin}">
            <p class="text-center" style="color: crimson; font-family: sans-serif; font-size: 150%">You have to login first to do quiz</p>
            <p class="text-center" style="color: crimson; font-family: sans-serif; font-size: 100%">Go to <a href="login.jsp">login</a></p>
        </c:if>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
