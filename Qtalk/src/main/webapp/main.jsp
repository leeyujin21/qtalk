<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" rel="stylesheet">
    <title>main</title>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <main class="main">

        <section class="search-section">
            <form action="#" method="post" class="search-form">
                <input type="search" name="search" class="input-search">
                <button class="search-btn"><i class="fas fa-search"></i></button>
            </form>
        </section>

        <section class="info-section">
            <div class="info-box-container">
            <div class="main-info-box">
                <div class="main-info-title">정보처리기사</div>
                <div>필기평균 합격률</div>
                <div>정보처리기사</div>
                <div>필기평균 합격률</div>
            </div>
            <div class="main-info-box slide-box">
                <div class="main-info-title">정보처리기사</div>
                <div>필기평균 합격률</div>
                <div>정보처리기사</div>
                <div>필기평균 합격률</div>
                <i class="fas fa-chevron-left icon-left"></i>
                <i class="fas fa-chevron-right icon-right"></i>
            </div>
            </div>
        </section>


    </main>

    <footer class="footer">

    </footer>

    <script src="https://kit.fontawesome.com/ad2be14d60.js" crossorigin="anonymous"></script>    
</body>
</html>