<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/deletemember.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script type="text/javascript" src="js/deletemember.js"></script>
	<title>Qtalk | 회원탈퇴</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="jh-container">
		<div id="goback">
			<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
				style="width: 20px; margin-bottom: -2px;"> <a
				href="mypage">뒤로가기</a>
		</div>
		<form action="deletemember" method="post">
			<div id="changeinfospace">
				<p>회원탈퇴</p>
				<div class="nicknametext">
					<label for="idshow" class="textlabel">아이디</label>
					<input type="text" name="id" id="nickname" class="textinput" value="${member.id}" readonly="readonly">
					 <%-- <input type="hidden" name="id" value="${member.id}"> --%>
				</div>
				<div class="passwordchange" style="margin-bottom: 10px;">
					<label for="password" class="textlabel">비밀번호</label>
					<input type="password"  name="password" class="textinput" required="required">
				</div>
				<div class="changeinfobtn">
					<input type="submit" value="탈퇴" id="changeinfobtn">
					<input type="button" formaction="mypage" formmethod="get" value="취소"
						id="changeinfocancelbtn" onclick="location.href='mypage'">
				</div>
			</div>
		</form>
	</div>
</body>
</html>