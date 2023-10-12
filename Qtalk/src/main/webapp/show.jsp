<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/show.css" rel="stylesheet" />
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