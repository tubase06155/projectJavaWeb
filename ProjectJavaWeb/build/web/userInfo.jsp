<%-- 
    Document   : userInfo
    Created on : Nov 10, 2018, 8:42:00 PM
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
                    <div class="panel panel-default">
                        <div class="panel-heading">  <h4 >User Profile</h4></div>
                        <div class="panel-body">
                            <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4">
                                <img alt="User Pic" src="images/userImage/default-user-image.png" id="profile-image1" class="img-circle img-responsive"> 


                            </div>
                            <div class="col-md-8 col-xs-12 col-sm-6 col-lg-8" >
                                <div class="container" >
                                    <h2>${theUser.username}</h2>
                                <p>an   <b> User</b></p>


                            </div>
                            <hr>
                            <ul class="container details" >
                                <li><p><span class="glyphicon glyphicon-arrow-right  one" style="width:50px;"></span>Score: <b>${theUser.score}</b></p></li>
                                <li><p><span class="glyphicon glyphicon-arrow-right" style="width:50px;"></span>Email: <b>${theUser.email}</b></p></li>
                            </ul>
                            <hr>
                    
                            <div class="col-sm-5 col-xs-6 tital " ><a href="changePassword.jsp?userID=${theUser.userID}" class="btn btn-danger">Change password</a></div>
                        </div>   

                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>



    </body>
</html>
