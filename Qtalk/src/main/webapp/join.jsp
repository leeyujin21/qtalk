<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/join.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script type="text/javascript" src="js/join.js"></script>
	<title>회원가입</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="jh-container">
		<div id="goback">
			<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
				style="width: 20px; margin-bottom: -2px;"> <a
				href="..\index.html">뒤로가기</a>
		</div>
		<form action="join" method="post">
			<div id="joinspace">
				<p>회원가입</p>
				<div id="idtext">
					<label for="id" class="textlabel">아이디</label>
					<input type="text" name="id" id="id" class="textinput" required="required">
					<input type="button" id="idcheck" class="idduplicationbtn" value="중복확인">
				</div>
				<div id="passwordtext">
					<label for="password" class="textlabel">비밀번호</label>
					<input type="password" id="password1" name="password1" class="textinput" required="required">
				</div>
				<div id="passwordtext">
					<label for="password" class="textlabel">비밀번호 확인</label>
					<input type="password" id="password2" name="password2" class="textinput" required="required">
				</div>
				<div id="nicknametext">
					<label for="nickname" class="textlabel">닉네임</label>
					<input type="text" name="nickname" id="nickname" class="textinput" required="required">
					<input type="button" id="nicknameCheck" class="nicknameduplicationbtn" value="중복확인" >
				</div>
				<div id="emailtext">
					<label for="email" class="textlabel">이메일</label>
					<input type="email" name="email" id="email"class="textinput"  required="required">
					<input type="button" id="emailCheck" class="emailduplicationbtn" value="중복확인">
				</div>
				<div class="joinbtn">
					<input type="submit" id="joinbtn" value="회원가입" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>