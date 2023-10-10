<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

#loginspace {
	width: 60%;
	margin: 0 auto 0 auto;
	background-color: #FDFDFD;
}

#loginspace>p {
	height: 50px;
	margin: 0 auto 14.5px auto;
	padding-top: 31px;
	text-align: center;
	font-size: 2em;
	font-weight: bold;
}

#gmailtext {
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
	width: 100px;
}

.textinput {
	width: 95%;
	height: 90%;
	border: none;
	background: transparent;
	outline: none;
	font-size: 20px;
}

.idforgetbtn {
	text-align: center;
}

#idforgetbtn {
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

#bottomspace {
	padding-top: 15px;
	text-align: center;
}

#bottomspace a {
	color: gainsboro;
	text-shadow: 0px 1px 1px gray;
	font-size: 0.9em;
	font-weight: bold;
	text-decoration: none;
}

#joinbtn {
	margin-right: 10px;
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