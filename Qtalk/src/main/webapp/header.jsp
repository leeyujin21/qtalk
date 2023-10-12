<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/hj-style.css" rel="stylesheet">
</head>
<body>
	<header class="header">
		<div class="header-logo">
			<a href="main"><img src="logo.png" alt=""
				class="main-logo"></a>
		</div>
		<div class="nav-container">
			<nav class="header-nav">
				<ul class="nav-ul">
					<li class="nav-li"><a href="testschedule">시험일정</a></li>
					<li class="nav-li"><a href="calender">캘린더</a></li>
					<li class="nav-li dropdown">커뮤니티
						<div class="dropdown-content">
							<a href="freeboard">자유게시판</a> <a href="testboard">시험문제공유</a> <a href="onelineboardpost">시험
								한줄평</a>
						</div>
					</li>
				</ul>
			</nav>
			<nav class="header-nav">
				<ul class="nav-ul">
					<c:choose>
						<c:when test="${member eq Empty}">
							<li class="nav-li"><a href="login">로그인</a></li>
							<li class="nav-li"><a href="join">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-li"><a href="logout">로그아웃</a></li>
							<li class="nav-li bg-box"><a href="mypage">마이페이지</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	</header>
</body>
</html>