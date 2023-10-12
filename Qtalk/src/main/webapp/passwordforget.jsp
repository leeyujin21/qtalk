<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/passwordforget.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="jh-container">
		<div id="goback">
			<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
				style="width: 20px; margin-bottom: -2px;"> <a
				href="..\index.html">뒤로가기</a>
		</div>
		<form action="passwordforget" method="post">
			<div id="loginspace">
				<p>비밀번호 찾기</p>
				<div id="idtext" class="textcommon">
					<label for="id" class="textlabel" style="width: 100px;">아이디</label>
					<input type="text" class="textinput" name="id"
						placeholder="ex) kosta" required="required">
				</div>
				<div id="gmailtext" class="textcommon">
					<label for="email" class="textlabel" style="width: 100px;">이메일</label>
					<input type="email" class="textinput" name="email"
						placeholder="ex) kosta@kosta.com" required="required">
				</div>
				<div class="passwordforgetbtn">
					<input type="submit" value="비밀번호 찾기" id="passwordforgetbtn">
				</div>
			</div>
		</form>
		<div id="bottomspace">
			<a href="join" id="joinbtn">회원가입</a> <a href="idforget" id="idforget">ID 찾기</a>
		</div>
	</div>
</body>
</html>