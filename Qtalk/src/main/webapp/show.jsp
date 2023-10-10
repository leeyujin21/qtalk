<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

* {
	font-family: 'Pretendard-Regular';
}

a {
	text-decoration: none;
	color: black;
}

.header {
	height: 100px;
}

.jh-container {
	margin: 0 auto;
}

#goback {
	margin-left: 27%;
	display: flex;
	align-items: center;
	cursor: pointer;
}

#idshowspace {
	width: 60%;
	margin: 0 auto 0 auto;
	background-color: #FDFDFD;
}

#idshowspace>p {
	height: 50px;
	margin: 0 auto 14.5px auto;
	padding-top: 31px;
	text-align: center;
	font-size: 2em;
	font-weight: bold;
}

#idtext {
	width: 50%;
	height: 60px;
	margin: 0 auto 60px auto;
	border: 1px solid gainsboro;
	display: flex;
	align-items: center;
}

.textlabel {
	color: #000;
	font-size: 1.2em;
	font-weight: bold;
	text-align: center;
	line-height: normal;
	padding-right: 21px;
	padding-left: 10px;
}

.textinput {
	width: 95%;
	height: 90%;
	border: none;
	background: transparent;
	outline: none;
	font-size: 20px;
}

.gotologin {
	text-align: center;
}

#gotologin {
	border-radius: 10px;
	background: #3B5998;
	color: #FFF;
	border: none;
	width: 200px;
	height: 50px;
	font-weight: bold;
	font-size: 1.2em;
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="jh-container">
		<div id="goback">
			<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
				style="width: 20px; margin-bottom: -2px;"> <a
				href="..\index.html">뒤로가기</a>
		</div>
		<form action="login">
			<div id="idshowspace">
					<c:choose>
            			<c:when test="${password eq Empty}">
		            		<p>아이디</p>
							<div id="idtext" class="textcommon">
							<label for="id" class="textlabel" style="width: 100px;">아이디</label>
 			          	 	<input type="text" class="textinput" name="id" value="${id}" disabled>
 			          	 	</div>
						</c:when>
						<c:otherwise>
							<p>비밀번호</p>
							<div id="idtext" class="textcommon">
							<label for="password" class="textlabel" style="width: 100px;">비밀번호</label>
							<input type="text" class="textinput" name="password" value="${password}" disabled>
 			          	 	</div>
						</c:otherwise>
					</c:choose>
				
			</div>
			<div class="gotologin">
				<input type="submit" value="로그인하러 가기" id="gotologin">
			</div>
		</form>
	</div>
</body>
</html>