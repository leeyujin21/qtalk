<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/changeinfo.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script type="text/javascript" src="js/changeinfo.js"></script>
	<title>정보수정</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="jh-container">
		<div id="goback">
			<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
				style="width: 20px; margin-bottom: -2px;"> <a
				href="..\jeha\mypage.html">뒤로가기</a>
		</div>
		<form action="changeinfo" method="post">
			<div id="changeinfospace">
				<p>내 정보 수정</p>
				<div class="nicknametext">
					<label for="nickname" class="textlabel">닉네임</label>
					 <input	type="text" name="nickname" id="nickname" class="textinput" required="required">
					 <input type="button" id="nicknameduplication" value="중복확인">
				</div>
				<div class="passwordchange" style="margin-bottom: 10px;">
					<label for="password" class="textlabel">비밀번호 변경</label>
					<input type="password"  name="password1" class="textinput" required="required">
				</div>
				<div class="passwordchange">
					<label for="password" class="textlabel">비밀번호 확인</label>
					<input type="password" name="password2" class="textinput" required="required">
				</div>
				<div class="changeinfobtn">
					<input type="submit" value="수정" id="changeinfobtn">
					<input type="button" formaction="mypage" formmethod="get" value="취소"
						id="changeinfocancelbtn" onclick="location.href='mypage'">
				</div>
			</div>
		</form>
	</div>
</body>
</html>