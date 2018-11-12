<%-- 
    Document   : header
    Created on : Nov 7, 2018, 10:14:12 AM
    Author     : Anh Tu
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fun English</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://upload.wikimedia.org/wikipedia/commons/2/2f/Logo_fpt_university.jpg" rel="icon">

    </head>
    <body>
        <section id="header">
            <div class="container">
            <div class="row justify-content-md-center">
                <div class="col col-sm-4 res">
                    <a href="IndexServlet">
                        <!-- <img src="logo.jpg" class="logo" alt="logo" /> -->
                        <img src="images/logo.jpg " class="imageimg-responsive" />
                    </a>
                    <!-- paper -->
                </div>
                <div class=" col col-sm-4 ">
                    <ul class="pager res" style="box-sizing: border-box;padding-top:5% ; font-size :13px; font-family: 'Lucida Sans'">
                      
                    </ul>
                </div>
                <!-- <p class="hashtag" style="font-size: 20px">&nbsp&nbsp#Kiều Anh và 7 chú lùn&nbsp&nbsp</p> -->
                <div class=" col-sm-4 res" style="box-sizing: border-box;padding-top:1.3%">
                   
               
                    
                     <form action="LessonController">
                            <input type="text" class="search-query form-control" placeholder="Search Lesson" name="searchText" style="width: 100%"  value="${searchText}"/>
                               
                            <input type="hidden" name="action" value="search"/>
                            <input type="hidden" name="page" value="1"/>
                        </form>
               
                    <br/>
                    
                   <h3 class="text-right">Fun English</h3>
                            <p class="text-right">Learn English easily and fun</p>
           
                </div>
            </div>
        </div>
        </section>
    </body>
</html>
