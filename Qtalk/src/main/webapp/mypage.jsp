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

#myinfo {
	padding-top: 30px;
	width: 60%;
	margin: 0 auto 0 auto;
}

hr {
	width: 60%;
	border: none;
	height: 3px;
	background-color: #DFE3EE;
}

#myinfo>p {
	height: 50px;
	margin: 0 auto 14.5px auto;
	padding-top: 31px;
	text-align: center;
	font-size: 2em;
	font-weight: bold;
}

.myinfodetail {
	display: flex;
	padding: 30px 20px 30px 20px;
	margin-bottom: 30px;
	border: 3px solid #DFE3EE;
}

#nickname {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 23px;
	font-weight: bold;
	width: 262px;
	height: 70px;
	border-radius: 66px;
	border: 3px solid #3B5998;
}

.idemail {
	font-size: 20px;
	margin-left: 50px;
	width: 800px;
}

.changeinfo {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 158px;
	height: 63px;
}

.changeinfo a {
	color: #8B9DC3;
	font-weight: bold;
	text-decoration: none;
	font-size: 16px;
}

.bookmark {
	width: 60%;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 50px;
}

.mywrite {
	width: 60%;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 80px;
}

.inputspace {
	margin-left: 100px;
	overflow-y: scroll;
}

.textinput {
	border: none;
	background: transparent;
	outline: none;
	font-size: 20px;
	color: black;
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
		<div id="myinfo">
			<p>마이페이지</p>
			<div class="myinfodetail">
				<div id="nickname">${member.nickname}</div>
				<div class="idemail">
					ID : <input type="text" class="textinput" value="${member.id}">
					<br>
					<br> Email : <input type="text" class="textinput" disabled
						value="${member.email}">
				</div>
				<div class="changeinfo">
					<a href="changeinfo">내 정보 수정</a>
				</div>
			</div>
		</div>
		<hr>
		<div class="bookmark">
			<h2>북마크</h2>
			<div id="bookmark" class="inputspace">
				<div>content</div>
				<div>content</div>
				<div>content</div>
				<div>content</div>
				<div>content</div>
				<div>content</div>
			</div>
		</div>
		<hr>
		<div class="mywrite">
			<h2>내가 쓴 글</h2>
			<div id="mywrite" class="inputspace">
				<div>content</div>
			</div>
		</div>
		<hr>
	</div>
</body>
<footer style="height: 100px;">
	<!--틀만 잡아뒀습니다.-->
</footer>
</body>
</html>