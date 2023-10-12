<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/idforget.css" rel="stylesheet" />
	<title>아이디찾기</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="jh-container">
		<div id="goback">
			<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
				style="width: 20px; margin-bottom: -2px;"> <a
				href="..\index.html">뒤로가기</a>
		</div>
		<form action="idforget" method="post">
			<div id="loginspace">
				<p>아이디 찾기</p>
				<div id="gmailtext" class="textcommon">
					<label for="email" class="textlabel">이메일</label> <input type="email"
						class="textinput" name="email" placeholder="ex) kosta@kosta.com" required="required">
				</div>
			</div>
			<div class="idforgetbtn">
				<input type="submit" value="ID 찾기" id="idforgetbtn">
			</div>
		</form>
		<div id="bottomspace">
			<a href="join" id="joinbtn">회원가입</a> <a
				href="passwordforget" id="passwordforget">PW 찾기</a>
		</div>
	</div>
</body>
</html>