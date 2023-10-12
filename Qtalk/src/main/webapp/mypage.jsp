<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/mypage.css" rel="stylesheet" />
	<title>마이페이지</title>
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